//
//  commercialNoOfseatsCell.swift
//  propcierge_proj
//
//  Created by shaahid shamil on 12/05/21.
//

import UIKit

class commercialNoOfseatsCell: UITableViewCell,UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
//    @IBOutlet weak var minseats: UIButton!
//    @IBOutlet weak var maxseats: UIButton!
//
    @IBOutlet weak var minseats: UITextField!
    @IBOutlet weak var maxseats: UITextField!
    
    var itemSelected = ""

    weak var pickerView: UIPickerView?
    
    let min = [0,100,200,300,400,500]
    let max = [500,600,700,800,900,1000]

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        minseats.layer.borderWidth = 0.4
        minseats.layer.borderColor = UIColor.lightGray.cgColor
        minseats.layer.cornerRadius = 4
        maxseats.layer.borderWidth = 0.4
        maxseats.layer.borderColor = UIColor.lightGray.cgColor
        maxseats.layer.cornerRadius = 4
        selectedBackgroundView?.isHidden = true
        
        minseats.setUpImage(imageName: "down_arrow", on: .right)
        maxseats.setUpImage(imageName: "down_arrow", on: .right)
        
        
        var pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        
     //   choosecitytext.inputView = pickerView
        minseats.delegate = self
        maxseats.delegate = self
        
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

        maxseats.inputView = pickerView
        maxseats.inputAccessoryView = toolBar
        minseats.inputView = pickerView
        minseats.inputAccessoryView = toolBar
        
        
        
    }

    @objc func donePicker() {
        if minseats.isFirstResponder{
            minseats.resignFirstResponder()
        }else if maxseats.isFirstResponder{
            maxseats.resignFirstResponder()
        }
    }

    
    func deselectButton(button:UIButton) {
        button.backgroundColor = .white
        button.setTitleColor(.systemGray2, for: .normal)
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.systemGray2.cgColor
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
           if minseats.isFirstResponder{
               return min.count
           }else if maxseats.isFirstResponder{
            return max.count
           }
           return 0
       }

       func numberOfComponents(in pickerView: UIPickerView) -> Int {
           return 1
       }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if minseats.isFirstResponder{
       //     print("The min amount is \(min[row])")
            return "\(min[row])"
            
        }else if maxseats.isFirstResponder{
         //   print("The min amount is \(max[row])")
         return "\(max[row])"
        }
           return nil
       }

       func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
           if minseats.isFirstResponder{
               let itemselected = min[row]
            minseats.text = "\(itemselected)"
           }
           else if maxseats.isFirstResponder{
            let itemselected = max[row]
            maxseats.text = "\(itemselected)"

           
       }
       }
    
}
