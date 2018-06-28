//
//  CreateListViewController.swift
//  ToDoList
//
//  Created by Abai Kalikov on 6/28/18.
//  Copyright © 2018 Abai Kalikov. All rights reserved.
//

import UIKit

class CreateListViewController: UIViewController {
    
    var imageName: String = "person.png"
    @IBAction func personTouched(_ sender: Any) {
        imageName = "person.png"
    }
    @IBAction func phoneTouched(_ sender: Any) {
        imageName = "phone.png"
    }
    @IBAction func cartTouched(_ sender: Any) {
        imageName = "cart.png"
    }
    @IBAction func airplaneTouched(_ sender: Any) {
        imageName = "airplane.png"
    }
    @IBOutlet weak var titleTF: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var strDate: String = ""
    
    @IBAction func datePickerChanged(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        strDate = dateFormatter.string(from: (sender as AnyObject).date)
    }
    
    var receive: Savable?
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        if titleTF.text == "" {
            let alertController = UIAlertController(title: "Error!", message: "Some textfields are empty.", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(alertAction)
            self.present(alertController, animated: true, completion: nil)
        }else{
            switch imageName {
            case "person.png":
                receive?.save(c: List(titleTF.text!, strDate, UIImage(named: imageName)!))
            case "phone.png":
                receive?.save(c: List(titleTF.text!, strDate, UIImage(named: imageName)!))
            case "cart.png":
                receive?.save(c: List(titleTF.text!, strDate, UIImage(named: imageName)!))
            case "airplane.png":
                receive?.save(c: List(titleTF.text!, strDate, UIImage(named: imageName)!))
            default:
                print("imageName is not right!")
            }
            self.navigationController?.popViewController(animated: true)
        }
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
