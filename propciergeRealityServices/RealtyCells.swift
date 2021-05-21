
import UIKit


class ActionTableCell: UITableViewCell {//Section - 0
    
    @IBOutlet weak var buyButton:UIButton!
    @IBOutlet weak var rentButton:UIButton!
 
    @IBOutlet weak var localityField:UITextField!

    @IBOutlet weak var choosecitytext: UITextField!

    @IBOutlet weak var rdownArrow:UIImageView!
    @IBOutlet weak var searchbutton:UIImageView!

    var realtyServiceController:RealtyServicesDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        deselectButton(button: rentButton)
        deselectButton(button: buyButton)
        choosecitytext.rightView = rdownArrow
        localityField.rightView = searchbutton
        
        localityField.rightView = UIImageView(image: UIImage(named: "search"))
        selectedBackgroundView?.isHidden = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func delegateSegmentChange(_ sender:UIButton){
        realtyServiceController?.changeSegment(sender)
        deselectButton(button: buyButton)
        deselectButton(button: rentButton)
        sender.backgroundColor = #colorLiteral(red: 0.1018147841, green: 0.6851620674, blue: 0.9096405506, alpha: 1)
        sender.setTitleColor(.white, for: .normal)
        sender.layer.borderWidth = 0.0
    }
    
    func deselectButton(button:UIButton) {
        button.backgroundColor = .white
        button.setTitleColor(.systemGray2, for: .normal)
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.systemGray2.cgColor
    }
    
}

class PopularPicksTableCell: UITableViewCell { //Section - 1 Table Cell
    
 
    @IBOutlet weak var popularPicksCollectionView:UICollectionView!
    
    
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectedBackgroundView?.isHidden = true
    }

    
}

class PropertyCollectionCell: UICollectionViewCell { //Section - 1 Collection Cell
    
    @IBOutlet weak var banner:UIImageView!
    @IBOutlet weak var nameLabel:UILabel!
    @IBOutlet weak var priceLabel:UILabel!
    @IBOutlet weak var smallDescriptionLabel:UILabel!
    
    @IBOutlet weak var statview: UIView!
    @IBOutlet weak var stattypeview: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        statview.layer.cornerRadius = 8
        banner.layer.cornerRadius = 12
        selectedBackgroundView?.isHidden = true
    }
}



class PropertyTableCell: UITableViewCell { //Section - 2 Table Cell
    
    @IBOutlet weak var banner:UIImageView!
    @IBOutlet weak var nameLabel:UILabel!
    @IBOutlet weak var priceLabel:UILabel!
    @IBOutlet weak var smallDescriptionLabel:UILabel!
    @IBOutlet weak var typeSpecificationLabel:UILabel!
    @IBOutlet weak var propstatview: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        propstatview.layer.cornerRadius = 8
        banner.layer.cornerRadius = 12
        selectedBackgroundView?.isHidden = true
   
    }



}
