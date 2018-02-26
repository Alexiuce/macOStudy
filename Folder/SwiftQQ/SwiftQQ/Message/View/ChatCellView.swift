//
//  ChatCellView.swift
//  SwiftQQ
//
//  Created by Alexcai on 2018/2/19.
//  Copyright © 2018年 Alexcai. All rights reserved.
//

import Cocoa

class ChatCellView: NSTableCellView {

    @IBOutlet weak var textLabel: NSTextField!
    
    @IBOutlet weak var iconImageView: NSImageView!
    
    
    var chatModel : ChatDataModel? {
        didSet{
            guard let model = chatModel else { return  }
            textLabel.stringValue = model.text
            iconImageView.image = NSImage(named: NSImage.Name(rawValue: model.headIcon))
            
            guard let temp = oldValue else {
                updateNewConstraints()
                return
                
            }
            if temp.chatType != model.chatType {
                updateNewConstraints()
            }
            
        }
    }
    // 更新控件约束,实现不同的类型的消息,显示不同的布局样式
    fileprivate func updateNewConstraints() {
       guard let model = chatModel else { return  }
        if model.chatType == .me {   // 我的消息类型
            iconImageView.snp.remakeConstraints({ (make) in
                make.width.height.equalTo(40)
                make.top.equalTo(5)
                make.right.equalToSuperview().offset(-15)
            })
            
            textLabel.snp.remakeConstraints({ (make) in
                make.right.equalTo(iconImageView.snp.left).offset(-10)
                make.top.equalTo(iconImageView)
            })
            
        }else{      // 他人的消息类型
            iconImageView.snp.remakeConstraints({ (make) in
                make.width.height.equalTo(40)
                make.top.equalTo(5)
                make.left.equalToSuperview().offset(15)
            })
            
            textLabel.snp.remakeConstraints({ (make) in
                make.left.equalTo(iconImageView.snp.right).offset(10)
                make.top.equalTo(iconImageView)
            })
        }
    }
    
}
