//
//  AdvancedFilterCell.swift
//  propcierge_proj
//
//  Created by shaahid shamil on 10/05/21.
//

import UIKit

class AdvancedFilterCell: UITableViewCell,UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
   
    @IBOutlet weak var parking: UIButton!
    @IBOutlet weak var gymbtn: UIButton!
    @IBOutlet weak var swimmingpoolbtn: UIButton!
    @IBOutlet weak var clubhousebtn: UIButton!
    @IBOutlet weak var powerbackbtn: UIButton!
    @IBOutlet weak var liftbtn: UIButton!
    @IBOutlet weak var gardenbtn: UIButton!
    @IBOutlet weak var securitybtn: UIButton!
    @IBOutlet weak var vastucomplaintbtn: UIButton!
    @IBOutlet weak var reraregbtn: UIButton!
    @IBOutlet weak var pipedgasbtn: UIButton!
    @IBOutlet weak var furnishingfullbtn: UIButton!
    @IBOutlet weak var furnishingsemibtn: UIButton!
    @IBOutlet weak var twentyonebtn: UIButton!
    @IBOutlet weak var twentytwobtn: UIButton!
    @IBOutlet weak var twentythreebtn: UIButton!
    @IBOutlet weak var twentyfourbtn: UIButton!
    
    
    var itemSelected = ""

    weak var pickerView: UIPickerView?
    
    let minbuild = Array(600...1000).map { $0 }
    let maxbuild = Array(1100...2000).map { $0 }
    
    @IBOutlet weak var minbuildarea: UITextField!
    
    @IBOutlet weak var maxbuildarea: UITextField!
  
        override func awakeFromNib() {
            
            super.awakeFromNib()
            minbuildarea.layer.borderWidth = 0.4
            minbuildarea.layer.borderColor = UIColor.lightGray.cgColor
            minbuildarea.layer.cornerRadius = 4
            maxbuildarea.layer.borderWidth = 0.4
            maxbuildarea.layer.borderColor = UIColor.lightGray.cgColor
            maxbuildarea.layer.cornerRadius = 4
            selectedBackgroundView?.isHidden = true
            
            
            var pickerView = UIPickerView()
            pickerView.delegate = self
            pickerView.dataSource = self
            
         //   choosecitytext.inputView = pickerView
            minbuildarea.delegate = self
            maxbuildarea.delegate = self
            
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

            maxbuildarea.inputView = pickerView
            maxbuildarea.inputAccessoryView = toolBar
            minbuildarea.inputView = pickerView
            minbuildarea.inputAccessoryView = toolBar
            
            
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
          self.pickerView?.reloadAllComponents()
  
      }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    @objc func donePicker() {
        if minbuildarea.isFirstResponder{
            minbuildarea.resignFirstResponder()
        }else if maxbuildarea.isFirstResponder{
            maxbuildarea.resignFirstResponder()
        }
    }

    
    func deselectButton(button:UIButton) {
        button.backgroundColor = .white
        button.setTitleColor(.systemGray2, for: .normal)
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.systemGray2.cgColor
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
           if minbuildarea.isFirstResponder{
               return minbuild.count
           }else if maxbuildarea.isFirstResponder{
            return maxbuild.count
           }
           return 0
       }

       func numberOfComponents(in pickerView: UIPickerView) -> Int {
           return 1
       }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if minbuildarea.isFirstResponder{
       //     print("The min amount is \(min[row])")
            return "\(minbuild[row])"
            
        }else if maxbuildarea.isFirstResponder{
         //   print("The min amount is \(max[row])")
         return "\(maxbuild[row])"
        }
           return nil
       }

       func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
           if minbuildarea.isFirstResponder{
               let itemselected = minbuild[row]
            minbuildarea.text = "\(itemselected)"
           }
           else if maxbuildarea.isFirstResponder{
            let itemselected = maxbuild[row]
            maxbuildarea.text = "\(itemselected)"

           
       }
       }
    
}
