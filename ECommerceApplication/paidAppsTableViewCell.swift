//
//  paidAppsTableViewCell.swift
//  ECommerceApplication
//
//  Created by brn.developers on 4/26/19.
//  Copyright © 2019 Vivek. All rights reserved.
//

import UIKit
import SDWebImage

class paidAppsTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    @IBOutlet weak var paidAppsCollection: UICollectionView!
    var paidApps:AppleApps!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        paidAppsCollection.delegate = self
        paidAppsCollection.dataSource = self
        
        getJSONData()
    }
    func getJSONData(){
        
        var url = URL(string: "https://rss.itunes.apple.com/api/v1/in/ios-apps/top-paid/all/25/explicit.json")
        var URLReq = URLRequest(url: url!)
        URLSession.shared.dataTask(with: URLReq) { (data, response, err) in
            do{
                self.paidApps = try JSONDecoder().decode(AppleApps.self, from: data!)
                DispatchQueue.main.async {
                    self.paidAppsCollection.reloadData()
                }
            }
            catch{
                print(error)
            }
            }.resume()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return paidApps?.feed.title.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "paidAppsCollectionViewCell", for: indexPath) as! paidAppsCollectionViewCell
        
        cell.paidAppsName.text = paidApps.feed.results[indexPath.row].name
        let imgURL = URL(string: (paidApps?.feed.results[indexPath.row].artworkUrl100)!)
        cell.paidAppsImage.sd_setImage(with: imgURL) { (response, error, type, url) in
            
        }
        return cell
    }


}
