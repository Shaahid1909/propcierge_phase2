//
//  SearchViewController.swift
//  propcierge_proj
//
//  Created by shaahid shamil on 05/05/21.
//

import UIKit

class SearchViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {


    @IBOutlet weak var searchCollView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchCollView.delegate = self
        searchCollView.dataSource = self
        
    }
    
    @IBAction func backBtnTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "selectsearchview", sender: self)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 11
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = searchCollView.dequeueReusableCell(withReuseIdentifier: "searchCell", for: indexPath) as! searchCollCell
        return cell
    }
    

}
