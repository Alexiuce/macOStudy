//
//  Devices.swift
//  SimuLooker
//
//  Created by caijinzhu on 2018/2/27.
//  Copyright © 2018年 alexiuce.github.io. All rights reserved.
//

import Foundation

import SwiftyJSON

class Device {
    let name : String
    let udid : String
    let osInfo : String
    let isOpen : Bool
    let isAvailable : Bool
 
    
    let appArray: [SimuApplication]
    
    
    init(osInfo: String, json:JSON) {
        name = json["name"].stringValue
        udid = json["udid"].stringValue
        self.osInfo = osInfo
        isOpen = json["state"].stringValue.contains("Booted")
        isAvailable = json["availability"].stringValue.contains("(available)")
        appArray = SimuApplication.loadAllApplicationOnDevice(udid)
        
    }
}

