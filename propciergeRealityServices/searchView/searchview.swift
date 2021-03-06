//
//  searchview.swift
//  propciergeRealityServices
//
//  Created by shaahid shamil on 19/05/21.
//

import UIKit

class searchview: UIViewController,UITableViewDelegate,UITableViewDataSource {
   

    @IBOutlet weak var setableview: UITableView!
    
    @IBOutlet weak var bkBtn: UIButton!
    
    @IBAction func BackButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        setableview.delegate = self
        setableview.dataSource = self
        
     
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
                case 0: return 1
                case 1: return 11
                default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "sebarCell", for: indexPath) as! sebarCell
            
            return cell
            
            
        }else if indexPath.section == 1{
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchresulttablecell", for: indexPath) as! searchresulttablecell
        
        return cell
    
    }
      return UITableViewCell()
    }
 

}
