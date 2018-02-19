//
//  MessageModel.swift
//  SwiftQQ
//
//  Created by Alexcai on 2018/2/19.
//

import Cocoa

class MessageModel: NSObject {
    var head = ""
    var name = ""
    var messageText = ""
    
    init(headName:String, name:String, msg:String) {
        super.init()
        self.head = headName
        self.name = name
        self.messageText = msg
    }
}
