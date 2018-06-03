//
//  ViewController.swift
//  SwapKitapp
//
//  Created by Bibizhan on 10.04.18.
//  Copyright © 2018 SDU. All rights reserved.
//
import UIKit
import Cartography
import Firebase
import SlideController
import XLPagerTabStrip

class SecondViewController: UIViewController {

//    let ref = Database.database().reference()
    let watch = Stopwatch()
    var isPlaying = false

    let bgImageView : UIImageView = {
        let bgImageView = UIImageView()
        bgImageView.image = UIImage(named: "b.jpg")
        bgImageView.contentMode = .scaleAspectFill
        bgImageView.alpha = 0.5
        return bgImageView
    }()

    let profileView: UIView = {
        let profileView = UIView()
        profileView.backgroundColor = .secondBg
        profileView.isHidden = true
        return profileView
    }()

    let profileImage: UIImageView = {
        let profileImage = UIImageView()
        profileImage.image = UIImage(named: "photo.jpg")
        profileImage.isHidden = true
        return profileImage
    }()

    let username: UILabel = {
        let username = UILabel()
        username.font = UIFont(name: "Avenir", size: 19)
        username.text = "user"
        username.textColor = .white
        username.isHidden = true
        return username
    }()



    let messagesButton : UIButton = {
        let messagesButton = UIButton()
        messagesButton.isHidden = true
        messagesButton.backgroundColor = .clear
        messagesButton.titleLabel?.font =  UIFont(name: "Avenir", size: 17)
        messagesButton.setTitle("Messages", for: .normal)
        return messagesButton
    }()

    let searchButton : UIButton = {
        let searchButton = UIButton()
        searchButton.backgroundColor = .clear
        searchButton.isHidden = true
        searchButton.titleLabel?.font =  UIFont(name: "Avenir", size: 17)
        searchButton.setTitle("Search", for: .normal)
        // profileButton.addTarget(self, action: #selector(menuTapped),for: .touchUpInside)
        return searchButton
    }()


    let label: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir", size: 17)
        label.text = "Hi, User"
        label.textColor = .white
        return label
    }()

    let timerLabel: UILabel = {
        let timerLabel = UILabel()
        timerLabel.font = UIFont(name: "Avenir", size: 110)
        timerLabel.text = "00:00"
        timerLabel.textColor = .white
        return timerLabel
    }()

    let startButton : UIButton = {
        let start = UIButton()
        start.backgroundColor = .clear
        start.setTitle("START", for: .normal)
        start.titleLabel?.font =  UIFont(name: "Avenir", size: 20)
        start.addTarget(self, action: #selector(startTapped),for: .touchUpInside)
        return start
    }()

//    let pauseButton : UIButton = {
//        let pause = UIButton()
//        pause.backgroundColor = .clear
//        pause.setTitle("PAUSE", for: .normal)
//        pause.titleLabel?.font =  UIFont(name: "Avenir", size: 18)
//        pause.addTarget(self, action: #selector(pauseTapped),for: .touchUpInside)
//        return pause
//    }()

    let resetButton : UIButton = {
        let reset = UIButton()
        reset.backgroundColor = .clear
        reset.setTitle("STOP", for: .normal)
        reset.titleLabel?.font =  UIFont(name: "Avenir", size: 20)
        reset.addTarget(self, action: #selector(stopTapped),for: .touchUpInside)
        return reset
    }()


    @objc func startTapped(){
        print("start")
        isPlaying = true
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimeLabel), userInfo: nil, repeats: true)
        watch.start()

    }

//    @objc func pauseTapped(){
//        print("pause")
//        let timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimeLabel), userInfo: nil, repeats: true)
//        timer.invalidate()
//        isPlaying = false
//
//    }

    @objc func stopTapped(){
        print("stop")
        watch.stop()
        isPlaying = false
    }

    @objc func updateTimeLabel(timer: Timer){
        if watch.isRunnig{
            let minutes = (Int(watch.time))/60
            let seconds = (Int(watch.time))%60
            timerLabel.text = String(format: "%02d:%02d", minutes, seconds)
        }
        else{
            timer.invalidate()
        }
    }



    override func viewDidLoad() {
       super.viewDidLoad()
        view.addSubview(bgImageView)
        view.addSubview(label)
        view.addSubview(timerLabel)
        view.addSubview(startButton)
      //  view.addSubview(pauseButton)
        view.addSubview(resetButton)

        view.addSubview(profileView)
        view.addSubview(profileImage)
        view.addSubview(username)
        view.addSubview(messagesButton)
        view.addSubview(searchButton)

        color()
        setupConstraints()
        configureViews()

    }
    
    func configureViews(){
        setupNavBar()
    }
    
    @objc func listTapped(){
        self.present(appDelegate.menuManager.menuLeftNavigationController!, animated: true)
        
    }
    
    func setupNavBar(){
        let leftBarButton = UIBarButtonItem(image:UIImage(named:"list"), style: .plain, target: self, action: #selector(listTapped))
        self.navigationItem.leftBarButtonItem  = leftBarButton
        leftBarButton.tintColor = .white
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
        self.navigationController?.view.backgroundColor = .clear
    }

    func setupConstraints(){
        constrain(bgImageView, label, view){ bg,  lb, vw in
            bg.top == vw.top
            bg.bottom == vw.bottom
            bg.left == vw.left
            bg.right == vw.right


            lb.top == vw.top + 40
            lb.left == vw.left + 160
        }
        constrain(timerLabel ,startButton, resetButton, view){tm, sb,  rb, vw in
            tm.top == vw.top + 240
            tm.left == vw.left + 45

            sb.top == tm.bottom + 50
            sb.left == tm.left + 65

//            pb.top == sb.top
//            pb.left == sb.left + 100

            rb.top == sb.top
            rb.left == sb.left + 100

        }
}
    func color(){
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [UIColor.firstBg.cgColor, UIColor.secondBg.cgColor]
        self.view.layer.insertSublayer(gradient, at: 0)

    }
   

}




