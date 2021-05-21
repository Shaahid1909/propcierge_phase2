//
//  BuiltupareaCell.swift
//  propcierge_proj
//
//  Created by shaahid shamil on 12/05/21.
//

import UIKit

class BuiltupareaCell: UITableViewCell {
    @IBOutlet weak var minAmtBtn: UIButton!
    @IBOutlet weak var maxAmtBtn: UIButton!
    
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
