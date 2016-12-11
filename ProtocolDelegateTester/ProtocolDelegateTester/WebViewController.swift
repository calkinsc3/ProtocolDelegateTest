//
//  WebViewController.swift
//  ProtocolDelegateTester
//
//  Created by William Calkins on 12/10/16.
//  Copyright © 2016 Calkins Computer Consulting. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {

    //private var webView = WKWebView()
    var requestURL = URL(string: "https://www.google.com")
    var webView: WKWebView!
    
    @IBOutlet var webViewContainer: UIView!
    @IBOutlet weak var activityView: UIView!

    override func loadView() {
        
        super.loadView()
        
        self.webView = WKWebView()
        self.webView.frame = self.webViewContainer.frame
        self.webView.sizeToFit()
        self.webViewContainer = self.webView
        
        self.view.addSubview(self.webViewContainer)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.webView.navigationDelegate = self
//        self.webViewContainer = self.webView
        self.webView.load(URLRequest(url: requestURL!))
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
