//
//  commercialNoOfseatsCell.swift
//  propcierge_proj
//
//  Created by shaahid shamil on 12/05/21.
//

import UIKit

class commercialNoOfseatsCell: UITableViewCell {
    @IBOutlet weak var minseats: UIButton!
    @IBOutlet weak var maxseats: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        minseats.layer.borderWidth = 0.4
        minseats.layer.borderColor = UIColor.lightGray.cgColor
        minseats.layer.cornerRadius = 4
        maxseats.layer.borderWidth = 0.4
        maxseats.layer.borderColor = UIColor.lightGray.cgColor
        maxseats.layer.cornerRadius = 4
        selectedBackgroundView?.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
