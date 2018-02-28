//
//  SimuPath.swift
//  SimuLooker
//
//  Created by caijinzhu on 2018/2/27.
//  Copyright © 2018年 alexiuce.github.io. All rights reserved.
//

import Foundation


struct SimuPath {
    
    /* library URL */
    static var library : URL{
        let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.libraryDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first ?? ""
        return URL(fileURLWithPath: path)
    }
    
    /* 入口url */
    static var entryPath : URL{
        return library.appendingPathComponent("Developer/CoreSimulator/Devices")
    }

    /* device url */
    static func devicePath(udid: String) -> URL{
        return entryPath.appendingPathComponent("\(udid)")
    }
    /** application url */
    static func applicationPath(udid: String) -> URL{
        return devicePath(udid:udid).appendingPathComponent("data/Containers/Data/Application")
    }
    /* 设备中的application url */
    static func applicationInDevicePath(udid: String) -> URL{
        return devicePath(udid:udid).appendingPathComponent("data/Containers/Bundle/Application")
    }
    
    
    
    static func applicationContainerPlistPath(_ path: URL) -> URL{
        return path.appendingPathComponent(".com.apple.mobile_container_manager.metadata.plist")
    }
    
    
    
    
    /* 获取url下的所有文件夹 */
    static func allDirector(_ path: URL) ->[String] {
        let result = try? FileManager.default.contentsOfDirectory(atPath: path.path).filter({ (p) -> Bool in
            return SimuPath.isDirectory(path.appendingPathComponent(p).path)
        })
        return result ?? []
    }
    
    /* 判断是否为目录  */
    static func isDirectory(_ path: String) -> Bool{
        var flag = ObjCBool(false)
        FileManager.default.fileExists(atPath: path, isDirectory: &flag)
        return flag.boolValue
    }
    
    
}
