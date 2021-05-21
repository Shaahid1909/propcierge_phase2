//
//  PriceRangeCell.swift
//  propcierge_proj
//
//  Created by shaahid shamil on 10/05/21.
//

import UIKit

class PriceRangeCell: UITableViewCell,UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var minAmtBtn: UITextField!
    @IBOutlet weak var maxAmtBtn: UITextField!
    
    var itemSelected = ""

    weak var pickerView: UIPickerView?
    
    let min = Array(0...50).map { $0 }
    let max = Array(0...50).map { $0 }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        minAmtBtn.layer.borderWidth = 0.4
        minAmtBtn.layer.borderColor = UIColor.lightGray.cgColor
        minAmtBtn.layer.cornerRadius = 4
        maxAmtBtn.layer.borderWidth = 0.4
        maxAmtBtn.layer.borderColor = UIColor.lightGray.cgColor
        maxAmtBtn.layer.cornerRadius = 4
        selectedBackgroundView?.isHidden = true
        
        var pickerView = UIPickerView()
                pickerView.delegate = self
                pickerView.dataSource = self
        
     //   choosecitytext.inputView = pickerView
        minAmtBtn.delegate = self
        maxAmtBtn.delegate = self
        
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

        maxAmtBtn.inputView = pickerView
        maxAmtBtn.inputAccessoryView = toolBar
        minAmtBtn.inputView = pickerView
        minAmtBtn.inputAccessoryView = toolBar
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
          self.pickerView?.reloadAllComponents()
  
      }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    @objc func donePicker() {
        if minAmtBtn.isFirstResponder{
        minAmtBtn.resignFirstResponder()
        }else if maxAmtBtn.isFirstResponder{
            maxAmtBtn.resignFirstResponder()
        }
    }

    
    func deselectButton(button:UIButton) {
        button.backgroundColor = .white
        button.setTitleColor(.systemGray2, for: .normal)
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.systemGray2.cgColor
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
           if minAmtBtn.isFirstResponder{
               return min.count
           }else if maxAmtBtn.isFirstResponder{
            return max.count
           }
           return 0
       }

       func numberOfComponents(in pickerView: UIPickerView) -> Int {
           return 1
       }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if minAmtBtn.isFirstResponder{
       //     print("The min amount is \(min[row])")
            return "\(min[row])"
            
        }else if maxAmtBtn.isFirstResponder{
         //   print("The min amount is \(max[row])")
         return "\(max[row])"
        }
           return nil
       }

       func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
           if minAmtBtn.isFirstResponder{
               let itemselected = min[row]
            minAmtBtn.text = "\(itemselected)"
           }
           else if maxAmtBtn.isFirstResponder{
            let itemselected = max[row]
         maxAmtBtn.text = "\(itemselected)"
      //      choosecitytext.resignFirstResponder()
       
           
       }
    
       }
    
}
