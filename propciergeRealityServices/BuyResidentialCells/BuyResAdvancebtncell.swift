//
//  BuyResAdvancebtncell.swift
//  propciergeRealityServices
//
//  Created by shaahid shamil on 16/05/21.
//

import UIKit

class BuyResAdvancebtncell: UITableViewCell {

    @IBOutlet weak var AdvancedFilters: UIButton!
    
    var advanceclick:buyresadvancecontrol?
    @IBAction func advancebtndelegate(_ sender:UIButton){
        advanceclick?.advanceaction(sender)
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
