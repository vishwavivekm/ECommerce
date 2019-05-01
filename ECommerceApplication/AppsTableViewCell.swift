//
//  AppsTableViewCell.swift
//  ECommerceApplication
//
//  Created by brn.developers on 4/26/19.
//  Copyright © 2019 Vivek. All rights reserved.
//

import UIKit
import SDWebImage

class AppsTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource{
    
    @IBOutlet weak var appsCollection: UICollectionView!
    var freeApps:AppleApps!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        appsCollection.delegate = self
        appsCollection.dataSource = self
        getJSONData()
    }
    
    func getJSONData(){
       
        var url = URL(string: "https://rss.itunes.apple.com/api/v1/in/ios-apps/top-free/all/25/explicit.json")
        var URLReq = URLRequest(url: url!)
        URLSession.shared.dataTask(with: URLReq) { (data, response, err) in
            do{
                self.freeApps = try JSONDecoder().decode(AppleApps.self, from: data!)
                DispatchQueue.main.async {
                    self.appsCollection.reloadData()
                }
            }
            catch{
                print(error)
            }
            }.resume()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return freeApps?.feed.title.count ?? 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AppsCollectionViewCell", for: indexPath) as! AppsCollectionViewCell
        
        cell.appsName.text = freeApps.feed.results[indexPath.row].name
        let imgURL = URL(string: ((freeApps?.feed.results[indexPath.row].artworkUrl100)!))
        cell.appsImage.sd_setImage(with: imgURL) { (response, error, type, url) in
            
        }
        return cell
    }
    
}
