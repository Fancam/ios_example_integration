//
//  DetailViewController.swift
//  FancamWebViewExample
//
//  Created by Neal Shail on 18/10/2016.
//  Copyright © 2016 Fancam. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {

    @IBOutlet weak var webViewContainer: UIView!
    @IBOutlet weak var detail: UINavigationItem!
    
    var fancam: Fancam?
    
    override func viewDidLayoutSubviews() {
        debugPrint("DetailViewController:viewDidLayoutSubviews")
        
        self.configureView()
        super.viewDidLayoutSubviews()
    }
    
    override func viewWillAppear( _ animated: Bool) {
        debugPrint("DetailViewController:viewWillAppear")
        
        // This is so the webview doesn't add a whitespace for the navigation bar
        self.automaticallyAdjustsScrollViewInsets = false
        
        super.viewWillAppear(animated)
    }
    
    
    func configureView() {
        
        debugPrint("DetailViewController:ConfigureView")
        
        if (self.fancam == nil){
            print("no fancam has been selectee")
            return;
        }
        
        
        let config = WKWebViewConfiguration()
        config.preferences.javaScriptEnabled = true;
        config.preferences.javaScriptCanOpenWindowsAutomatically = true;
            
        let webView = WKWebView(
            frame: webViewContainer.bounds,
            configuration: config
        )
            
        webView.backgroundColor = UIColor.clear
        webView.scrollView.backgroundColor = UIColor.clear
        
        webView.uiDelegate = self;
            
        webViewContainer.addSubview(webView)
            
        let url = NSURL(string: fancam!.url)
        let request = NSURLRequest(url: url as! URL)
        webView.load(request as URLRequest)
            
        detail.title = fancam!.title
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    /* WKUIDelegate */
    
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
       
        debugPrint("DetailViewController: webView(createWebView)", webView.url);
        
        let webView = WKWebView(
            frame: webViewContainer.bounds,
            configuration: configuration
        )
        
        webView.backgroundColor = UIColor.clear
        webView.scrollView.backgroundColor = UIColor.clear
        webView.uiDelegate = self;
        
        webViewContainer.addSubview(webView)
        
        return webView
    }

    func webViewDidClose(_ webView: WKWebView) {
        
        debugPrint("DetailViewController:webViewDidClose", webView.url)
        
        webView.removeFromSuperview();
    }
    
}

