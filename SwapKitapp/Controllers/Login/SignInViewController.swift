//
//  SignInViewController.swift
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

class SignInViewController: UIViewController, IndicatorInfoProvider {
    
    let emailTextField : SkyFloatingLabelTextField = {
        let textField = SkyFloatingLabelTextField(frame: .zero)
        textField.placeholder = "Username"
        textField.title = "Your username"
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
        textField.title = "Your password"
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
    
    let signInButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setTitle("LOGIN", for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir", size: 14)!
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(signIn), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(signInButton)
        setupConstraints()
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "SIGN IN")
    }
    
    func setupConstraints(){
        constrain(emailTextField, passwordTextField, signInButton, view){  et, pt, bt, vw in
            
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
    
    @objc func signIn(){
        let vc = UINavigationController(rootViewController: SecondViewController())
        self.present(vc, animated: true, completion: nil)
        
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (user, error) in
            if error == nil{
             //   if (user?.isAnonymous)!{

                    let vc = UINavigationController(rootViewController: SecondViewController())
                    self.present(vc, animated: true, completion: nil)

                    print("ok")
                    //self.present(MainViewController(), animated: true, completion: nil)
//                }else{
//                    let alert = UIAlertController(title: "Error!", message:"You're email is not verified" , preferredStyle: .alert)
//                    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
//                    self.present(alert, animated: true)
//                    print("Your email is not verified!")
//                }
            }else{
                let alert = UIAlertController(title: "Error!", message:"User is not signed up" , preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alert, animated: true)
                print("Error! User is not signed up.")

            }
        })
    }
    
}
