//
//  FirstViewController.swift
//  SuperMatimatician
//
//  Created by Abai Kalikov on 6/29/18.
//  Copyright © 2018 Abai Kalikov. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, ViewControllerDelegate {
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var score: UILabel!
    
    var flag: String = "first"
    
    @IBAction func firstButton(_ sender: Any) {
        flag = "first"
    }
    
    @IBAction func secondButton(_ sender: Any) {
        flag = "second"
    }
    
    @IBAction func thirdButton(_ sender: Any) {
        flag = "third"
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue" {
            
            if let dvc = segue.destination as? MathViewController {
                dvc.flag = self.flag
                dvc.delegate = self
            }
            
        }
    }
    
    func setText(name: String, score: String) {
        self.name.text = name
        self.score.text = score
    }
}
