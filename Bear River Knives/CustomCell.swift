//
//  CustomCell.swift
//  Bear River Knives
//
//  Created by Student on 4/19/17.
//  Copyright © 2017 Ryan Garner USU. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    
    @IBOutlet weak var projectImage: UIImageView!
    @IBOutlet weak var projectText: UITextView!
    
    var currIndexPath: IndexPath? {
        didSet {
            updateUI()
        }
    }
    
    var cellImage: String?{
        didSet{
            updateUI()
        }
    }
    
    var cellCaption: String?{
        didSet{
            updateUI()
        }
    }
    
    func updateUI() {
        projectText.text = cellCaption
        if let urlString = cellImage {
            downLoadImage(urlString: urlString)
        }else{
            return
        }
    }
    
    func downLoadImage(urlString: String){
        if let url = URL(string: urlString ) {
            let task = URLSession.shared.dataTask(with: url) {
                (data, response, error) in
                guard let data = data, error == nil else {
                    return
                }
                DispatchQueue.main.async {
                    self.projectImage.image = UIImage(data: data)
                }
            }
            task.resume()
        }
    }
}
