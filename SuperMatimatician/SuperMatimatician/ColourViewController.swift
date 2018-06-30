//
//  ColourViewController.swift
//  SuperMatimatician
//
//  Created by Abai Kalikov on 6/29/18.
//  Copyright © 2018 Abai Kalikov. All rights reserved.
//

import UIKit

class ColourViewController: UIViewController {
    
    var colors: [Color] = [Color(1,"red",UIColor.red),
                           Color(2,"blue",UIColor.blue),
                           Color(3,"green",UIColor.green),
                           Color(4,"white",UIColor.white),
//                           Color(5,"orange",UIColor.orange),
//                           Color(6,"black",UIColor.black),
//                           Color(7,"orange",UIColor.orange),
//                           Color(8,"purple",UIColor.purple),
//                           Color(9,"brown",UIColor.brown),
//                           Color(10,"cyan",UIColor.cyan),
//                           Color(11,"darkGray",UIColor.darkGray),
//                           Color(12,"gray",UIColor.gray),
//                           Color(13,"yellow",UIColor.yellow),
//                           Color(14,"clear",UIColor.clear),
//                           Color(15,"lightGray",UIColor.lightGray),
                           ]
    
    @IBOutlet weak var colorView: UIView!

    @IBOutlet weak var colorLabel: UILabel!
    
    func randomColorName(_ colors:[Color]) -> String{
        let randomIndex = Int(arc4random_uniform(UInt32(colors.count)))
        let colorName = colors[randomIndex].colorName
        return colorName!
    }
    
    func randomColor(_ colors:[Color]) -> UIColor{
        let randomIndex = Int(arc4random_uniform(UInt32(colors.count)))
        let color = colors[randomIndex].color
        return color!
    }
    
    func showRandomColorAndName(){
        colorLabel.text = randomColorName(colors)
        colorView.backgroundColor = randomColor(colors)
    }
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    var temp: Int = 0
    var counter: Int = 0
    
    func alert(){
        let alertController = UIAlertController(title: "Game Over", message: "Your score is \(counter)", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Replay", style: .cancel, handler: nil)
        alertController.addAction(alertAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func truePressed(_ sender: Any) {
        let temp = counter
        for col in colors{
            if colorView.backgroundColor == col.color && colorLabel.text == col.colorName{
                counter += 1
            }
        }
        if counter == temp{
            alert()
            scoreLabel.text = "0"
        }
        scoreLabel.text = String(counter)
        showRandomColorAndName()
    }
    
    
    
    @IBAction func falsePressed(_ sender: Any) {
        let temp = counter
        for col in colors{
            if colorView.backgroundColor != col.color && colorLabel.text == col.colorName{
                counter += 1

            }
        }
        if counter == temp{
            alert()
            scoreLabel.text = "0"
        }
        scoreLabel.text = String(counter)
        showRandomColorAndName()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showRandomColorAndName()

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
