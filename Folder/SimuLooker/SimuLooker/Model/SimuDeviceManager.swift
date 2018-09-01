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
    
    @discardableResult
    static func loadSimuDevice() -> [String:[Device]] {
        let cmdResult = ShellTask.execCmd(cmd: "/usr/bin/xcrun", arguments: ["simctl","list","-j","devices"])
        let json = JSON.init(parseJSON: cmdResult)
        var result = [String:[Device]]()
        
        json["devices"].dictionaryValue.forEach { (key,value) in
            if !key.contains("iOS"){return}
            var newkey = key;
            let range = (key as NSString).range(of: ".iOS")
            if range.location != NSNotFound {
                newkey = (key as NSString).substring(from: range.location + 1)
            }
            result[newkey] = [Device]()
            value.arrayValue.forEach({ (deviceJson) in
                let device = Device(osInfo: newkey, json: deviceJson)
                if device.appArray.count > 0 {
                    result[newkey]?.append(device)
                }
            })
            
            guard let count = result[newkey]?.count else { return }
            if count < 1 {
                result[newkey] = nil
            }
        }
        
        return result
    }
}
