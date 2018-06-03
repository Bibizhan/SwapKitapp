//
//  MessagesViewController.swift
//  SwapKitapp
//
//  Created by Bibizhan on 22.04.18.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit

class FriendsController: UIViewController {
    
//    private let cellId = "cellId"
//
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        color()
        
    //    navigationItem.title = "Recent"
        
//        collectionView?.backgroundColor = UIColor.white
//        collectionView?.alwaysBounceVertical = true
//        collectionView?.register(FriendCell.self, forCellWithReuseIdentifier: cellId)
    }
    func color(){
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [UIColor.firstBg.cgColor, UIColor.secondBg.cgColor]
        self.view.layer.insertSublayer(gradient, at: 0)
        
    }
    
    func setupNavBar(){
        let leftBarButton = UIBarButtonItem(image:UIImage(named:"list"), style: .plain, target: self, action: #selector(listTapped))
        self.navigationItem.leftBarButtonItem  = leftBarButton
        leftBarButton.tintColor = .white
        
        
    }
    
    //Button bar tapped
    @objc func listTapped(){
        self.present(appDelegate.menuManager.menuLeftNavigationController!, animated: true)
        
    }
    
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 3
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        return collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath as IndexPath)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: view.frame.width, height: 100)
//    }
//}
//
//class FriendCell: BaseCell {
//
//    let profileImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.contentMode = .scaleAspectFill
//        imageView.layer.cornerRadius = 34
//        imageView.layer.masksToBounds = true
//        return imageView
//    }()
//
//    let dividerLineView: UIView = {
//        let view = UIView()
//        view.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
//        return view
//    }()
//
//    let nameLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Mark Zuckerberg"
//        label.font = UIFont.systemFont(ofSize: 18)
//        return label
//    }()
//
//    let messageLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Your friend's message and something else..."
//        label.textColor = UIColor.darkGray
//        label.font = UIFont.systemFont(ofSize: 14)
//        return label
//    }()
//
//    let timeLabel: UILabel = {
//        let label = UILabel()
//        label.text = "12:05 pm"
//        label.font = UIFont.systemFont(ofSize: 16)
//        label.textAlignment = .right
//        return label
//    }()
//
//    let hasReadImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.contentMode = .scaleAspectFill
//        imageView.layer.cornerRadius = 10
//        imageView.layer.masksToBounds = true
//        return imageView
//    }()
//
//    override func setupViews() {
//
//        addSubview(profileImageView)
//        addSubview(dividerLineView)
//
//        setupContainerView()
//
//        profileImageView.image = UIImage(named: "zuckprofile")
//        hasReadImageView.image = UIImage(named: "zuckprofile")
//
//        addConstraintsWithFormat(format: "H:|-12-[v0(68)]",  views: profileImageView)
//        addConstraintsWithFormat(format: "V:[v0(68)]",  views: profileImageView)
//
//        addConstraint(NSLayoutConstraint(item: profileImageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
//
//        addConstraintsWithFormat(format: "H:|-82-[v0]|", views: dividerLineView)
//        addConstraintsWithFormat(format:  "V:[v0(1)]|", views: dividerLineView)
//    }
//
//    private func setupContainerView() {
//        let containerView = UIView()
//        addSubview(containerView)
//
//        addConstraintsWithFormat(format: "H:|-90-[v0]|",  views: containerView)
//        addConstraintsWithFormat(format: "V:[v0(50)]",  views: containerView)
//        addConstraint(NSLayoutConstraint(item: containerView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
//
//        containerView.addSubview(nameLabel)
//        containerView.addSubview(messageLabel)
//        containerView.addSubview(timeLabel)
//        containerView.addSubview(hasReadImageView)
//
//        containerView.addConstraintsWithFormat(format: "H:|[v0][v1(80)]-12-|",  views: nameLabel, timeLabel)
//
//        containerView.addConstraintsWithFormat(format:  "V:|[v0][v1(24)]|", views: nameLabel, messageLabel)
//
//        containerView.addConstraintsWithFormat(format: "H:|[v0]-8-[v1(20)]-12-|" , views: messageLabel, hasReadImageView)
//
//        containerView.addConstraintsWithFormat(format: "V:|[v0(24)]",  views: timeLabel)
//
//        containerView.addConstraintsWithFormat(format: "V:[v0(20)]|",  views: hasReadImageView)
//    }
//
//}
//
//extension UIView {
//
//    func addConstraintsWithFormat(format: String, views: UIView...) {
//
//        var viewsDictionary = [String: UIView]()
//        for (index, view) in views.enumerated() {
//            let key = "v\(index)"
//            viewsDictionary[key] = view
//            view.translatesAutoresizingMaskIntoConstraints = false
//        }
//
//        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
//    }
//
//}
//
//class BaseCell: UICollectionViewCell {
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupViews()
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    func setupViews() {
//        backgroundColor = .blue
//    }
}


