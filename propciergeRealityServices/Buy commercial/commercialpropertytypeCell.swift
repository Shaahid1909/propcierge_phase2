//
//  commercialpropertytypeCell.swift
//  propcierge_proj
//
//  Created by shaahid shamil on 12/05/21.
//

import UIKit

class commercialpropertytypeCell: UITableViewCell {

    
    @IBOutlet weak var officespace: UIButton!
    @IBOutlet weak var commercialbuilding: UIButton!
    @IBOutlet weak var standaloneland: UIButton!
    @IBOutlet weak var warehouse: UIButton!
    @IBOutlet weak var industrialbuilding: UIButton!
    @IBOutlet weak var coworkingspace: UIButton!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectedBackgroundView?.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
