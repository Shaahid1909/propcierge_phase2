//
//  TypeRadioCell.swift
//  propcierge_proj
//
//  Created by shaahid shamil on 07/05/21.
//

import UIKit

class TypeRadioCell: UITableViewCell {

    @IBOutlet weak var residentialBtn: UIButton!
    
    @IBOutlet weak var commercialBtn: UIButton!
    
    @IBOutlet weak var landBtn: UIButton!
    
    var typecontrol:typeservicedelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectedBackgroundView?.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

      
    }
    
    
    @IBAction func typedelegateSegmentChange(_ sender:UIButton){
        typecontrol?.typechangeSegment(sender)
        if sender.tag == 3{
            sender.isSelected = false
            commercialBtn.isSelected = false
            landBtn.isSelected = false
            residentialBtn.setImage(UIImage(named: "radio_selected"), for: .normal)
            commercialBtn.setImage(UIImage(named: "radio_unselected"), for: .normal)
            landBtn.setImage(UIImage(named: "radio_unselected"), for: .normal)
  
        }else {
            sender.isSelected = true
            commercialBtn.isSelected = false
            landBtn.isSelected = false
           
            print("res cell button tapped")
        }
        
         if sender.tag == 4{
            sender.isSelected = false
            residentialBtn.isSelected = false
            landBtn.isSelected = false
            commercialBtn.setImage(UIImage(named: "radio_selected"), for: .normal)
            residentialBtn.setImage(UIImage(named: "radio_unselected"), for: .normal)
            landBtn.setImage(UIImage(named: "radio_unselected"), for: .normal)
  
            print("com cell button tapped")
         } else {
            sender.isSelected = true
            residentialBtn.isSelected = false
            landBtn.isSelected = false
            print("res cell button tapped")
         }
        
        if sender.tag == 5{
                sender.isSelected = false
                residentialBtn.isSelected = false
                commercialBtn.isSelected = false
                landBtn.setImage(UIImage(named: "radio_selected"), for: .normal)
                residentialBtn.setImage(UIImage(named: "radio_unselected"), for: .normal)
                commercialBtn.setImage(UIImage(named: "radio_unselected"), for: .normal)
                print("land cell button tapped")
                
            } else {
                sender.isSelected = true
                residentialBtn.isSelected = false
                commercialBtn.isSelected = false
                print("land cell button tapped")
                
            }

    }
    
    
//    @IBAction func ResidentialRadioBtn(_ sender: UIButton) {
//        if sender.isSelected {
//            sender.isSelected = false
//            commercialBtn.isSelected = false
//            landBtn.isSelected = false
//            
//        } else {
//            sender.isSelected = true
//            commercialBtn.isSelected = false
//            landBtn.isSelected = false
//            
//        }
//      
//    }
//    
//    @IBAction func CommercialRadioBtn(_ sender: UIButton) {
//        if sender.isSelected {
//            sender.isSelected = false
//            residentialBtn.isSelected = false
//            landBtn.isSelected = false
//            
//        } else {
//            sender.isSelected = true
//            residentialBtn.isSelected = false
//            landBtn.isSelected = false
//            
//        }
//        
//    }
//    
//    
//    @IBAction func LandRadioBtn(_ sender: UIButton) {
//        if sender.isSelected {
//            sender.isSelected = false
//            residentialBtn.isSelected = false
//            commercialBtn.isSelected = false
//            
//        } else {
//            sender.isSelected = true
//            residentialBtn.isSelected = false
//            commercialBtn.isSelected = false
//            
//        }
//    }
    
}
