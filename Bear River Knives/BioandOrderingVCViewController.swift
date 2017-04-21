//
//  BioandOrderingVCViewController.swift
//  Bear River Knives
//
//  Created by Student on 4/19/17.
//  Copyright © 2017 Ryan Garner USU. All rights reserved.
//

import UIKit

class BioandOrderingVCViewController: UIViewController {

    @IBOutlet weak var bioImage: UIImageView!
    @IBOutlet weak var bioText: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bioImage.image = UIImage(named: "jDimick")
        bioText.text = "My Name is Jordan and I love to make knives. I make custom knives for your custom lives. I am passionate about my knive and put a peice of my soul into each and every knife I create. If you are interested in a one of a kind custom knife please check out my facebook page at Bear River Knives and send me a message"
        // Do any additional setup after loading the view.
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
