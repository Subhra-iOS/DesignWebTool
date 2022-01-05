//
//  WebToolModel.swift
//  DesignWebTool
//
//  Created by Subhra Roy on 09/12/21.
//

import Foundation
import UIKit

public struct WebToolModel: WebToolModelProtocol {
    var selector: String?
    var url: URL
    var header: [String: String]?
    var param: [String: Any]?
    var method: String
    let uiModel: UIModel
    
    
    public init(url: URL,
                header: [String: String]? = nil,
                param: [String: Any]? = nil,
                method: String,
                uiModel: UIModel = UIModel(navBarColor: UIColor.systemBackground, navBarTextColor: UIColor.secondarySystemBackground, dismissBtnText: "Back", navBarTitle: "Design Tool"),
                selector: String? = nil){
        self.url = url
        self.header = header
        self.param = param
        self.method = method
        self.uiModel = uiModel
        self.selector = selector
    }
}

public struct UIModel : UIModelProtocol{
    var navBarColor: UIColor
    var navBarTextColor: UIColor
    var dismissBtnText: String
    var navBarTitle: String
    
    public init(navBarColor: UIColor,
                navBarTextColor: UIColor,
                dismissBtnText: String,
                navBarTitle: String){
        
        self.navBarColor = navBarColor
        self.navBarTextColor = navBarTextColor
        self.dismissBtnText = dismissBtnText
        self.navBarTitle = navBarTitle
    }
}
