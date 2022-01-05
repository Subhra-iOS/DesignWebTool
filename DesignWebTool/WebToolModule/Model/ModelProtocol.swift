//
//  ModelProtocol.swift
//  DesignWebTool
//
//  Created by Subhra Roy on 11/12/21.
//

import Foundation
import UIKit

protocol WebToolModelProtocol{
    
    var url: URL { get set }
    var header: [String: String]? { get set }
    var param: [String: Any]? { get set }
    var method: String { get set }
    var selector: String? { get set }
    
}

protocol UIModelProtocol {
    var navBarColor: UIColor { get set }
    var navBarTextColor: UIColor { get set }
    var dismissBtnText: String { get set }
    var navBarTitle: String { get set }
}
