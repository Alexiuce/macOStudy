//
//  SimuDeviceManager.swift
//  SimuLooker
//
//  Created by caijinzhu on 2018/2/27.
//  Copyright © 2018年 alexiuce.github.io. All rights reserved.
//

import Foundation

import SwiftyJSON

struct SimuDeviceManager {
    
    static var simuDeviceArray = [Device]()
    static var simuDeviceOSKey = [String]()
    
    
    @discardableResult
    static func loadSimuDevice() -> [Device] {
        let cmdResult = ShellTask.execCmd(cmd: "/usr/bin/xcrun", arguments: ["simctl","list","-j","devices"])
        let json = JSON.init(parseJSON: cmdResult)
        
        var tempArray = [Device]()
        json["devices"].dictionaryValue.forEach { (key, value) in
          
            value.arrayValue.forEach({ (deviceJson) in
                let deviceObj = Device(osInfo: key, json: deviceJson)
                tempArray.append(deviceObj)
            })
        
            simuDeviceOSKey.append(key)
            
        }

        simuDeviceArray = tempArray.filter{
            return $0.isAvailable && $0.osInfo.contains("iOS")
        }
        
        return simuDeviceArray
    }
    
    /* 根据OS信息获取device */
    static func devices(_ osInfo: String) -> [Device]{
        return simuDeviceArray.filter{
            return $0.osInfo.contains(osInfo)
        }
    }
    
    
}
