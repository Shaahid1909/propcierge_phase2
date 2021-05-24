
import UIKit


class ActionTableCell: UITableViewCell,UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate  {
   
    //Section - 0
    
    @IBOutlet weak var buyButton:UIButton!
    @IBOutlet weak var rentButton:UIButton!
 
    @IBOutlet weak var localityField:UITextField!

    @IBOutlet weak var choosecitytext: UITextField!

    @IBOutlet weak var rdownArrow:UIImageView!
    @IBOutlet weak var searchbutton:UIImageView!

    var realtyServiceController:RealtyServicesDelegate?
   
    var itemSelected = ""

    weak var pickerView: UIPickerView?
    let view = UIView()

    var city = ["Chennai", "Madurai", "Trichy", "Bangalore"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        deselectButton(button: rentButton)
        deselectButton(button: buyButton)
//        choosecitytext.rightView = rdownArrow
//        localityField.rightView = searchbutton
        localityField.delegate = self
        choosecitytext.setUpImage(imageName: "down_arrow", on: .right)
        localityField.setUpImage(imageName: "search", on: .right)
        selectedBackgroundView?.isHidden = true
        
        var pickerView = UIPickerView()
                pickerView.delegate = self
                pickerView.dataSource = self
        
     //   choosecitytext.inputView = pickerView
        choosecitytext.delegate = self
        let view = UIView()
        pickerView = UIPickerView(frame: CGRect(x: 0, y: 200, width: view.frame.width, height: 200))
        pickerView.backgroundColor = .white

        pickerView.showsSelectionIndicator = true
        pickerView.delegate = self
        pickerView.dataSource = self

        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = #colorLiteral(red: 0.2094888944, green: 0.6731480454, blue: 1, alpha: 1)
        toolBar.sizeToFit()

        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(self.donePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.donePicker))

        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true

        choosecitytext.inputView = pickerView
        choosecitytext.inputAccessoryView = toolBar
        
        HideKeyboard()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
          self.pickerView?.reloadAllComponents()
  
      }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    @objc func donePicker() {

        choosecitytext.resignFirstResponder()

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
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
           if choosecitytext.isFirstResponder{
               return city.count
           }
           return 0
       }

       func numberOfComponents(in pickerView: UIPickerView) -> Int {
           return 1
       }

       func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
           if choosecitytext.isFirstResponder{
               return city[row]
           }
           return nil
       }

       func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
           if choosecitytext.isFirstResponder{
               let itemselected = city[row]
            choosecitytext.text = itemselected
      //      choosecitytext.resignFirstResponder()
       
           
       }
    
       }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        localityField.resignFirstResponder()
        return false
    }
    
    
    func HideKeyboard() {
        let Tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self , action: #selector(DismissKeyboard))
        view.addGestureRecognizer(Tap)
    }
 
  //-------DismissKeyboard
    @objc func DismissKeyboard(){
        view.endEditing(true)
        
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
    @IBOutlet weak var bhkcount: UILabel!
    
    @IBOutlet weak var statview: UIView!
    @IBOutlet weak var stattypeview: UILabel!
    @IBOutlet weak var sqftcount: UILabel!
    
    
    
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
    @IBOutlet weak var propstatview: UIView!
    @IBOutlet weak var bhkcount: UILabel!
    @IBOutlet weak var cityname: UILabel!
    @IBOutlet weak var sqftsize: UILabel!
    
    @IBOutlet weak var proptype: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        propstatview.layer.cornerRadius = 8
        banner.layer.cornerRadius = 12
        selectedBackgroundView?.isHidden = true
   
    }
    

}
enum TextFieldImageSide {
    case left
    case right
}

extension UITextField {
    func setUpImage(imageName: String, on side: TextFieldImageSide) {
        let imageView = UIImageView(frame: CGRect(x: 10, y: 5, width: 25, height: 25))
        if let imageWithSystemName = UIImage(systemName: imageName) {
            imageView.image = imageWithSystemName
        } else {
            imageView.image = UIImage(named: imageName)
        }
        
        let imageContainerView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 35))
        imageContainerView.addSubview(imageView)
        
        switch side {
        case .left:
            leftView = imageContainerView
            leftViewMode = .always
        case .right:
            rightView = imageContainerView
            rightViewMode = .always
        }
    }
}
