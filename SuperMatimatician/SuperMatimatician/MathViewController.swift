//
//  MathViewController.swift
//  SuperMatimatician
//
//  Created by Abai Kalikov on 6/30/18.
//  Copyright © 2018 Abai Kalikov. All rights reserved.
//

import UIKit

protocol ViewControllerDelegate: AnyObject {
    func setText(name: String, score: String)
}

class MathViewController: UIViewController {
    
    weak var delegate: ViewControllerDelegate?
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var bottomView: UIView!
    
    @IBOutlet weak var resultTF: UITextField!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var timerLabel: UILabel!
    
    var timer = Timer()
    
    var flag: String = ""
    
    var name: String = ""
    
    var counter: Int = 0
    
    var time: Int = 20
    
    @objc func moveQuestionLabel() {
        timerLabel.text = String(time)
        if(questionLabel.center.y >= bottomView.center.y) {
            newQuestion()
        }
        UIView.animate(withDuration: 0.2) {
            self.questionLabel.center.y += CGFloat(5)
        }
        time -= 1
        timerLabel.text = String(time)
        
        if time == 0 {
            
            timer.invalidate()
            //1. Create the alert controller.
            let alert = UIAlertController(title: "Game Over", message: "Your score us \(scoreLabel.text!)", preferredStyle: .alert)
            
            //2. Add the text field. You can configure it however you need.
            alert.addTextField(configurationHandler: { (textField) -> Void in
                textField.placeholder = "Enter your name:"
            })
            
            //3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (action) -> Void in
                let textField = alert?.textFields![0] as! UITextField
                self.delegate?.setText(name: textField.text!, score: self.scoreLabel.text!)
                self.navigationController?.popViewController(animated: true)
            }))
            
            // 4. Present the alert.
            self.present(alert, animated: true, completion: nil)
        }
    }
    var result: Int = 0
    var x: Int = 1
    var y: Int = 1
    
    func newQuestion() {
        switch flag {
        case "first":
            x = Int(arc4random_uniform(9) + 1)
            y = Int(arc4random_uniform(9) + 1)
            questionLabel.text = "\(x) x \(y) ="
            questionLabel.center.y = 30
            result = Int(x * y)
        case "second":
            x = Int(arc4random_uniform(99) + 1)
            y = Int(arc4random_uniform(9) + 1)
            if x < 100 && x >= 10{
                questionLabel.text = "\(x) x \(y) ="
                questionLabel.center.y = 30
                result = Int(x * y)
            }
        case "third":
            x = Int(arc4random_uniform(999) + 1)
            y = Int(arc4random_uniform(9) + 1)
            if x < 1000 && x >= 100{
                questionLabel.text = "\(x) x \(y) ="
                questionLabel.center.y = 30
                result = Int(x * y)
            }
        default:
            print("Answer is not applicable")
        }
    }
    
    func timerStart(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(moveQuestionLabel), userInfo: nil, repeats: true)
        newQuestion()
    }
    
    @IBAction func submitPressed(_ sender: Any) {
        if String(result) == resultTF.text! {
            newQuestion()
            counter += 1
        }
        else {
            newQuestion()
            counter -= 1
        }
        resultTF.text = ""
        scoreLabel.text = String(counter)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timerStart()

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
