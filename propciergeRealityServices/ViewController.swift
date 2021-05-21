//
//  ViewController.swift
//  propciergeRealityServices
//
//  Created by shaahid shamil on 10/05/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func realtyServices(_ sender:UIButton){
        performSegue(withIdentifier: "RealtyServices", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = "Reality Services"
        backItem.tintColor = #colorLiteral(red: 0.1018147841, green: 0.6851620674, blue: 0.9096405506, alpha: 1)
        navigationItem.backBarButtonItem = backItem
    }


}

