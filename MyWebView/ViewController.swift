//
//  ViewController.swift
//  MyWebView
//
//  Created by Chun Cao on 16/5/3.
//  Copyright © 2016年 NJU. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, UITextFieldDelegate, WKNavigationDelegate{

    @IBOutlet weak var toolBar: UIToolbar!
    
    var webView=WKWebView()
    
    @IBOutlet weak var urlText: UITextField!
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.addSubview(webView)
        

        webView.translatesAutoresizingMaskIntoConstraints=false
        webView.topAnchor.constraint(equalTo: urlText.bottomAnchor).isActive = true
        webView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        webView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        webView.bottomAnchor.constraint(equalTo: toolBar.topAnchor).isActive = true
        
        webView.layer.zPosition = -1
        
        webView.navigationDelegate = self
        
        urlText.delegate = self
        
        indicator.hidesWhenStopped = true
        
//        UIApplication.shared.isNetworkActivityIndicatorVisible = true

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        self.indicator.startAnimating()

    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            decisionHandler(WKNavigationActionPolicy.allow);
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.indicator.stopAnimating()

    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let urlString = self.urlText.text{
            self.webView.load(URLRequest(url: URL(string: urlString)!))
        }
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func doRefresh(_ sender: AnyObject) {
        webView.reload()
    }
    @IBAction func doStop(_ sender: AnyObject) {
        webView.stopLoading()
    }
    @IBAction func doBack(_ sender: AnyObject) {
        webView.goBack()
    }
    @IBAction func doForward(_ sender: AnyObject) {
        webView.goForward()
    }
}

