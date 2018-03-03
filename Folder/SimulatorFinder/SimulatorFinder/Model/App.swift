//
//  App.swift
//  SimulatorFinder
//
//  Created by Alexcai on 2018/2/28.
//  Copyright © 2018年 Alexcai. All rights reserved.
//

import Cocoa


class App {
    //名称
    var name = ""
    var icon: NSImage?
    var bid = ""  // app 的bundle identify
    var appDocumentPath: URL?   // 用来打开app data的路径
    var appPath: URL?{
        didSet{
            guard let path = appPath else {return}
            guard let appBundle = PathManager.allSubDirectoryInPath(path).first else {return}
            let plistPath = path.appendingPathComponent("\(appBundle)/Info.plist")
            guard let plistDict = NSDictionary(contentsOfFile: plistPath.path) else {return}
            // 设置应用名
            name = plistDict["CFBundleDisplayName"] as? String ?? plistDict["CFBundleName"] as? String ?? ""
            // 设置bundle id
            bid = plistDict["CFBundleIdentifier"] as? String ?? ""
            // 设置应用icon
            guard let CFBundleIcons = plistDict["CFBundleIcons"] as? NSDictionary,
                  let CFBundlePrimaryIcon = CFBundleIcons["CFBundlePrimaryIcon"] as? NSDictionary,
                  let CFBundleIconFiles = CFBundlePrimaryIcon["CFBundleIconFiles"] as? NSArray,
                  let iconName = CFBundleIconFiles.lastObject as? String
                  else {return}
            
            icon = Bundle(url: path.appendingPathComponent(appBundle))?.image(forResource: NSImage.Name(iconName))
        }
    }
}
