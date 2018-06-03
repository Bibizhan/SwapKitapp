//
//  SideMenuViewController.swift
//  SwapKitapp
//
//  Created by Bibizhan on 22.04.18.
//  Copyright © 2018 SDU. All rights reserved.
//



import UIKit
import Cartography
import SideMenu
class SideMenuViewController: UIViewController {

    let displayHeight = UIScreen.main.bounds.height
    let displayWidth = UIScreen.main.bounds.width
    
    
    
    
    typealias MenuItem = (image:UIImage?,title:String?,controllers:UIViewController)
    var items = [MenuItem](){
        didSet {
            tableView.reloadData()
        }
    }
    
    

    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "image")
        image.layer.cornerRadius = 5
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "b.orazaliyeva@gmail.com"
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome!"
        label.textColor = .lightGray
        label.sizeToFit()
        label.font = .systemFont(ofSize: 15)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.minimumScaleFactor = 0.5
        return label
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.rowHeight = 60 / 736 * displayHeight
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.clipsToBounds = true
        tableView.layer.masksToBounds = true
        tableView.contentInset = UIEdgeInsets(top: -1,left: 0,bottom: 0,right: 0);
        tableView.register(SideMenuTableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        configureConstraints()
        setupSideMenu()
    }

    func setupSideMenu(){
        items = [(#imageLiteral(resourceName: "user"),"Main", SecondViewController()),
                 (#imageLiteral(resourceName: "mes"),"Messages", FriendsController()),
                 (#imageLiteral(resourceName: "photo"),"Profile", ProfileViewController()),
                 (#imageLiteral(resourceName: "search"),"Search", SearchViewController())]
        return
    }
    

    func configureViews(){
        setupNavBar()
        
        [imageView,userNameLabel,emailLabel,tableView].forEach {(views) in
            view.addSubview(views)
        }
        
    }
    
    func configureConstraints(){
        constrain(imageView,userNameLabel,emailLabel,view,tableView){i,u,e,v,t in
            i.top == v.top + (35 / 736 * displayHeight)
            i.centerX == v.centerX
            i.width == 120 / 414 * displayWidth
            i.height == 120 / 736 * displayHeight
            
            u.top == i.bottom + (20 / 736 * displayHeight)
            u.centerX == v.centerX
            u.height == 20 / 736 * displayHeight
            
            e.top == u.bottom + (10 / 736 * displayHeight)
            e.centerX == v.centerX
            e.height == 20 / 736 * displayHeight
            
            t.top == e.bottom + 40 / 736 * displayHeight
            t.left == v.left + 10
            t.right == v.right
            t.height == 400 / 736 * displayHeight
        }
    }
    
    func setupNavBar(){
        view.backgroundColor = .secondBg
        view.alpha = 0.9
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
        self.navigationController?.view.backgroundColor = .clear
    }
    
    
}

extension SideMenuViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SideMenuTableViewCell
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        
        let item = items[indexPath.row]
        cell.icons.image = item.image
        cell.title.text = item.title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = items[indexPath.row].controllers
        appDelegate.menu?.pushViewController(vc, animated: true)
        
    }
    
}
