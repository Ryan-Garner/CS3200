//
//  ViewController.swift
//  Bear River Knives
//
//  Created by Jordan Dimick on 4/1/17.
//  Copyright © 2017 Ryan Garner USU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var main_table = ["Knives", "Bio and Ordering info", "Knife Discussions", "Instagram Pictures"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return main_table.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = main_table[indexPath.row]
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(main_table[indexPath.row] == "Knife Discussions"){
                self.performSegue(withIdentifier: "showLogin", sender: nil)
        }
        
        if(main_table[indexPath.row] == "Instagram Pictures"){
            self.performSegue(withIdentifier: "showInstaLogin", sender: nil)
        }
        
        if(main_table[indexPath.row] == "Bio and Ordering info"){
            self.performSegue(withIdentifier: "showBio", sender: nil)
        }
    }
}

