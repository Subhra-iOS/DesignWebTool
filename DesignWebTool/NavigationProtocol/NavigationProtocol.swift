//
//  NavigationProtocol.swift
//  DesignWebTool
//
//  Created by Subhra Roy on 09/12/21.
//

import Foundation

public protocol NavigationProtocol: NSObjectProtocol{
    func popViewController(on: Status, data: Data?)
    func didBackNavigation()
}
