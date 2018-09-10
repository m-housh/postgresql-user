//
//  PostgreSQLRoleController.swift
//  PostgreSQLUser
//
//  Created by Michael Housh on 9/10/18.
//

import AuthUserCore
import Vapor


public final class PostgreSQLRoleController: AnyRoleController {
    
    public typealias RoleType = PostgreSQLRole

    public var path: [PathComponentsRepresentable]
    
    public var middleware: [Middleware]?
    
    public init(_ path: PathComponentsRepresentable..., using middleware: [Middleware]? = nil) {
        self.path = path
        self.middleware = middleware
    }
    
}
