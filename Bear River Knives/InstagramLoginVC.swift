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
    
    @IBOutlet weak var nextButton: UIButton!
    
    
    var projectImages = [String]()
    
    func unSignedRequest() {
        let authURL = String(format: "%@?client_id=%@&redirect_uri=%@&response_type=token&scope=%@&DEBUG=True", arguments: [INSTAGRAM_IDS.INSTAGRAM_AUTHURL,INSTAGRAM_IDS.INSTAGRAM_CLIENT_ID,INSTAGRAM_IDS.INSTAGRAM_REDIRECT_URI, INSTAGRAM_IDS.INSTAGRAM_SCOPE ])
        
        let urlRequest = URLRequest.init(url: URL.init(string: authURL)!)
        loginWebView.loadRequest(urlRequest)
    }
    func check(){
        if !projectImages.isEmpty {
            performSegue(withIdentifier: "showProjects", sender: self)
            
        }
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
        nextButton.isHidden = true
        loginActivityIndicator.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        loginActivityIndicator.isHidden = true
        nextButton.isHidden = false
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
        
        let urlString =  "https://api.instagram.com/v1/users/4167825185/media/recent/?access_token=" + authToken
        let urlRequest = URL(string: urlString)
        //print("\(urlRequest)")
        
        let task = URLSession.shared.dataTask(with: urlRequest!) { (data, response, error) in
            
            guard let data = data,
                 error == nil else{
                    if let error = error {
                        print("Error \(error.localizedDescription)")
                    }
                    return
            }
            //print(NSString(data: data, encoding: String.Encoding.utf8.rawValue) as Any)
            guard let raw = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers),
                let json = raw as? [String: AnyObject] else {
                return
            }
            self.projectImages = self.parseJSON(json: json)
        }
        task.resume()
    }
    
    
    func parseJSON(json: [String: AnyObject]) ->  [String]{
        var images = [String]()
        guard let jsonImages = json["data"] as? [[String: AnyObject]] else {
            return images
        }
        for jsonImage in jsonImages {
            guard let image = jsonImage["images"] as? [String: AnyObject],
            let imageRes = image["standard_resolution"] as? [String: AnyObject],
                let imageURL = imageRes["url"] as? String else {
                    return images
            }
            
            images.append(imageURL)
        }
        
        return images
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showProjects",
            let showP = segue.destination as? projectsVC{
            for item in projectImages {
                showP.pics.append(item)
            }
        }
    }
    @IBAction func nextTouched(_ sender: Any) {
        if !projectImages.isEmpty {
            performSegue(withIdentifier: "showProjects", sender: self)
        }
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
