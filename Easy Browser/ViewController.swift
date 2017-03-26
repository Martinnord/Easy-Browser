//
//  ViewController.swift
//  Easy Browser
//
//  Created by Martin Nordström on 2017-03-26.
//  Copyright © 2017 Martin Nordström. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView!
    
    override func loadView() {
        
        title = "Martin Nordström"
        
        webView = WKWebView()
        webView.navigationDelegate = self // When any web page navigation happens, please tell me
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: "https://martinnord.me/")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

