//
//  WebToolModel.swift
//  DesignWebTool
//
//  Created by Subhra Roy on 09/12/21.
//

import Foundation
import UIKit

public struct WebToolModel {
     let url: URL
     let header: [String: String]?
     let param: [String: Any]?
     let method: String
     let uiModel: UIModel
     
    
    public init(url: URL,
                header: [String: String]? = nil,
                param: [String: Any]? = nil,
                method: String,
                uiModel: UIModel = UIModel(navBarColor: UIColor.systemBackground, navBarTextColor: UIColor.secondarySystemBackground, dismissBtnText: "Back", navBarTitle: "Design Tool")){
        self.url = url
        self.header = header
        self.param = param
        self.method = method
        self.uiModel = uiModel
    }
}

public struct UIModel{
    let navBarColor: UIColor
    let navBarTextColor: UIColor
    let dismissBtnText: String
    let navBarTitle: String
    
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
