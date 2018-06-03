//
//  Book.swift
//  SwapKitapp
//
//  Created by Bibizhan on 23.04.18.
//  Copyright © 2018 SDU. All rights reserved.
//

import Foundation
import Firebase

class Book: DictionaryConvertible {
    
    var key: String
    var ownerName: String
    var bookName: String
    var ref: DatabaseReference?
    var isSwapped: Bool
    var isNeeded: Bool
    
    init(bookName: String, ownerName: String, isSwapped: Bool, isNeeded: Bool, key: String = "") {
        self.bookName = bookName
        self.ownerName = ownerName
        self.isSwapped = isSwapped
        self.isNeeded = isNeeded
        self.key = key
        self.ref = nil
    }
    
    init(snapshot: DataSnapshot) {
        key = snapshot.key
        let dict = snapshot.value as! [String: AnyObject]
        bookName = dict["bookName"] as! String
        ownerName = dict["ownerName"] as! String
        isSwapped = dict["isSwapped"] as! Bool
        isNeeded = dict["isNeeded"] as! Bool
        ref = snapshot.ref
    }
    
    var dict: [String: AnyObject] {
        return [
            "bookName": bookName as AnyObject,
            "ownerName": ownerName as AnyObject,
            "isSwapped": isSwapped as AnyObject,
            "isNeeded": isNeeded as AnyObject
        ]
    }
}

protocol DictionaryConvertible: class {
    var dict:[String:AnyObject] { get }
}
