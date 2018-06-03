//
//  ProfileViewController.swift
//  SwapKitapp
//
//  Created by Bibizhan on 21.04.18.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit
import Cartography
import XLPagerTabStrip
import Firebase


class ProfileViewController: ButtonBarPagerTabStripViewController {
    
    let profileImage: UIImageView = {
        let profileImage = UIImageView()
        profileImage.image = UIImage(named: "photo.jpg")
        return profileImage
    }()
    
    let username: UILabel = {
        let username = UILabel()
        username.font = UIFont(name: "Avenir", size: 19)
        username.text = "b.orazaliyeva@gmail.com"
        username.textColor = .white
        username.textAlignment = .center
        return username
    }()
    
    override public func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        return [MyBooksViewController(), MyNeedsViewController(),BookSwapViewController()]
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        configureTabStrip()
        super.viewDidLoad()
        configureViews()
        setupConstrains()
        setupTabStrip()
        setupUI()
    }
    
    //MARK: - Setup views
    func configureViews(){
        view.backgroundColor = .secondBg
        [profileImage,username].forEach { (views) in
            view.addSubview(views)
        }
    }

    func setupConstrains(){
        setupNavBar()
        constrain(profileImage, username, view){ pi, un, vw in
            pi.top == vw.top + 120
            pi.centerX == vw.centerX
            pi.height == 75
            pi.width == 75
            
            un.top == pi.bottom + 10
            un.left == vw.left + 80
        }
    }
    
    func setupUI() {
        let ownerName = (Auth.auth().currentUser?.email)!
        username.text = ownerName
    }

    func setupNavBar(){
        let leftBarButton = UIBarButtonItem(image:UIImage(named:"list"), style: .plain, target: self, action: #selector(listTapped))
        self.navigationItem.leftBarButtonItem  = leftBarButton
        leftBarButton.tintColor = .white
    }
    
    @objc func listTapped(){
        self.present(appDelegate.menuManager.menuLeftNavigationController!, animated: true)
    }
    
    func setupTabStrip() {
        var frame = buttonBarView.frame
        frame.origin.y = view.frame.height - frame.height - 335
        buttonBarView.frame = frame
        var containterFrame = containerView.frame
        containterFrame.origin.y = view.frame.height - frame.height - 290
        containerView.frame = containterFrame
    }
    
    func configureTabStrip() {
        settings.style.buttonBarBackgroundColor = .clear
        settings.style.buttonBarItemBackgroundColor = .clear
        settings.style.selectedBarVerticalAlignment = .bottom
        settings.style.selectedBarBackgroundColor = .itemColor
        settings.style.selectedBarHeight = 7
        settings.style.buttonBarItemFont = UIFont(name: "Avenir", size: 12)!
    }


}
