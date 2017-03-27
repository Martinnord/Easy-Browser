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
        
        webView = WKWebView()
        webView.navigationDelegate = self // When any web page navigation happens, please tell me
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(openTapped))

        /*let url = URL(string: "https://martinnord.me/")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true*/
    }
    
    func openTapped() {
        let ac = UIAlertController(title: "Open page…", message: nil, preferredStyle: .actionSheet)
        ac.popoverPresentationController?.barButtonItem = self.navigationItem.rightBarButtonItem
        ac.addAction(UIAlertAction(title: "martinnord.me", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "apple.com", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(ac, animated: true)
    }
    
    func openPage(action: UIAlertAction!) {
        
        let url = URL(string: "https://" + action.title!)!
        webView.load(URLRequest(url: url))
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

