//
//  FactoryController.swift
//  DesignWebTool
//
//  Created by Subhra Roy on 09/12/21.
//

import Foundation
import UIKit
import WebKit

struct FactoryController {
    
    static func creatLeftBarItem(for action: SRBarButtonItemProtocol, title: String, tintColor: UIColor) -> SRNavigationButtonItem{
        let cancelBtn: SRNavigationButtonItem = SRNavigationButtonItem(backBarItemTitle: title, actionDelegate: action as! UIViewController, textColor: tintColor)
        return cancelBtn
    }
    
    static func creatWebKitView(for handler: WKNavigationDelegate, selector: String) -> WKWebView{
        let contentController = WKUserContentController()
        contentController.add(handler as! WKScriptMessageHandler, name: selector)
        
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.userContentController = contentController
        let webViewServiceDetails = WKWebView(frame: .zero, configuration: webConfiguration)
        webViewServiceDetails.navigationDelegate = handler
        
        return webViewServiceDetails
    }
    
}
