//
//  LoginWindow.swift
//  SwiftQQ
//
//  Created by Alexcai on 2018/2/16.
//  Copyright © 2018年 Alexcai. All rights reserved.
//

import Cocoa

class LoginWindow: NSWindow {

    
    
    /* 重写这个方法: 让窗口默认支持为key Window
     只有key window 才能响应键盘焦点事件,实现输入操作 */
    override var canBecomeKey: Bool{
        return true
    }
}
