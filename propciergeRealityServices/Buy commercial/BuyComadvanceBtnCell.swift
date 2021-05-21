//
//  BuyComadvanceBtnCell.swift
//  propciergeRealityServices
//
//  Created by shaahid shamil on 16/05/21.
//

import UIKit

class BuyComadvanceBtnCell: UITableViewCell {

    
    
    @IBOutlet weak var AdvancedFilters: UIButton!
    
    var comadvanceclick:buycomadvancecontrol?
    
    @IBAction func advancebtndelegate(_ sender:UIButton){
        comadvanceclick?.comadvanceaction(sender)
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
