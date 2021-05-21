//
//  CommercialPriceRangeCell.swift
//  propcierge_proj
//
//  Created by shaahid shamil on 12/05/21.
//

import UIKit

class CommercialPriceRangeCell: UITableViewCell {

    @IBOutlet weak var minpricerange: UIButton!
    @IBOutlet weak var maxpricerange: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        minpricerange.layer.borderWidth = 0.4
        minpricerange.layer.borderColor = UIColor.lightGray.cgColor
        minpricerange.layer.cornerRadius = 4
        maxpricerange.layer.borderWidth = 0.4
        maxpricerange.layer.borderColor = UIColor.lightGray.cgColor
        maxpricerange.layer.cornerRadius = 4
        selectedBackgroundView?.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
