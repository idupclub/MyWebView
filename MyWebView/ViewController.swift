//
//  ViewController.swift
//  MyWebView
//
//  Created by Chun Cao on 16/5/3.
//  Copyright © 2016年 NJU. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIWebViewDelegate{

    @IBOutlet weak var webView: UIWebView!
    
    @IBOutlet weak var urlText: UITextField!
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        webView.delegate = self
        urlText.delegate = self
        
        indicator.hidesWhenStopped = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func webViewDidStartLoad(_ webView: UIWebView) {
        self.indicator.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
            self.indicator.stopAnimating()
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let urlString = self.urlText.text{
            self.webView.loadRequest(URLRequest(url: URL(string: urlString)!))
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

