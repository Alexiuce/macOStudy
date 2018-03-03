//
//  PathManager.swift
//  SimulatorFinder
//
//  Created by Alexcai on 2018/3/2.
//  Copyright © 2018年 Alexcai. All rights reserved.
//  用来管理所有路径相关功能的模块

import Foundation



struct PathManager {
    
    
    // 系统资源库的路径 : 入口的路径
    static var entryPathUrl : URL{
        let libraryPath =  NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.libraryDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first ?? ""
        let libraryURL = URL(fileURLWithPath: libraryPath)
        return libraryURL.appendingPathComponent("Developer/CoreSimulator/Devices")
    }
    
    // 根据设备的UDID获取安装的App的路径
    static func applicationInDevice(_ udid: String) -> URL{
        return entryPathUrl.appendingPathComponent("\(udid)/data/Containers/Bundle/Application")
    }
    /* 获取app的Document 的url*/
    static func applicationDocumentURL(_ udid: String) -> URL{
        return entryPathUrl.appendingPathComponent("\(udid)/data/Containers/Data/Application")
    }
    
    
    // 获取指定路径下的所有内容子路径(不包括文件)
    static func allSubDirectoryInPath(_ path: URL) -> [String] {
        let allDirectory = (try? FileManager.default.contentsOfDirectory(atPath: path.path))?.filter({ (appPath) -> Bool in
            return isDirectory(path.appendingPathComponent(appPath).path) && !appPath.hasPrefix(".")
        })
        return allDirectory ?? []
    }
    
    
    // 判断指定path是否为文件夹
    static func isDirectory(_ path: String) -> Bool{
        var flag = ObjCBool(false)
        FileManager.default.fileExists(atPath: path, isDirectory: &flag)
        return flag.boolValue
    }
    
    
}
