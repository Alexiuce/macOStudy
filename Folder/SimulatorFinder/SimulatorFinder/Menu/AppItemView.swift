//
//  AppItemView.swift
//  SimulatorFinder
//
//  Created by Alexcai on 2018/3/3.
//  Copyright © 2018年 Alexcai. All rights reserved.
//

import Cocoa

class AppItemView: NSView {
    @IBOutlet var contentView: NSView!
    
    @IBOutlet weak var appName: NSTextField!
    
    @IBOutlet weak var appID: NSTextField!
    
    @IBOutlet weak var appIcon: NSImageView!
    
    var appData : App?   // 用来接收app模型数据
    
    override init(frame frameRect: NSRect) {
       
        super.init(frame: frameRect)
        Bundle.main.loadNibNamed(NSNib.Name.init(rawValue: "AppItemView"), owner: self, topLevelObjects: nil)
        addSubview(contentView)
    }
    
    required init?(coder decoder: NSCoder) {
       super.init(coder: decoder)
    }
    
    @IBAction func openAppLocation(_ sender: Any) {
        
        guard let app = appData else { return  }
        print("click app location button")
        guard let appLocationUrl = app.appPath else { return  }
        // 打开指定url路径
        NSWorkspace.shared.open(appLocationUrl)
    }
    
    
    @IBAction func openDoclocation(_ sender: Any) {
         print("click app document button")
          guard let app = appData else { return  }
         guard let appDocumentURL = app.appDocumentPath  else { return  }
         NSWorkspace.shared.open(appDocumentURL)
    }
    
}
