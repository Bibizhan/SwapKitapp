//
//  ViewController1.swift
//  SwapKitapp
//
//  Created by Bibizhan on 21.04.18.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit
import Cartography

class ViewController1: UIViewController {
    
    let bgImageView : UIImageView = {
        let bgImageView = UIImageView()
        bgImageView.image = UIImage(named: "books2.jpg")
        bgImageView.alpha = 0.2
        return bgImageView
    }()
    
    let labelInst: UILabel = {
        let labelInst = UILabel()
        labelInst.text = "S W A P K I T A P P"
        labelInst.textColor = .white
        labelInst.font = UIFont(name: "Helvetica Neue", size: 36)
        return labelInst
    }()
    
    let labelInfo: UILabel = {
        let labelInfo = UILabel()
        labelInfo.textColor = .white
        labelInfo.text = "Search the book with your interest."
        labelInfo.font = UIFont(name: "Avenir", size: 19)
        return labelInfo
    }()
    
    let labelInfo2: UILabel = {
        let labelInfo2 = UILabel()
        labelInfo2.textColor = .white
        labelInfo2.text = "Anytime. Anywhere."
        labelInfo2.font = UIFont(name: "Avenir", size: 18)
        return labelInfo2
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(bgImageView)
        view.addSubview(labelInfo2)
        view.addSubview(labelInfo)
        view.addSubview(labelInst)
        
        color()
        setupConstrains()
        
       
    }
    
    func setupConstrains(){
        constrain(bgImageView, labelInst, labelInfo2, labelInfo, view){bg, lb, li, lf, vw in
            bg.edges == vw.edges
            
            lb.top == vw.top + 270
            lb.left == vw.left + 27

            lf.top == lb.bottom + 50
            lf.left == vw.left + 40
            
            li.top == lb.bottom + 75
            li.left == vw.left + 100
            
            
        }
    }

    func color(){
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [UIColor.firstBg.cgColor, UIColor.secondBg.cgColor]
        self.view.layer.insertSublayer(gradient, at: 0)
    }
}
