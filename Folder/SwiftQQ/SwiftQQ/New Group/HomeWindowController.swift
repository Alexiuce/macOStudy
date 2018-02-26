//
//  HomeWindowController.swift
//  SwiftQQ
//
//  Created by Alexcai on 2018/2/18.
//  Copyright © 2018年 Alexcai. All rights reserved.
//

import Cocoa

class HomeWindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
        // 点击内容拖动窗口
        window?.isMovableByWindowBackground = true
        // 设置操作按钮居中显示在顶部视图
        updateTitleBarView()
    }

    deinit {
        print("home controller be dealloc ")
    }
    
    fileprivate func updateTitleBarView(){
        // 1. 获取窗口的主视图
        guard let themeView = window?.contentView?.superview else { return  }
        // 2. 根据主视图获取titleBar view
        guard let titleBarView = themeView.subviews.last else { return  }
        // 3. 给titleBar view 添加约束效果,居中显示
        // 计算顶部居中显示公式: (顶部视图的高度 - titleBarView视图的高度: 系统默认值为22) / 2
        titleBarView.snp.makeConstraints { (make) in
            make.top.equalTo(15)
            make.left.equalTo(0)
            make.width.equalTo(60)
            make.height.equalTo(22)
        }
    }
}

extension HomeWindowController: NSWindowDelegate{
    
    func windowDidResize(_ notification: Notification) {
        updateTitleBarView()
    }
}

