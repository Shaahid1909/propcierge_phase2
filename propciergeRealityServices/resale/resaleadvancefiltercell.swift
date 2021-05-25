//
//  resaleadvancefiltercell.swift
//  propciergeRealityServices
//
//  Created by shaahid shamil on 17/05/21.
//

import UIKit

class resaleadvancefiltercell: UITableViewCell,UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {

    
    @IBOutlet weak var rparking: UIButton!
    @IBOutlet weak var rgymbtn: UIButton!
    @IBOutlet weak var rswimmingpoolbtn: UIButton!
    @IBOutlet weak var rclubhousebtn: UIButton!
    @IBOutlet weak var rpowerbackbtn: UIButton!
    @IBOutlet weak var rliftbtn: UIButton!
    @IBOutlet weak var rgardenbtn: UIButton!
    @IBOutlet weak var rsecuritybtn: UIButton!
    @IBOutlet weak var rvastucomplaintbtn: UIButton!
    @IBOutlet weak var rreraregbtn: UIButton!
    @IBOutlet weak var rpipedgasbtn: UIButton!
    @IBOutlet weak var rfurnishingfullbtn: UIButton!
    @IBOutlet weak var rfurnishingsemibtn: UIButton!
    
    @IBOutlet weak var rminrange: UITextField!
    
    @IBOutlet weak var rmaxrange: UITextField!
    
    @IBOutlet weak var lessthantwo: UIButton!
    @IBOutlet weak var lessthanthree: UIButton!
    @IBOutlet weak var lessthanfive: UIButton!
    @IBOutlet weak var lessthanthirty: UIButton!
    
    
    var itemSelected = ""

  
    weak var pickerView: UIPickerView?
    
    
 
    let rmin = [600,700,800,900,1000,1100]
    let rmax = [600,700,800,900,1000,1100]

    override func awakeFromNib() {
        super.awakeFromNib()
        rminrange.layer.borderWidth = 0.4
        rminrange.layer.borderColor = UIColor.lightGray.cgColor
        rminrange.layer.cornerRadius = 4
        rmaxrange.layer.borderWidth = 0.4
        rmaxrange.layer.borderColor = UIColor.lightGray.cgColor
        rmaxrange.layer.cornerRadius = 4
        selectedBackgroundView?.isHidden = true
        
        rminrange.setUpImage(imageName: "down_arrow", on: .right)
        rmaxrange.setUpImage(imageName: "down_arrow", on: .right)
        
        var pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        
     //   choosecitytext.inputView = pickerView
        rminrange.delegate = self
        rmaxrange.delegate = self
        
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

        rmaxrange.inputView = pickerView
        rmaxrange.inputAccessoryView = toolBar
        rminrange.inputView = pickerView
        rminrange.inputAccessoryView = toolBar
        
        
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
          self.pickerView?.reloadAllComponents()
  
      }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    @objc func donePicker() {
        if rminrange.isFirstResponder{
            rminrange.resignFirstResponder()
        }else if rmaxrange.isFirstResponder{
            rmaxrange.resignFirstResponder()
        }
    }

    
    func deselectButton(button:UIButton) {
        button.backgroundColor = .white
        button.setTitleColor(.systemGray2, for: .normal)
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.systemGray2.cgColor
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
           if rminrange.isFirstResponder{
               return rmin.count
           }else if rmaxrange.isFirstResponder{
            return rmax.count
           }
           return 0
       }

       func numberOfComponents(in pickerView: UIPickerView) -> Int {
           return 1
       }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if rminrange.isFirstResponder{
       //     print("The min amount is \(min[row])")
            return "\(rmin[row])"
            
        }else if rmaxrange.isFirstResponder{
         //   print("The min amount is \(max[row])")
         return "\(rmax[row])"
        }
           return nil
       }

       func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
           if rminrange.isFirstResponder{
               let itemselected = rmin[row]
            rminrange.text = "\(itemselected)"
           }
           else if rmaxrange.isFirstResponder{
            let itemselected = rmax[row]
            rmaxrange.text = "\(itemselected)"

           
       }
       }
}
