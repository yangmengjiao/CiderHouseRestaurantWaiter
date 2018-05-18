//
//  URLComponentsHelper.swift
//  RestfulAPIDemo
//
//  Created by mengjiao on 5/16/18.
//  Copyright © 2018 mengjiao. All rights reserved.
//

import Foundation

class URLHelper {
    static let sharedInstance = URLHelper()
    public var urlComponenets = URLComponents()
    private init() {
        urlComponenets.scheme = "http"
        //  urlComponenets.host = "10.10.51.59"
        urlComponenets.host = "172.19.141.15"
        urlComponenets.port = 5555
    }
    
    func getLoginURL() -> URL? {
        urlComponenets.path = "/api/account/login"
        return urlComponenets.url
    }
    
    func getAddOrderURL() -> URL? {
        urlComponenets.path = "/api/order/SaveNewOrder"//我直接copy"api/Order/SaveNewOrder"from API导致我调试了很久。表面上一样的文字实际上不一样
        return urlComponenets.url
    }
    
}
