//
//  User.swift
//  SwapKitapp
//
//  Created by Bibizhan on 23.04.18.
//  Copyright © 2018 SDU. All rights reserved.
//

import Foundation
import FirebaseDatabase
struct User {
    
    private var name: String?
    private var email: String?
    
    init(_ name: String, _ email: String) {
        self.name = name
        self.email = email
    }
    init(snapshot: DataSnapshot) {
        let tweet = snapshot.value as! NSDictionary
        name = tweet.value(forKey: "Name") as? String
        email = tweet.value(forKey: "Gmail") as? String
    }
    var Name: String?{
        get{
            return name
        }
    }
 
    var Email: String?{
        get{
            return email
        }
    }
    func toJSONFormat()-> Any{
        return ["Name": name!,
                "Gmail": email!
        ]
    }
    
}

