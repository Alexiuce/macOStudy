//
//  ChatDataModel.swift
//  SwiftQQ
//
//  Created by Alexcai on 2018/2/19.
//  Copyright © 2018年 Alexcai. All rights reserved.
//

import Cocoa

class ChatDataModel: NSObject {
    // 消息类型枚举
    enum ChatStyle {
        case me      // 自己
        case other   // 他人
    }
    
    // 1. 消息来源类型
    var chatType: ChatStyle = .me
    
    // 2. 消息的头像
    var headIcon = ""
    // 3. 用户名称
    var username = ""
    // 4. 消息的内容
    var text = ""
    
    
    init(headIcon: String, username: String, msgText: String, type: ChatStyle ){
        super.init()
        self.headIcon = headIcon
        self.username = username
        self.text = msgText
        self.chatType = type
    }
    
}
