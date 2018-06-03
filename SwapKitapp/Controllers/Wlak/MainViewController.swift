//
//  MainViewController.swift
//  SwapKitapp
//
//  Created by Bibizhan on 22.04.18.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit
import SideMenu
import Cartography
class MainViewController: UIViewController {
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        configureConstraints()
    }
    
    //MARK: - Setup views
    func configureViews(){
        setupNavBar()
    }
    
    func configureConstraints(){
        
    }
    
    //Navigation bar
    func setupNavBar(){
        let leftBarButton = UIBarButtonItem(image:UIImage(named:"list"), style: .plain, target: self, action: #selector(listTapped))
        self.navigationItem.leftBarButtonItem  = leftBarButton
        leftBarButton.tintColor = .white
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
        self.navigationController?.view.backgroundColor = .clear
    }
    
    //Button bar tapped
    @objc func listTapped(){
        self.present(appDelegate.menuManager.menuLeftNavigationController!, animated: true)
        
    }

    

}
