//
//  DeviceManager.swift
//  SimulatorFinder
//
//  Created by Alexcai on 2018/2/28.
//  Copyright © 2018年 Alexcai. All rights reserved.
//

import Foundation

import SwiftyJSON

class DeviceManager {
    
    static func loadDevice() -> [String: [Device]]{
        let resut = Shell.execmd("/usr/bin/xcrun", arguments: ["simctl","list","-j","devices"])
        let json = JSON.init(parseJSON: resut)
        
        var devicesDict = [String: [Device]]()
        json["devices"].dictionaryValue.forEach { (osKey, value) in
            // 在foreach中,使用return 相当于普通for循环中的continue
            if !osKey.contains("iOS"){return}
    
            if value.arrayValue.count > 0 {
                devicesDict[osKey] = [Device]()
                value.arrayValue.forEach({ (deviceJson) in
                    let device = Device(convertOS(osKey), json: deviceJson)
                    // 判断设备是否有安装过app,只将安装过app的设备添加到数组中
                    if device.installApps.count > 0 {
                        devicesDict[osKey]?.append(device)
                    }
                })
            }
        }
        return devicesDict
    }
    
    
    static func convertOS(_ key: String) -> OS {
        if key.contains("tvOs") {
            return .tvOs
        }else if key.contains("watchOS"){
            return .watchOs
        }else if key.contains("iOS"){
            return .iOS
        }else{
            return .unknow
        }
    }
    
    
}
