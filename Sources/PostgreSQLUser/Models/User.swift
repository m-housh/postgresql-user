//
//  User.swift
//  PostgreSQLUser
//
//  Created by Michael Housh on 8/28/18.
//

import FluentPostgreSQL
import AuthUserCore
import Authentication


public final class PostgreSQLUser: PostgreSQLUUIDModel {
    
    public var id: UUID?
    public var username: String
    public var password: String
    public var email: String?
    
    public init(id: UUID? = nil, username: String, password: String, email: String? = nil) {
        self.id = id
        self.username = username
        self.email = email
        self.password = password
    }
}

extension PostgreSQLUser: AnyUser {
    
    public typealias UserRole = PostgreSQLUserRole
    public typealias Role = PostgreSQLRole
    
    public var roles: Siblings<PostgreSQLUser, PostgreSQLRole, PostgreSQLUserRole> {
        return siblings()
    }
    
    public func attachRole(_ role: CustomStringConvertible, on conn: DatabaseConnectable) throws -> EventLoopFuture<PostgreSQLUser> {
        
        return try hasRole(role, on: conn).flatMap { hasRole in
            if hasRole == false {
                return try Role.findOrCreate(role.description, on: conn).flatMap { role in
                    return self.roles.attach(role, on: conn)
                    }
                    .transform(to: self)
            }
            return conn.future(self)
        }
    }
}

extension PostgreSQLUser: BasicAuthenticatable, PasswordAuthenticatable { }

extension PostgreSQLUser: Migration { }
