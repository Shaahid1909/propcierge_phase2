//
//  ShareButtonCell.swift
//  propciergeRealityServices
//
//  Created by shaahid shamil on 16/05/21.
//

import UIKit

class ShareButtonCell: UITableViewCell {

    @IBOutlet weak var searchbtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        searchbtn.layer.cornerRadius = 10
        selectedBackgroundView?.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
