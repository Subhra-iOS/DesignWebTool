//
//  NetworkConstant.swift
//  DesignWebTool
//
//  Created by Subhra Roy on 09/12/21.
//

import Foundation

enum NetworkError: Error{
    case invalid
    case nodata
    case success
}

protocol NetworkRequestProtocol {
    var httpRequest: URLRequest { get }
}

struct NetworkRequest: NetworkRequestProtocol {
    
     let url: URL
     let header: [String: String]
     let param: [String: Any]
     let method: String
    
    var httpRequest: URLRequest{
        
        let request = URLRequest(url: url, cachePolicy: URLRequest.CachePolicy.reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 120.0)
        
       /* request.httpBody = try? JSONSerialization.data(withJSONObject: param, options: JSONSerialization.WritingOptions.fragmentsAllowed)
        request.httpMethod = method.uppercased()
        request.allHTTPHeaderFields = header*/
        return request
    }
     
}


