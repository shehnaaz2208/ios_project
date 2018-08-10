//
//  ViewController.swift
//  Review
//
//  Created by MacStudent on 2018-08-10.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var switchRemember: UISwitch!
    @IBOutlet weak var txtemail: UITextField!
    @IBOutlet weak var txtpassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
@IBAction func btnsignup(_ sender: Any) {
    let mainSB : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    let signUpVC = mainSB.instantiateViewController(withIdentifier: "SignUpScene")
    navigationController?.pushViewController(signUpVC, animated: true)
    
}

@IBAction func btnsignin(_ sender: Any) {
    if validateUser(){
        //open home screen
        let mainSB : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let homeVC = mainSB.instantiateViewController(withIdentifier: "HomeScene")
        //            self.present(homeVC, animated: true, completion: nil)
        navigationController?.pushViewController(homeVC, animated: true)
        
    }else{
        //display alert message
        let infoAlert = UIAlertController(title: "User Account", message: "Invalid Email and/or Password", preferredStyle: .alert)
        infoAlert.addAction(UIAlertAction(title: "Retry", style: .default, handler: nil))
        //            infoAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        //            infoAlert.addAction(UIAlertAction(title: "Don't bother me", style: .destructive, handler: nil))
        //            infoAlert.addAction(UIAlertAction(title: "Oh really !!", style: .default, handler: nil))
        
        self.present(infoAlert, animated: true, completion: nil)
    }
}

func validateUser() -> Bool{
    if txtemail.text == "test" && txtpassword.text == "test"{
        return true
    }else{
        return false
    }
  }
}


