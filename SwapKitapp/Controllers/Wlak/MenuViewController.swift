////
////  MenuViewController.swift
////  SwapKitapp
////
////  Created by Bibizhan on 22.04.18.
////  Copyright © 2018 SDU. All rights reserved.
////
//
//import UIKit
//import GuillotineMenu
//import Cartography
//
//class MenuViewController: UIViewController, GuillotineMenu {
//
//    var dismissButton: UIButton?
//    var titleLabel: UILabel?
//
//    let profileView: UIView = {
//        let profileView = UIView()
//        profileView.backgroundColor = .secondBg
//        profileView.isHidden = true
//        return profileView
//    }()
//
//    let profileImage: UIImageView = {
//        let profileImage = UIImageView()
//        profileImage.image = UIImage(named: "photo.jpg")
//        profileImage.isHidden = true
//        return profileImage
//    }()
//
//    let username: UILabel = {
//        let username = UILabel()
//        username.font = UIFont(name: "Avenir", size: 19)
//        username.text = "user"
//        username.textColor = .white
//        username.isHidden = true
//        return username
//    }()
//
//    let profileButton : UIButton = {
//        let profileButton = UIButton()
//        profileButton.backgroundColor = .clear
//        profileButton.isHidden = true
//        profileButton.titleLabel?.font =  UIFont(name: "Avenir", size: 17)
//        profileButton.addTarget(self, action: #selector(profileTapped),for: .touchUpInside)
//        profileButton.setTitle("Profile", for: .normal)
//        return profileButton
//    }()
//
//    let cancelButton : UIButton = {
//        let cancel = UIButton()
//        cancel.backgroundColor = .clear
//        cancel.setImage(#imageLiteral(resourceName: "x"), for: .normal)
//        cancel.isHidden = true
//        cancel.addTarget(self, action: #selector(dismissButtonTapped(_:)),for: .touchUpInside)
//        return cancel
//    }()
//
//    let messagesButton : UIButton = {
//        let messagesButton = UIButton()
//        messagesButton.isHidden = true
//        messagesButton.backgroundColor = .clear
//        messagesButton.titleLabel?.font =  UIFont(name: "Avenir", size: 17)
//        messagesButton.setTitle("Messages", for: .normal)
//        return messagesButton
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = "2C6369".hexColor
//        [profileView, profileButton, cancelButton, profileImage, username, messagesButton].forEach {
//            view.addSubview($0)
//        }
//        setupConstraints()
//    }
//
//    func setupConstraints(){
//        constrain(profileView, cancelButton,profileImage, username, view){pv, cb, pi,un, vw in
//            pv.edges == vw.edges
//
//            cb.top == vw.top + 40
//            cb.right == vw.right - 40
//            cb.height == 25
//            cb.width == 25
//
//            pi.top == vw.top + 150
//            pi.left == vw.left + 150
//            pi.width == 75
//            pi.height == 75
//
//            un.top == pi.bottom + 10
//            un.left == pi.left + 20
//        }
//        constrain(profileButton, messagesButton, view){ pb, mb, vw in
//            pb.top == vw.top + 290
//            pb.left == vw.left + 100
//            //   pb.width == 70
//            pb.height == 35
//
//            mb.top == pb.bottom + 10
//            mb.left == vw.left + 100
//            mb.height == 35
//        }
//    }
//
//    @objc func profileTapped(){
//        present(ProfileViewController(), animated: true, completion: nil)
//    }
//
//    @objc func dismissButtonTapped(_ sender: UIButton) {
//        presentingViewController!.dismiss(animated: true, completion: nil)
//    }
//
//    @IBAction func menuButtonTapped(_ sender: UIButton) {
//        presentingViewController!.dismiss(animated: true, completion: nil)
//    }
//
//    @IBAction func closeMenu(_ sender: UIButton) {
//        presentingViewController!.dismiss(animated: true, completion: nil)
//    }
//}
//
