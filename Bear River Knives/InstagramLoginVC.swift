//
//  InstagramLoginVC.swift
//  Bear River Knives
//
//  Created by Jordan Dimick on 4/18/17.
//  Copyright © 2017 Ryan Garner USU. All rights reserved.
//

import UIKit

class InstagramLoginVC: UIViewController, UIWebViewDelegate {

    
    @IBOutlet weak var loginWebView: UIWebView!
    @IBOutlet weak var loginActivityIndicator: UIActivityIndicatorView!
    
    func unSignedRequest() {
        let authURL = String(format: "%@?client_id=%@&redirect_uri=%@&response_type=token&scope=%@&DEBUG=True", arguments: [INSTAGRAM_IDS.INSTAGRAM_AUTHURL,INSTAGRAM_IDS.INSTAGRAM_CLIENT_ID,INSTAGRAM_IDS.INSTAGRAM_REDIRECT_URI, INSTAGRAM_IDS.INSTAGRAM_SCOPE ])
        
        let urlRequest = URLRequest.init(url: URL.init(string: authURL)!)
        loginWebView.loadRequest(urlRequest)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginWebView.delegate = self
        
        unSignedRequest()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        return checkRequestForCallbackURL(request: request)
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        loginActivityIndicator.isHidden = false
        loginActivityIndicator.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        loginActivityIndicator.isHidden = true
        loginActivityIndicator.stopAnimating()
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        webViewDidFinishLoad(webView)
    }
    
    func checkRequestForCallbackURL(request: URLRequest) -> Bool{
        let requestURLString = (request.url?.absoluteString)! as String
        
        if requestURLString.hasPrefix(INSTAGRAM_IDS.INSTAGRAM_REDIRECT_URI) {
            let range: Range<String.Index> = requestURLString.range(of: "#access_token=")!
            handleAuth(authToken: requestURLString.substring(from: range.upperBound))
            return false;
        }
        return true
    }
    
    func handleAuth(authToken: String) {
        print("Instagram authentication token ==", authToken)
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
