//
//  WebToolViewModel.swift
//  DesignWebTool
//
//  Created by Subhra Roy on 09/12/21.
//

import Foundation


struct WebToolViewModel  {
    private let apiModel: WebToolModel
    
    init(apiModel: WebToolModel) {
        self.apiModel = apiModel /**Cannot assign to value: 'apiModel' is a 'let' constant, Add explicit 'self.' to refer to mutable property of 'WebToolViewModel'*/
    }
    
    var httpRequest: URLRequest{
        let network = NetworkRequest(url: self.apiModel.url, header: self.apiModel.header, param: self.apiModel.param, method: self.apiModel.method)
        return network.httpRequest
    }
    
}
