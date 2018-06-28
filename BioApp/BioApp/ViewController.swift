//
//  ViewController.swift
//  BioApp
//
//  Created by Abai Kalikov on 6/27/18.
//  Copyright © 2018 Abai Kalikov. All rights reserved.
//

import UIKit
import Cartography

class ViewController: UIViewController {
    
    let displayHeight = UIScreen.main.bounds.height
    let displayWidth = UIScreen.main.bounds.width
    
    lazy var bioLabel: UILabel = {
        let label = UILabel()
        label.text = "My Bio"
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 25 / 736 * displayHeight)
        label.textAlignment = .center
        return label
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 25 / 736 * displayHeight)
        label.textAlignment = .center
        return label
    }()
    
    lazy var cityTextfield: UITextField = {
        
        let textfield = UITextField()
        textfield.placeholder = "E.g. Almaty, New York"
        textfield.backgroundColor = .white
        textfield.layer.cornerRadius = 7
        textfield.clipsToBounds = true
        textfield.setLeftPaddingPoints(10 / 414 * displayWidth)
        textfield.font = UIFont.systemFont(ofSize: 15 / 736 * displayHeight)
        return textfield
    }()
    
    lazy var nameTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Enter your name:"
        textfield.backgroundColor = .white
        textfield.layer.cornerRadius = 7
        textfield.clipsToBounds = true
        textfield.font = UIFont.systemFont(ofSize: 15/736 * displayHeight)
        return textfield
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        setUpConstraints()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUp(){
        view.addSubview(bioLabel)
    }

    func setUpConstraints(){
        constrain(bioLabel, view){bioLabel, view in
            bioLabel.top == view.top + (70 / 736 * displayHeight)
            bioLabel.centerX == view.centerX
        }
        constrain()
    }

}

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}

