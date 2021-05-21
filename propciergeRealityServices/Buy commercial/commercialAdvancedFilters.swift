//
//  commercialAdvancedFilters.swift
//  propcierge_proj
//
//  Created by shaahid shamil on 12/05/21.
//

import UIKit

class commercialAdvancedFilters: UITableViewCell {

    @IBOutlet weak var cparking: UIButton!
    @IBOutlet weak var cafeteria: UIButton!
    @IBOutlet weak var clift: UIButton!
    @IBOutlet weak var garden: UIButton!
    @IBOutlet weak var security: UIButton!
    @IBOutlet weak var powerbackup: UIButton!
    @IBOutlet weak var rera: UIButton!
    @IBOutlet weak var cfullfurnished: UIButton!
    @IBOutlet weak var csemifurniched: UIButton!
    @IBOutlet weak var cpartiallyfurnished: UIButton!
    @IBOutlet weak var immediate: UIButton!
    @IBOutlet weak var withinfifteendays: UIButton!
    @IBOutlet weak var withinthirtydays: UIButton!
    @IBOutlet weak var afterthirtydays: UIButton!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectedBackgroundView?.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
