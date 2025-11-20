//
//  Routable.swift
//  BMOApp
//
//  Created by Sahil ChowKekar on 11/20/25.
//

import Foundation

public protocol Routable {
    associatedtype Route
    func navigate(to route: Route)
}

