//
//  DesignWebToolViewController+Disposal.swift
//  DesignWebTool
//
//  Created by Subhra Roy on 09/12/21.
//

import Foundation

extension DesignWebToolViewController{
    
    func removeAllCacheCookies(){
        // Dispose of any resources that can be recreated.
        URLCache.shared.removeAllCachedResponses()
        // Delete any associated cookies
        if let cookies = HTTPCookieStorage.shared.cookies {
            for cookie in cookies {
                HTTPCookieStorage.shared.deleteCookie(cookie)
            }
        }
    }
    
    func removeHTTPCockies() {
        URLCache.shared.removeAllCachedResponses()
        URLCache.shared.diskCapacity = 0
        URLCache.shared.memoryCapacity = 0
        if let cookies = HTTPCookieStorage.shared.cookies {
            for cookie in cookies {
                HTTPCookieStorage.shared.deleteCookie(cookie)
            }
        }
    }
    
}
