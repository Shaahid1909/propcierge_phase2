//
//  CategoryCell.swift
//  propcierge_proj
//
//  Created by shaahid shamil on 10/05/21.
//

import UIKit

class CategoryCell: UITableViewCell {

    @IBOutlet weak var newprojectBtn: UIButton!
    @IBOutlet weak var resaleBtn: UIButton!
    
    
    var categorycontrol:catdelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectedBackgroundView?.isHidden = true
    }

    @IBAction func categorydelegateSegmentChange(_ sender:UIButton){
        categorycontrol?.categorychangeSegment(sender)
        if sender.tag == 6{
            sender.isSelected = false
            resaleBtn.isSelected = false
            newprojectBtn.setImage(UIImage(named: "radio_selected"), for: .normal)
            resaleBtn.setImage(UIImage(named: "radio_unselected"), for: .normal)
        
  
        }else {
            sender.isSelected = true
            resaleBtn.isSelected = false
           
           
            print("newproj cell button tapped")
        }
        
         if sender.tag == 7{
            sender.isSelected = false
            newprojectBtn.isSelected = false
           
            resaleBtn.setImage(UIImage(named: "radio_selected"), for: .normal)
            newprojectBtn.setImage(UIImage(named: "radio_unselected"), for: .normal)
      
  
        
         } else {
            sender.isSelected = true
            newprojectBtn.isSelected = false
          
            print("resale cell button tapped")
         }
        


    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
