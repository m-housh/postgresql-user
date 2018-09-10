//
//  PopulateRoles.swift
//  PostgreSQLUser
//
//  Created by Michael Housh on 9/10/18.
//

import Vapor
import AuthUserCore
import FluentPostgreSQL


public struct PostgreSQLPopulateRoles: AnyPopulateRoles {
    
    public typealias Role = PostgreSQLRole
    public typealias Database = PostgreSQLDatabase
    
    public static func revert(on conn: PostgreSQLConnection) -> EventLoopFuture<Void> {
        return Role.revert(on: conn)
    }
}
