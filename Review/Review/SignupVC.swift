//
//  SignupVC.swift
//  Review
//
//  Created by MacStudent on 2018-08-10.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit

class SignupVC: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtContactNo: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var pickCity: UIPickerView!
    @IBOutlet weak var txtPostalcode: UITextField!
    @IBOutlet weak var pickDate: UIDatePicker!
    @IBOutlet weak var segGender: UISegmentedControl!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtconpassword: UITextField!
    
    let cityList : [String] = ["Toronto", "Vancouver", "Banff", "Jasper", "Ajax", "Alberta"]
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = "Sign Up"
        navigationController?.setNavigationBarHidden(false, animated: true)
        
        let btnSubmit = UIBarButtonItem(title: "Submit", style: .plain, target: self, action: #selector(displayInfo))
        self.navigationItem.rightBarButtonItem = btnSubmit
    }
    
    @objc func displayInfo(){
        var userInfo : String = txtName.text!
        userInfo += "\n" + txtContactNo.text!
        userInfo += "\n" + txtAddress.text!
        userInfo += "\n" + txtEmail.text!
        userInfo += "\n" + txtPassword.text!
        userInfo += "\n \(cityList[pickCity.selectedRow(inComponent: 0)])"
        
        switch segGender.selectedSegmentIndex {
        case 0:
            userInfo += "\n Male"
        case 1:
            userInfo += "\n Female"
        case 2:
            userInfo += "\n Others"
        default:
            userInfo += "\n Others"
        }
        
        let infoAlert = UIAlertController(title: "Verify Details", message: userInfo, preferredStyle: .alert)
        
        if txtPassword.text == txtconpassword.text{
            infoAlert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: {_ in self.displayHomeVC()}))
        }else{
            infoAlert.message = "Both passwords must be same"
        }
        
        infoAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(infoAlert, animated: true, completion: nil)
        
    }
    
    func displayHomeVC(){
        let mainSB : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let homeVC = mainSB.instantiateViewController(withIdentifier: "HomeScene")
        navigationController?.pushViewController(homeVC, animated: true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cityList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cityList[row]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
