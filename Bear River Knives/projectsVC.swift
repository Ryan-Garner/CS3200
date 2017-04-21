//
//  projectsVC.swift
//  Bear River Knives
//
//  Created by Student on 4/19/17.
//  Copyright © 2017 Ryan Garner USU. All rights reserved.
//

import UIKit

class projectsVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var pics = [String]()
    var caps = [String]()
    let cellReuseIdentifier = "cCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: cellReuseIdentifier)
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

extension projectsVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! CustomCell
        cell.currIndexPath = indexPath
        print(pics[indexPath.row])
        cell.cellImage = pics[indexPath.row]
        cell.cellCaption = caps[indexPath.row]
        return cell
    }
}
