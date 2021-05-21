//
//  AdvancedFilterCell.swift
//  propcierge_proj
//
//  Created by shaahid shamil on 10/05/21.
//

import UIKit

class AdvancedFilterCell: UITableViewCell {
   
    @IBOutlet weak var parking: UIButton!
    @IBOutlet weak var gymbtn: UIButton!
    @IBOutlet weak var swimmingpoolbtn: UIButton!
    @IBOutlet weak var clubhousebtn: UIButton!
    @IBOutlet weak var powerbackbtn: UIButton!
    @IBOutlet weak var liftbtn: UIButton!
    @IBOutlet weak var gardenbtn: UIButton!
    @IBOutlet weak var securitybtn: UIButton!
    @IBOutlet weak var vastucomplaintbtn: UIButton!
    @IBOutlet weak var reraregbtn: UIButton!
    @IBOutlet weak var pipedgasbtn: UIButton!
    @IBOutlet weak var furnishingfullbtn: UIButton!
    @IBOutlet weak var furnishingsemibtn: UIButton!
    @IBOutlet weak var twentyonebtn: UIButton!
    @IBOutlet weak var twentytwobtn: UIButton!
    @IBOutlet weak var twentythreebtn: UIButton!
    @IBOutlet weak var twentyfourbtn: UIButton!
    
    
    
    
    
    @IBOutlet weak var minbuildarea: UIButton!
    
    @IBOutlet weak var maxbuildarea: UIButton!
    
        override func awakeFromNib() {
            
            super.awakeFromNib()
            minbuildarea.layer.borderWidth = 0.4
            minbuildarea.layer.borderColor = UIColor.lightGray.cgColor
            minbuildarea.layer.cornerRadius = 4
            maxbuildarea.layer.borderWidth = 0.4
            maxbuildarea.layer.borderColor = UIColor.lightGray.cgColor
            maxbuildarea.layer.cornerRadius = 4
            selectedBackgroundView?.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
