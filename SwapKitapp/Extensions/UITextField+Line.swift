//
//  UITextField+Line.swift
//  SwapKitapp
//
//  Created by Bibizhan on 10.04.18.
//  Copyright © 2018 SDU. All rights reserved.
//

import Foundation
import UIKit
extension UITextField {
    func setBottomBorder() {
        self.borderStyle = .none
        self.layer.backgroundColor = UIColor.clear.cgColor
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.white.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
 
}
