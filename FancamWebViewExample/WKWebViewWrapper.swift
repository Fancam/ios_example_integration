//
//  WKWebViewWrapper.swift
//  FancamWebViewExample
//
//  Created by Neal Shail on 19/10/2016.
//  Copyright © 2016 Fancam. All rights reserved.
//

import Foundation
import WebKit

/*class WKWebViewWrapper : NSObject, WKScriptMessageHandler{
    
    var wkWebView : WKWebView
    
    init(forWebView webView : WKWebView){
        wkWebView = webView
        super.init()
    }
    
    func userContentController(userContentController: WKUserContentController, didReceiveScriptMessage message: WKScriptMessage) {
        if let contentBody = message.body as? String{
            if let eventFunction = eventFunctions[message.name]{
                eventFunction(contentBody)
            }
        }
    }
    
    
    func setUpPlayerAndEventDelegation(){
        
        let controller = WKUserContentController()
        wkWebView.configuration.userContentController = controller
        
        for eventname in eventNames {
            controller.addScriptMessageHandler(self, name: eventname)
        }
    }
    
 
}*/
