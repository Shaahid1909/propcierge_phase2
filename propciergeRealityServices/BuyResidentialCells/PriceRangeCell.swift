//
//  PriceRangeCell.swift
//  propcierge_proj
//
//  Created by shaahid shamil on 10/05/21.
//

import UIKit

class PriceRangeCell: UITableViewCell {

    @IBOutlet weak var minAmtBtn: UITextField!
    @IBOutlet weak var maxAmtBtn: UITextField!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        minAmtBtn.layer.borderWidth = 0.4
        minAmtBtn.layer.borderColor = UIColor.lightGray.cgColor
        minAmtBtn.layer.cornerRadius = 4
        maxAmtBtn.layer.borderWidth = 0.4
        maxAmtBtn.layer.borderColor = UIColor.lightGray.cgColor
        maxAmtBtn.layer.cornerRadius = 4
        selectedBackgroundView?.isHidden = true

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
