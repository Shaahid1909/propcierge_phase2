//
//  prophotosCollCell.swift
//  propcierge_proj
//
//  Created by shaahid shamil on 11/05/21.
//

import UIKit

class prophotosCollCell: UICollectionViewCell {
    @IBOutlet weak var imageV: UIImageView!
    
    override func awakeFromNib() {
       super.awakeFromNib()
               
        imageV.layer.cornerRadius = 14
           
           
               }
}
