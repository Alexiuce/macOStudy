//
//  SimuApplication.swift
//  SimuLooker
//
//  Created by caijinzhu on 2018/2/27.
//  Copyright © 2018年 alexiuce.github.io. All rights reserved.
//

import Cocoa
import SwiftyJSON


class SimuApplication {
    
    var name = ""
    var icon: NSImage?
    
    var path: URL?{
        didSet{
            guard let p = path else { return }
            
            guard let app = SimuPath.allDirector(p).first else { return  }
            
            guard let json = NSDictionary(contentsOf: p.appendingPathComponent("\(app)/Info.plist")) else { return  }
            self.name = (json["CFBundleDisplayName"] as? String ) ?? (json["CFBundleName"] as? String) ?? ""
            guard let bundleIcon = json["CFBundleIcons"] as? NSDictionary,
                  let primaryIcon = bundleIcon["CFBundlePrimaryIcon"] as? NSDictionary,
                  let iconFiles = primaryIcon["CFBundleIconFiles"] as? [String],
                  let imgName = iconFiles.first
                  else { return  }
            icon = Bundle(url: p.appendingPathComponent("\(app)"))?.image(forResource: NSImage.Name(imgName))
        }
    }
    
    /* 根据指定device 获取所有的安装的application */
    static func loadAllApplicationOnDevice(_ deviceUdid: String) -> [SimuApplication]{
        // 1. 根据udid 获取device 中的application url
        let applicationUrl = SimuPath.applicationInDevicePath(udid: deviceUdid)
        // 2. 获取application url 所有的文件夹
        let allContents =  try? FileManager.default.contentsOfDirectory(atPath: applicationUrl.path).filter({ (name) -> Bool in
            return !name.hasPrefix(".") && SimuPath.isDirectory(applicationUrl.appendingPathComponent("\(name)").path)
        }).map { (content) -> SimuApplication in
            let app = SimuApplication()
            app.path = applicationUrl.appendingPathComponent(content)
            return app
        }
        return allContents ?? []
    }
}
