//
//  propertyDescriptionPageView.swift
//  propcierge_proj
//
//  Created by shaahid shamil on 11/05/21.
//

import UIKit

class propertyDescriptionPageView: UIViewController,UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource {
   
    let array = ["1","2","3","2","1","3","1"]
    
    @IBAction func backBt(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    @IBOutlet weak var tabview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tabview.delegate = self
        tabview.dataSource = self
      
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var height:CGFloat = CGFloat()
        if indexPath.row == 0 {
            height = 197
        }
        else if indexPath.row == 1{
            height = 327
        }else if indexPath.row == 2{
            height = 213
        }else if indexPath.row == 3{
            height = 233
        }else if indexPath.row == 4{
            height = 247
        }else if indexPath.row == 5{
            height = 214
        }else if indexPath.row == 6{
            height = 288
        }
        return height
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "propdescriptionpage", for: indexPath) as! PropertyDesPageTableCell
            return cell1
        }else if indexPath.row == 1 {
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "propdetaildesc", for: indexPath) as! PersonDetailsDescription
            return cell2
        }else if indexPath.row == 2{
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "detailscountCell", for: indexPath) as! detailscountCell
            return cell1
        }else if indexPath.row == 3 {
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "AmentiesCell", for: indexPath) as! AmentiesCell
            return cell2
        }else if indexPath.row == 4{
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "ReasonstobuyCell", for: indexPath) as! ReasonstobuyCell
            return cell1
        }else if indexPath.row == 5 {
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "photosCell", for: indexPath) as! photosCell
            cell2.propdesc.delegate = self
            cell2.propdesc.dataSource = self
            return cell2
        }else if indexPath.row == 6{
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "shareCell", for: indexPath) as! shareCell
            return cell1
        }
        return UITableViewCell()
    }
    

    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "prophotocell", for: indexPath) as! prophotosCollCell
        
        cell.imageV.image = UIImage(named: "\(array[indexPath.row])")
        
        return cell
    }

    
    
}
