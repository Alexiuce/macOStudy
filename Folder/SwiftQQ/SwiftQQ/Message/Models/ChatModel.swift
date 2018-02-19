//
//  ChatModel.swift
//  SwiftQQ
//
//  Created by Alexcai on 2018/2/19.
//

import Cocoa

class ChatModel: NSObject {

    var icon = ""
    var content = ""
    
    init(icon: String, content: String) {
        super.init()
        self.icon = icon
        self.content = content
    }
    
}
