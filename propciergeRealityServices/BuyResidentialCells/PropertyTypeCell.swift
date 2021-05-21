//
//  PropertyTypeCell.swift
//  propcierge_proj
//
//  Created by shaahid shamil on 10/05/21.
//

import UIKit

class PropertyTypeCell: UITableViewCell {

    @IBOutlet weak var appartmentBtn: UIButton!
    @IBOutlet weak var independenthouseBtn: UIButton!
    @IBOutlet weak var gatedcommunityvillaBtn: UIButton!
    @IBOutlet weak var beachhouseBtn: UIButton!
    @IBOutlet weak var duplexBtn: UIButton!
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectedBackgroundView?.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
