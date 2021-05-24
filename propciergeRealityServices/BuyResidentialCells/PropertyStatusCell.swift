//
//  PropertyStatusCell.swift
//  propcierge_proj
//
//  Created by shaahid shamil on 10/05/21.
//

import UIKit

class PropertyStatusCell: UITableViewCell {

    @IBOutlet weak var underconstructionBtn: UIButton!
    
    
    @IBOutlet weak var newlaunch: UIButton!

    
    
    @IBAction func categorydelegateSegmentChange(_ sender:UIButton){
      
        if sender.tag == 11{
            sender.isSelected = false
            newlaunch.isSelected = false
            underconstructionBtn.setImage(UIImage(named: "radio_selected"), for: .normal)
            newlaunch.setImage(UIImage(named: "radio_unselected"), for: .normal)
        
  
        }else {
            sender.isSelected = true
            underconstructionBtn.isSelected = false
           
           
            print("under construction cell button tapped")
        }
        
         if sender.tag == 12{
            sender.isSelected = false
            underconstructionBtn.isSelected = false
           
            newlaunch.setImage(UIImage(named: "radio_selected"), for: .normal)
            underconstructionBtn.setImage(UIImage(named: "radio_unselected"), for: .normal)
      
  
        
         } else {
            sender.isSelected = true
            newlaunch.isSelected = false
          
            print("new launch cell button tapped")
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
