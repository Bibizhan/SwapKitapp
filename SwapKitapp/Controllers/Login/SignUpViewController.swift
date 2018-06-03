//
//  SignUpViewController.swift
//  SwapKitapp
//
//  Created by Bibizhan on 21.04.18.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit
import Cartography
import Firebase
import FirebaseAuth
import XLPagerTabStrip
import SkyFloatingLabelTextField

class SignUpViewController: UIViewController, IndicatorInfoProvider {
    
    var alertController = UIAlertController()
    private var dbRef: DatabaseReference?

    let emailTextField : UITextField = {
        let textField = SkyFloatingLabelTextField(frame: .zero)
        textField.placeholder = "E-mail"
        textField.title = "Your e-mail"
        textField.tintColor = .white
        textField.textColor = .white
        textField.lineColor = UIColor.white.withAlphaComponent(0.75)
        textField.selectedTitleColor = .white
        textField.titleColor = UIColor.white.withAlphaComponent(0.75)
        textField.selectedLineColor = .white
        textField.selectedLineHeight = 1.5
        return textField
    }()
    
    let passwordTextField : UITextField = {
        let textField = SkyFloatingLabelTextField(frame: .zero)
        textField.placeholder = "Password"
        textField.title = "Choose password"
        textField.isSecureTextEntry = true
        textField.tintColor = .white
        textField.titleColor = UIColor.white.withAlphaComponent(0.75)
        textField.textColor = .white
        textField.lineColor = UIColor.white.withAlphaComponent(0.75)
        textField.selectedTitleColor = .white
        textField.selectedLineColor = .white
        textField.selectedLineHeight = 1.5
        return textField
        
    }()
    
    let signUpButton : UIButton = {
        let button2 = UIButton()
        button2.backgroundColor = .clear
        button2.setTitle("REGISTER", for: .normal)
        button2.titleLabel?.font = UIFont(name: "Avenir", size: 14)!
        button2.setTitleColor(.white, for: .normal)
        button2.addTarget(self, action: #selector(signUp), for: .touchUpInside)
        return button2
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dbRef = Database.database().reference()
        dbRef = dbRef?.child("User")
        
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(signUpButton)
        setupConstraints()
        
//        let current_user = Auth.auth().currentUser
//        if current_user != nil{
//            performSegue(withIdentifier: "mySegue1", sender: self)
  //  }
}
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "SIGN UP")
    }
    
    func setupConstraints(){
        constrain(emailTextField, passwordTextField, signUpButton, view){  et, pt, bt, vw in
            
            et.centerX == vw.centerX
            et.centerY == vw.centerY - 50
            et.width == 330
            et.height == 45
            
            pt.top == et.bottom  + 25
            pt.right == et.right
            pt.left == et.left
            pt.height == 45
            
            bt.top == pt.bottom + 20
            bt.right == pt.right -  60
            bt.left == pt.left + 60
            bt.height == 40
            
        }
    }
    @objc func signUp(){
        
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (user, error) in
            if error == nil{
                user?.sendEmailVerification(completion: { (error) in
                    if error == nil{
                        let alert = UIAlertController(title: ":)", message:"Check your email. We sent you a verification link" , preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                        self.present(alert, animated: true)
                        
                    }
                })
                print("DS")
                
            }else{
                let alert = UIAlertController(title: "Error!", message:"Something is wrong!" , preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alert, animated: true)

            }
        })
}
}

