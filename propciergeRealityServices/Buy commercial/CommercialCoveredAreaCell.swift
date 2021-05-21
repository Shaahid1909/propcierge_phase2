//
//  CommercialCoveredAreaCell.swift
//  propcierge_proj
//
//  Created by shaahid shamil on 12/05/21.
//

import UIKit

class CommercialCoveredAreaCell: UITableViewCell {

    @IBOutlet weak var sqftbtn: UIButton!
    @IBOutlet weak var sqyardbtn: UIButton!
    
    
    @IBAction func coveredareadelegateSegmentChange(_ sender:UIButton){
      
        if sender.tag == 13{
            sender.isSelected = false
            sqyardbtn.isSelected = false
            sqftbtn.setImage(UIImage(named: "radio_selected"), for: .normal)
            sqyardbtn.setImage(UIImage(named: "radio_unselected"), for: .normal)
        
  
        }else {
            sender.isSelected = true
            sqyardbtn.isSelected = false
           
           
            print("sqft cell button tapped")
        }
        
         if sender.tag == 14{
            sender.isSelected = false
            sqftbtn.isSelected = false
           
            sqyardbtn.setImage(UIImage(named: "radio_selected"), for: .normal)
            sqftbtn.setImage(UIImage(named: "radio_unselected"), for: .normal)
      
  
        
         } else {
            sender.isSelected = true
            sqyardbtn.isSelected = false
          
            print("sqyard cell button tapped")
         }
    }
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectedBackgroundView?.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
