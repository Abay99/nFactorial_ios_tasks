//
//  ViewController.swift
//  MyBio
//
//  Created by Abai Kalikov on 6/27/18.
//  Copyright © 2018 Abai Kalikov. All rights reserved.
//

import UIKit
import IHKeyboardAvoiding

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var genderSegmen: UISegmentedControl!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var workTextField: UITextField!
    
    @IBOutlet weak var salarySlider: UISlider!
    
    @IBOutlet weak var salaryRange: UILabel!
    
    @IBOutlet weak var switchOnOff: UISwitch!
    
//    @IBAction func nameTFPressed(_ sender: UITextField) {
//        KeyboardAvoiding.avoidingView = self.nameTextField
//    }
    
//    @IBAction func workTFPressed(_ sender: UITextField) {
//        KeyboardAvoiding = self.workTextField
//    }
    
    var age: Int = 0
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        let year = Date.init().timeIntervalSince(datePicker.date)
        age = Int(Double(year/(3600*12*365*2)))
    }
    
    
    var gender: String = ""
    var genderText: String = ""
    
    @IBAction func segmentSelected(_ sender: UISegmentedControl) {
        switch genderSegmen.selectedSegmentIndex {
        case 0:
            gender = genderSegmen.titleForSegment(at: 0)!
        case 1:
            gender = genderSegmen.titleForSegment(at: 1)!
        default:
            break
        }
    }
    
    @IBAction func SwitchPressed(_ sender: UISwitch) {
        if switchOnOff.isOn{
            if(gender == "Male"){
                genderText = "I am interested in Women."
            }
            genderText = "I am interested in Men."
        }
        else{
            if(gender == "Male"){
                genderText = "Now, I am not interested Women."
            }
            genderText = "Now, I am not interested Men."
        }
    }
    
    @IBAction func SliderUsed(_ sender: UISlider) {
        let currentValue = Int(sender.value)
        salaryRange.text = "$\(currentValue)k"
    }
    
    
    @IBAction func savePressed(_ sender: Any) {
        let alertController = UIAlertController(title: "My personal info", message: "Hi, I am \(nameTextField.text!). As a \(age)-year old \(workTextField.text!) earning \(salaryRange.text!)/year, \(genderText) Feel free to contact me!", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(alertAction)
        self.present(alertController, animated: true, completion: nil)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        keyboardTop()
        KeyboardAvoiding.avoidingView = self.nameTextField
        KeyboardAvoiding.avoidingView = self.workTextField
        sliding()
    }
    
    func keyboardTop(){
//        KeyboardAvoiding.avoidingView = self.nameTextField
        KeyboardAvoiding.avoidingView = self.workTextField
    }

    func sliding(){
        
        UIView.animate(withDuration: 0.5, delay: 1.0, options: .transitionFlipFromLeft, animations: ({
            self.nameTextField.center.x = self.view.frame.width - 150
        }), completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 1.0, options: .transitionFlipFromLeft, animations: ({
            self.workTextField.center.x = self.view.frame.width - 150
        }), completion: nil)
        
    }

}

