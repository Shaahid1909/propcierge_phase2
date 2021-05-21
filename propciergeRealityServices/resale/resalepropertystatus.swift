//
//  resalepropertystatus.swift
//  propciergeRealityServices
//
//  Created by shaahid shamil on 17/05/21.
//

import UIKit

class resalepropertystatus: UITableViewCell {

    @IBOutlet weak var underconstructionBtn: UIButton!
    
    @IBOutlet weak var readytomoveBtn: UIButton!

    
    @IBAction func resalestatusdelegateSegmentChange(_ sender:UIButton){
    
    if sender.tag == 11{
          sender.isSelected = false
        readytomoveBtn.isSelected = false
       underconstructionBtn.setImage(UIImage(named: "radio_selected"), for: .normal)
        readytomoveBtn.setImage(UIImage(named: "radio_unselected"), for: .normal)
      }else {
          sender.isSelected = true
        readytomoveBtn.isSelected = false
          print("under construction cell button tapped")
      }
      
       if sender.tag == 12{
          sender.isSelected = false
    underconstructionBtn.isSelected = false
         
        readytomoveBtn.setImage(UIImage(named: "radio_selected"), for: .normal)
          underconstructionBtn.setImage(UIImage(named: "radio_unselected"), for: .normal)
   
       } else {
          sender.isSelected = true
        readytomoveBtn.isSelected = false
        
          print("ready to move cell button tapped")
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
