//
//  knifeCell.swift
//  Bear River Knives
//
//  Created by Student on 4/21/17.
//  Copyright © 2017 Ryan Garner USU. All rights reserved.
//

import UIKit

class knifeCell: UITableViewCell {

    @IBOutlet weak var knifeImage: UIImageView!
    
    @IBOutlet weak var knifeText: UITextView!
    
    var cellPic: String?{
        didSet{
            updateUI()
                
            
        }
    }
    var cellText: String?{
        didSet{
            updateUI()
        }
    }
    
    func updateUI(){
        knifeImage.image = UIImage(named: cellPic!)
        knifeText.text = cellText
    }
    
}
