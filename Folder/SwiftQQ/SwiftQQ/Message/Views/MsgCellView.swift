//
//  MsgCellView.swift
//  SwiftQQ
//
//  Created by Alexcai on 2018/2/19.
//

import Cocoa

class MsgCellView: NSTableCellView {

    @IBOutlet weak var headImageView: NSImageView!
    @IBOutlet weak var messageTextLabel: NSTextField!
    
    var dataModel : ChatModel? {
        didSet{
            guard let model = dataModel else { return  }
            headImageView.image = NSImage(named: NSImage.Name(model.icon))
            messageTextLabel.stringValue = model.content
        }
    }
    
}
