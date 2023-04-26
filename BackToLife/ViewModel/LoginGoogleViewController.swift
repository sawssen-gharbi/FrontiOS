//
//  LoginGoogleViewController.swift
//  BackToLife
//
//  Created by Mac Mini 2 on 14/4/2023.
//

import UIKit


class LoginGoogleViewController: UIViewController {

    
    //Var
    let userFullName = UserDefaults.standard.string(forKey: "userFullName")
    
    
    //IBOutlets
    @IBOutlet weak var IBOutletSwitch: UISwitch!
    @IBOutlet weak var IBOutletDiploma: UILabel!
    @IBOutlet weak var IBOutletButton: UIButton!
   
    @IBOutlet weak var IBOutletFullName: UILabel!
    
  
    //IBActions
    @IBAction func IBActionSwitch(_ sender: UISwitch) {
        
        IBOutletDiploma.isHidden = !sender.isOn
        IBOutletButton.isHidden = !sender.isOn
        
      }
    
    
    

    
    
    override func viewDidLoad() {
     
    
        super.viewDidLoad()
        IBOutletFullName.text = userFullName
        IBOutletDiploma.isHidden = true
        IBOutletButton.isHidden = true
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
