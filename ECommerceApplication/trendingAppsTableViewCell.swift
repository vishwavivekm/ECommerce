//
//  trendingAppsTableViewCell.swift
//  ECommerceApplication
//
//  Created by brn.developers on 4/26/19.
//  Copyright © 2019 Vivek. All rights reserved.
//

import UIKit
import SDWebImage

class trendingAppsTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var trendingAppsCollection: UICollectionView!
    var trendingApps:AppleApps!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        trendingAppsCollection.delegate = self
        trendingAppsCollection.dataSource = self
        
        getJSONData()
        
    }
    func getJSONData(){
        
        var url = URL(string: "https://rss.itunes.apple.com/api/v1/in/ios-apps/top-grossing/all/25/explicit.json")
        var URLReq = URLRequest(url: url!)
        URLSession.shared.dataTask(with: URLReq) { (data, response, err) in
            do{
                self.trendingApps = try JSONDecoder().decode(AppleApps.self, from: data!)
                DispatchQueue.main.async {
                    self.trendingAppsCollection.reloadData()
                }
            }
            catch{
                print(error)
            }
            }.resume()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trendingApps?.feed.title.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "trendingAppsCollectionViewCell", for: indexPath) as! trendingAppsCollectionViewCell
        
        cell.trendingAppsNames.text = trendingApps.feed.results[indexPath.row].name
        let imgURL = URL(string: (trendingApps?.feed.results[indexPath.row].artworkUrl100)!)
        cell.trendingAppsImage.sd_setImage(with: imgURL) { (response, error, type, url) in
            
        }
        return cell
    }


}
