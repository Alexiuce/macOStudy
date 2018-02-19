//
//  CollectionItem.swift
//  SwiftQQ
//
//  Created by Alexcai on 2018/2/19.
//

import Cocoa

class CollectionItem: NSCollectionViewItem {

    @IBOutlet var backgroundView: NSView!
    @IBOutlet weak var headImage: NSImageView!      // 头像
    @IBOutlet weak var nameLabel: NSTextField!      // 名称
    @IBOutlet weak var msgLabel: NSTextField!       // 最近消息
    
    
    var model : MessageModel?{
        didSet{
            guard let tempModel = model else { return }
            headImage.image = NSImage(named: NSImage.Name(rawValue:tempModel.head))
            nameLabel.stringValue = tempModel.name
            msgLabel.stringValue = tempModel.messageText
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override var isSelected: Bool{
        didSet {
//            super.isSelected = isSelected
            updateColor()
        }
    }
    func updateColor() {
        if isSelected {
            backgroundView.layer?.backgroundColor = NSColor.lightGray.cgColor
        }else{
            backgroundView.layer?.backgroundColor = NSColor.white.cgColor
        }
    }
    
}
