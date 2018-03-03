//
//  Device.swift
//  SimulatorFinder
//
//  Created by Alexcai on 2018/2/28.
//  Copyright © 2018年 Alexcai. All rights reserved.
//

import Foundation

import SwiftyJSON

class Device {
    // 属性
    var udid = ""
    var state = ""     // Booted : 已启动   Booting // 在启动中  // shutdown: 未启动
    var availability = ""
    var name = ""
    var os : OS
    
    var installApps =  [App]()   // 记录设备中安装的所有app信息
    
    init(_ device_os: OS, json:JSON ) {
        udid = json["udid"].stringValue
        state = json["state"].stringValue
        availability = json["availability"].stringValue
        name = json["name"].stringValue
        os = device_os
        installApps = loadAllApplication(udid)
    }
    
    
    fileprivate func loadAllApplication(_ udid: String) -> [App]{
        // 获取模拟器设备中安装application的路径信息
        let appPath = PathManager.applicationInDevice(udid)
        // 获取application路径下的所有子路径(也就是每个app的路径)
        let allAppInfo = PathManager.allSubDirectoryInPath(appPath)
        return allAppInfo.map({ (appContext) -> App in
             let application = App()
             application.appPath = appPath.appendingPathComponent(appContext)
            
             // 设置app的document路径
             let appDocumentPath = PathManager.applicationDocumentURL(udid)
            PathManager.allSubDirectoryInPath(appDocumentPath).forEach({ (randomString) in
                let plistUrl = appDocumentPath.appendingPathComponent(randomString).appendingPathComponent(".com.apple.mobile_container_manager.metadata.plist")
                
                guard let plistDict = NSDictionary(contentsOf: plistUrl) else{return}
                guard let targetAppBunldeID = plistDict["MCMMetadataIdentifier"] as? String else{return}
                if application.bid == targetAppBunldeID {
                    application.appDocumentPath = appDocumentPath.appendingPathComponent(randomString)
                }
                
            })
            return application
        })
    }
    
}
