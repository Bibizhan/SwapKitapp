//
//  Stopwatch.swift
//  SwapKitapp
//
//  Created by Bibizhan on 21.04.18.
//  Copyright © 2018 SDU. All rights reserved.
//

import Foundation
class Stopwatch {
    
    private var startTime: NSDate?
    
    var time: TimeInterval{
        if let startTime = self.startTime{
            return -startTime.timeIntervalSinceNow
        }
        else{
            return 0
        }
    }
    var isRunnig: Bool{
        return startTime != nil
    }
    
    func start(){
        startTime = NSDate()
    }
    
    func stop(){
        startTime = nil
    }
//    func pause(){
//        startTime = NSDate().
//    }
}
