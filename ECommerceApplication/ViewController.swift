//
//  ViewController.swift
//  ECommerceApplication
//
//  Created by brn.developers on 4/26/19.
//  Copyright © 2019 Vivek. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return ""
        }else if section == 1{
            return "Free Apps"
        }else if section == 2{
            return "Paid Apps"
        }else{
            return "Trending Apps"
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 0
        }else{
        return 50
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            var cell = tableView.dequeueReusableCell(withIdentifier: "LogoTableViewCell", for: indexPath) as! LogoTableViewCell
            
            return cell
            
        }else if indexPath.section == 1{
        var cell = tableView.dequeueReusableCell(withIdentifier: "AppsTableViewCell", for: indexPath) as! AppsTableViewCell
        
        return cell
        }else if indexPath.section == 2{
            var cell = tableView.dequeueReusableCell(withIdentifier: "paidAppsTableViewCell", for: indexPath) as! paidAppsTableViewCell
            
            return cell
        }
        else{
            var cell = tableView.dequeueReusableCell(withIdentifier: "trendingAppsTableViewCell", for: indexPath) as! trendingAppsTableViewCell
            
            return cell
        }
    }

}

