//
//  bhkCell.swift
//  propcierge_proj
//
//  Created by shaahid shamil on 10/05/21.
//

import UIKit

class bhkCell: UITableViewCell {

    @IBOutlet weak var onerkBtn: UIButton!
    @IBOutlet weak var twobhkBtn: UIButton!
    @IBOutlet weak var twofivebhkBtn: UIButton!
    @IBOutlet weak var threebhkbtn: UIButton!
    @IBOutlet weak var fourbhkBtn: UIButton!
    @IBOutlet weak var fivebhkBtn: UIButton!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectedBackgroundView?.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
