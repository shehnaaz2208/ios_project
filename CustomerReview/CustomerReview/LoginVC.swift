//
//  ViewController.swift
//  CustomerReview
//
//  Created by MacStudent on 2018-08-11.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

  
    
    @IBOutlet weak var switchRemember: UISwitch!
    @IBOutlet weak var txtpassword: UITextField!
    @IBOutlet weak var txtemail: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let email = UserDefaults.standard.value(forKey: "email"){
            txtemail.text = email as? String
        }
        
        if let password = UserDefaults.standard.string(forKey: txtemail.text!){
            txtpassword.text = password
        }
        // Do any additional setup after loading the view, typically from a nib.
   
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnSignup(_ sender: UIButton) {
        let mainSB : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let signUpVC = mainSB.instantiateViewController(withIdentifier: "SignUpScene")
        navigationController?.pushViewController(signUpVC, animated: true)
        
    }
    @IBAction func btnSignin(_ sender: UIButton) {
        if validateUser(){
            
            if switchRemember.isOn {
                //save the data
                UserDefaults.standard.set(txtemail.text!, forKey: "email")
                //                UserDefaults.standard.set(txtPassword.text!, forKey: "password")
                
                UserDefaults.standard.set(txtpassword.text!, forKey: txtemail.text!)
            }else{
                UserDefaults.standard.removeObject(forKey: "email")
                //                UserDefaults.standard.removeObject(forKey: "password")
                UserDefaults.standard.removeObject(forKey: txtemail.text!)
            }
        
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


