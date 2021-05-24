//
//  PropertyDesPageTableCell.swift
//  propcierge_proj
//
//  Created by shaahid shamil on 11/05/21.
//

import UIKit

class PropertyDesPageTableCell: UITableViewCell {

    @IBOutlet weak var propname: UILabel!
    @IBOutlet weak var proplocality: UILabel!
    @IBOutlet weak var propposteddate: UILabel!
    @IBOutlet weak var propbhkcount: UILabel!
    @IBOutlet weak var propsqft: UILabel!
    @IBOutlet weak var proptype: UILabel!
    @IBOutlet weak var propprice: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
class PersonDetailsDescription: UITableViewCell {

    @IBOutlet weak var ownerdescription: UITextView!
    @IBOutlet weak var ownername: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
class detailscountCell: UITableViewCell {

    @IBOutlet weak var bathroomview: UIView!
    @IBOutlet weak var appartmentview: UIView!
    @IBOutlet weak var availableview: UIView!
    @IBOutlet weak var propertyidview: UIView!
    @IBOutlet weak var bedroomview: UIView!
    
    @IBOutlet weak var bhkcount: UILabel!
    @IBOutlet weak var bathroomcount: UILabel!
    @IBOutlet weak var buildingtype: UILabel!
    @IBOutlet weak var availability: UILabel!
    @IBOutlet weak var propertyid: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        bathroomview.layer.borderWidth = 0.5
        bathroomview.layer.borderColor = #colorLiteral(red: 0.1018147841, green: 0.6851620674, blue: 0.9096405506, alpha: 1)
        bathroomview.layer.cornerRadius = 10
        appartmentview.layer.borderWidth = 0.5
        appartmentview.layer.borderColor = #colorLiteral(red: 0.1018147841, green: 0.6851620674, blue: 0.9096405506, alpha: 1)
        appartmentview.layer.cornerRadius = 10
        availableview.layer.borderWidth = 0.5
        availableview.layer.borderColor = #colorLiteral(red: 0.1018147841, green: 0.6851620674, blue: 0.9096405506, alpha: 1)
        availableview.layer.cornerRadius = 10
        propertyidview.layer.borderWidth = 0.5
        propertyidview.layer.borderColor = #colorLiteral(red: 0.1018147841, green: 0.6851620674, blue: 0.9096405506, alpha: 1)
        propertyidview.layer.cornerRadius = 10
        bedroomview.layer.borderWidth = 0.5
        bedroomview.layer.borderColor = #colorLiteral(red: 0.1018147841, green: 0.6851620674, blue: 0.9096405506, alpha: 1)
        bedroomview.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

class AmentiesCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
class ReasonstobuyCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
class photosCell: UITableViewCell {


    
    @IBOutlet weak var propdesc: UICollectionView!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
class shareCell: UITableViewCell {
    @IBOutlet weak var shareBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        shareBtn.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    
    
    

}
