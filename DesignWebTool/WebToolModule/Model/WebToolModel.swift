//
//  WebToolModel.swift
//  DesignWebTool
//
//  Created by Subhra Roy on 09/12/21.
//

import Foundation

public struct WebToolModel {
     let url: URL
     let header: [String: String]?
     let param: [String: Any]?
     let method: String
    
    public init(url: URL, header: [String: String]? = nil, param: [String: Any]? = nil, method: String){
        self.url = url
        self.header = header
        self.param = param
        self.method = method
    }
}
