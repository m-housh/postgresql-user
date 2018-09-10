//
//  Role.swift
//  PostgreSQLUser
//
//  Created by Michael Housh on 8/28/18.
//

import AuthUserCore
import FluentPostgreSQL


public final class PostgreSQLRole: PostgreSQLModel {
    public var id: Int?
    public var name: String
    
    public init(id: Int? = nil, name: String) {
        self.id = id
        self.name = name
    }
}

extension PostgreSQLRole: AnyRole {
    
    public typealias User = PostgreSQLUser
    
    var users: Siblings<PostgreSQLRole, PostgreSQLUser, PostgreSQLUserRole> {
        return siblings()
    }
}

extension PostgreSQLRole: Migration { }
