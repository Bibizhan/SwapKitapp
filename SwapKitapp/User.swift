//
//  User.swift
//  SwapKitapp
//
//  Created by Bibizhan on 10.04.18.
//  Copyright © 2018 SDU. All rights reserved.
//

import Foundation
import Firebase
struct User {
    
    let uid: String
    let email: String
    
    init(authData: User) {
        uid = authData.uid
        email = authData.email
    }
    
    init(uid: String, email: String) {
        self.uid = uid
        self.email = email
}
}
