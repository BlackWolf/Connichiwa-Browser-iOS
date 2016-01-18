//
//  ViewController.swift
//  Connichiwa Browser
//
//  Created by Mario Schreiner on 18/01/16.
//  Copyright © 2016 Mario Schreiner. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView!

    override func viewDidLoad() {
        //Set up WebView configuration
        let webViewConfig = WKWebViewConfiguration()
        webViewConfig.allowsInlineMediaPlayback = true
        webViewConfig.allowsAirPlayForMediaPlayback = true
        webViewConfig.allowsPictureInPictureMediaPlayback = true
        webViewConfig.requiresUserActionForMediaPlayback = false
        
        //Fire up the web view
        webView = WKWebView.init(frame: self.view.frame, configuration: webViewConfig)
        webView.navigationDelegate = self
        webView.allowsBackForwardNavigationGestures = true
        webView.allowsLinkPreview = true
        
        //We don't need anything else right now, so set up web view as our only fullscreen view
        self.view = webView;
        
        webView.loadRequest(NSURLRequest(URL: NSURL(string: "https://www.google.com")!))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    override func prefersStatusBarHidden() -> Bool {
        //make sure the status bar is hidden 
        //in the future, we might want to build a decent UI and set this to false, just like safari
        return true
    }
}

