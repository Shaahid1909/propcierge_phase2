//
//  sebarCell.swift
//  propciergeRealityServices
//
//  Created by shaahid shamil on 19/05/21.
//

import UIKit

class sebarCell: UITableViewCell,UITextFieldDelegate {

    @IBOutlet weak var sebutton: UIImageView!
    
    @IBOutlet weak var searchfield: UITextField!
    
    let view = UIView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        searchfield.setUpImage(imageName: "search", on: .right)
      
        
        searchfield.delegate = self
        HideKeyboard()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
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
