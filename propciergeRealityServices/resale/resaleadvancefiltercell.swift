//
//  resaleadvancefiltercell.swift
//  propciergeRealityServices
//
//  Created by shaahid shamil on 17/05/21.
//

import UIKit

class resaleadvancefiltercell: UITableViewCell {

    
    @IBOutlet weak var rparking: UIButton!
    @IBOutlet weak var rgymbtn: UIButton!
    @IBOutlet weak var rswimmingpoolbtn: UIButton!
    @IBOutlet weak var rclubhousebtn: UIButton!
    @IBOutlet weak var rpowerbackbtn: UIButton!
    @IBOutlet weak var rliftbtn: UIButton!
    @IBOutlet weak var rgardenbtn: UIButton!
    @IBOutlet weak var rsecuritybtn: UIButton!
    @IBOutlet weak var rvastucomplaintbtn: UIButton!
    @IBOutlet weak var rreraregbtn: UIButton!
    @IBOutlet weak var rpipedgasbtn: UIButton!
    @IBOutlet weak var rfurnishingfullbtn: UIButton!
    @IBOutlet weak var rfurnishingsemibtn: UIButton!
    @IBOutlet weak var rminrange: UIButton!
    @IBOutlet weak var rmaxrange: UIButton!
    @IBOutlet weak var lessthantwo: UIButton!
    @IBOutlet weak var lessthanthree: UIButton!
    @IBOutlet weak var lessthanfive: UIButton!
    @IBOutlet weak var lessthanthirty: UIButton!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        rminrange.layer.borderWidth = 0.4
        rminrange.layer.borderColor = UIColor.lightGray.cgColor
        rminrange.layer.cornerRadius = 4
        rmaxrange.layer.borderWidth = 0.4
        rmaxrange.layer.borderColor = UIColor.lightGray.cgColor
        rmaxrange.layer.cornerRadius = 4
        selectedBackgroundView?.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
