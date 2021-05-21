//
//  resaleadvbtn.swift
//  propciergeRealityServices
//
//  Created by shaahid shamil on 17/05/21.
//

import UIKit

class resaleadvbtn: UITableViewCell {
    @IBOutlet weak var advancedButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectedBackgroundView?.isHidden = true
    }

    var resaladvanceclick:resaleadvancecontrol?
    
    @IBAction func advancechangetap(_ sender: UIButton) {
        resaladvanceclick?.resaleadvanceaction(sender)
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
