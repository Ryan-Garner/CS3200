//
//  Knives.swift
//  Bear River Knives
//
//  Created by Student on 4/21/17.
//  Copyright © 2017 Ryan Garner USU. All rights reserved.
//

import UIKit

class Knives: UIViewController {

    @IBOutlet weak var knifeTable: UITableView!
    
    var knifePics = ["bowie", "seax", "cleaver", "claymore", "kitchen"]
    var knifeDescription = ["A bowie knife great for camping", "A traditional Viking seax", "A cleaver good for chopping meat", "A Scottish claymore to bring into battle", "A kitchen knife"]
    let cellReuseIdentifier = "kCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        knifeTable.register(UINib(nibName: "knifeCell", bundle: nil), forCellReuseIdentifier: cellReuseIdentifier)
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
extension Knives: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return knifePics.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "kCell", for: indexPath) as! knifeCell
        cell.cellPic = knifePics[indexPath.row]
        cell.cellText = knifeDescription[indexPath.row]
        return cell
    }
}
