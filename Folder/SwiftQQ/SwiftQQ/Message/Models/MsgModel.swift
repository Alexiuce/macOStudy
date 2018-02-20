//
//  MsgModel.swift
//  SwiftQQ
//
//  Created by Alexcai on 2018/2/19.
//  Copyright © 2018年 Alexcai. All rights reserved.
//  消息的数据模型

import Cocoa


class MsgModel: NSObject {
    var headName = ""   // 头像
    var name = ""       // 名称
    var text = ""       // 消息内容
    
    init(headName: String, username: String, message: String) {
        super.init()
        self.headName = headName
        name = username
        text = message
        
    }
}
