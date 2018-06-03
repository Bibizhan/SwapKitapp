//
//  ViewController2.swift
//  SwapKitapp
//
//  Created by Bibizhan on 21.04.18.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit
import Cartography

class ViewController2: UIViewController {
    
    let bgImageView : UIImageView = {
        let bgImageView = UIImageView()
        bgImageView.image = UIImage(named: "b.jpg")
        bgImageView.alpha = 0.3
        return bgImageView
    }()
    
    let labelInst: UILabel = {
        let labelInst = UILabel()
        labelInst.text = "S W A P K I T A P P"
        labelInst.textColor = .white
        labelInst.font = UIFont(name: "Avenir", size: 26)
        return labelInst
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "join us"
        label.textColor = .white
        label.font = UIFont(name: "Avenir", size: 27)
        return label
    }()
    
    let okButton : UIButton = {
        let okButton = UIButton()
        okButton.backgroundColor = .clear
        okButton.titleLabel?.font =  UIFont(name: "Avenir", size: 20)
        okButton.setTitle("OK, start it! ", for: .normal)
        okButton.addTarget(self, action: #selector(okTapped),for: .touchUpInside)
        return okButton
    }()
    
    @objc func okTapped(){
        print("ok")
        navigationController?.pushViewController(LoginViewController(), animated: true)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(bgImageView)
        view.addSubview(labelInst)
        view.addSubview(label)
        view.addSubview(okButton)
        
        color()
        setupConstrains()
        
       
    }
    
    func setupConstrains(){
        constrain(bgImageView, labelInst,label, okButton, view){bg, lb, ll, ok, vw in
            bg.edges == vw.edges
            
            ok.bottom == vw.bottom - 30
            ok.right == vw.right - 30
            
            ll.center == vw.center
            
            lb.top == vw.top + 50
            lb.left == vw.left + 80

        

        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func color(){
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [UIColor.firstBg.cgColor, UIColor.secondBg.cgColor]
        self.view.layer.insertSublayer(gradient, at: 0)
        
    }
}


