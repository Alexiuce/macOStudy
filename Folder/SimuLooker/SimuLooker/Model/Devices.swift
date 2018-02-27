//
//  Devices.swift
//  SimuLooker
//
//  Created by caijinzhu on 2018/2/27.
//  Copyright © 2018年 alexiuce.github.io. All rights reserved.
//

import Foundation

import SwiftyJSON

struct Device {
    let name : String
    let udid : String
    let osInfo : String
    let isOpen : Bool
    let isAvailable : Bool
    let applications : [JSON]
    
    
    init(osInfo: String, json: String) {
        let jsonDict = JSON.init(parseJSON: json)
        name = jsonDict["name"].stringValue
        udid = jsonDict["udid"].stringValue
        self.osInfo = osInfo
        isOpen = jsonDict["isOpen"].boolValue
        isAvailable = jsonDict["isAvailabel"].boolValue
        applications = jsonDict["application"].arrayValue
    }
    
}

