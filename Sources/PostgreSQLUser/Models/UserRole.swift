//
//  UserRole.swift
//  PostgreSQLUser
//
//  Created by Michael Housh on 8/28/18.
//

import AuthUserCore
import FluentPostgreSQL


public final class PostgreSQLUserRole: PostgreSQLPivot, AnyUserRole {
   
    public typealias User = PostgreSQLUser
    public typealias Left = User
    public typealias Right = User.Role
    
    public var id: Int?
    public var userID: UUID
    public var roleID: Int
    
    public init(_ user: PostgreSQLUserRole.Left, _ role: PostgreSQLUserRole.Right) throws {
        self.userID = try user.requireID()
        self.roleID = try role.requireID()
    }
}

extension PostgreSQLUserRole: Migration { }
