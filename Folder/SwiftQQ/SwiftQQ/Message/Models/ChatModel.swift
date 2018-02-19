//
//  ChatModel.swift
//  SwiftQQ
//
//  Created by Alexcai on 2018/2/19.
//

import Cocoa

class ChatModel: NSObject {

    enum ChatStyle {
        case me
        case other
    }
    
    var icon = ""
    var content = ""
    var sourceType : ChatStyle = .me
    init(icon: String, content: String ,sourceType: ChatStyle) {
        super.init()
        self.icon = icon
        self.content = content
        self.sourceType = sourceType
    }
    
}
