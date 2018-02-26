//
//  MsgCollectionItem.swift
//  SwiftQQ
//
//  Created by Alexcai on 2018/2/19.
//  Copyright © 2018年 Alexcai. All rights reserved.
//

import Cocoa

class MsgCollectionItem: NSCollectionViewItem {

    @IBOutlet var backgroundView: NSView!   // 背景视图
    @IBOutlet weak var headImageView: NSImageView!  // 头像
    @IBOutlet weak var nameLabel: NSTextField!      // 名称
    @IBOutlet weak var textLabel: NSTextField!      // 消息
    
    
    
    
    
    // 数模模型属性,用来接收数据
    var itemModel : MsgModel? {
        didSet{
            guard let temp = itemModel else { return }
            headImageView.image = NSImage(named: NSImage.Name(rawValue: temp.headName))
            nameLabel.stringValue = temp.name
            textLabel.stringValue = temp.text
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    override var isSelected: Bool{
        didSet{
            let currentColor = isSelected ? NSColor.lightGray.cgColor : NSColor.white.cgColor
            backgroundView.layer?.backgroundColor = currentColor
        }
    }
    
}
