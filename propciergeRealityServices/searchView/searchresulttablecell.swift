//
//  searchresulttablecell.swift
//  propciergeRealityServices
//
//  Created by shaahid shamil on 19/05/21.
//

import UIKit

class searchresulttablecell: UITableViewCell {

    @IBOutlet weak var seImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        seImg.layer.cornerRadius = 12
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
