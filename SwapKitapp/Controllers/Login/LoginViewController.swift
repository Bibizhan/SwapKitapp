//
//  LoginViewController.swift
//  SwapKitapp
//
//  Created by Bibizhan on 21.04.18.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit
import Cartography
import Firebase
import SlideController
import XLPagerTabStrip

class LoginViewController: ButtonBarPagerTabStripViewController {
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "S  W  A  P  K  I  T  A  P  P"
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: "Avenir", size: 26)
        return titleLabel
    }()
    
    override public func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        return [SignInViewController(), SignUpViewController()]
    }
    
    override func viewDidLoad() {
        configureTabStrip()
        super.viewDidLoad()
        navigationController?.setViewControllers([self], animated: false)
        view.addSubview(titleLabel)
        color()
        setupConstraints()
        setupTabStrip()
    }
    
    func setupTabStrip() {
        var frame = buttonBarView.frame
        frame.origin.y = view.frame.height - frame.height - 150
        buttonBarView.frame = frame
        var containterFrame = containerView.frame
        containterFrame.origin.y = 0
        containerView.frame = containterFrame
    }
    
    func configureTabStrip() {
        settings.style.buttonBarBackgroundColor = .clear
        settings.style.buttonBarItemBackgroundColor = .clear
        settings.style.selectedBarBackgroundColor = .white
        settings.style.selectedBarHeight = 3
        settings.style.buttonBarItemFont = UIFont(name: "Avenir", size: 12)!
        
    }
    
    @objc func signIn(){
        navigationController?.pushViewController(SignInViewController(), animated: true)
    }
    
    @objc func signUp(){
        present(SignUpViewController(), animated: true, completion: nil)
    }
    
    func setupConstraints(){
        constrain(titleLabel, view) {tl, vw in
            tl.centerX == vw.centerX
            tl.top == vw.top + 110
        }
    }

    func color(){
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [UIColor.firstBg.cgColor, UIColor.secondBg.cgColor]
        self.view.layer.insertSublayer(gradient, at: 0)
    }

}
