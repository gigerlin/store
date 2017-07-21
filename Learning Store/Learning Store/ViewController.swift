//
//  ViewController.swift
//  Learning Store
//
//  Created by Nokia EDU on 03/07/2017.
//  Copyright © 2017 Nokia. All rights reserved.
//

import WebKit

class ViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {
    
    var webView: WKWebView!
    
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        
        let otherView = WKWebView(frame: .zero, configuration: configuration)
        otherView.uiDelegate = self
        otherView.navigationDelegate = self
        otherView.allowsBackForwardNavigationGestures = true
        view = otherView
        
        return otherView
    }
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.preferences.javaScriptEnabled = true
        webConfiguration.preferences.javaScriptCanOpenWindowsAutomatically = true
        
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.allowsBackForwardNavigationGestures = true
        webView.uiDelegate = self
        webView.navigationDelegate = self
        
        view = webView
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string: "http://learningstore.nokia.com")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        webView.allowsBackForwardNavigationGestures = true
    }
}
