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
            
            guard let temp = oldValue else {
                updateContraint()
                return
            }
            if temp.sourceType != model.sourceType{
               updateContraint()
            }
        }
    }
    
    fileprivate func updateContraint(){
       guard let model = dataModel else { return }

        if model.sourceType == .me {
            headImageView.snp.remakeConstraints({ (make) in
                make.width.height.equalTo(40)
                make.top.equalTo(5)
                make.right.equalToSuperview().offset(10)
            })
            
            messageTextLabel.snp.remakeConstraints({ (make) in
                make.right.equalTo(headImageView.snp.left).offset(5)
                make.top.equalTo(headImageView)
            })
            
            
        }else{
            headImageView.snp.remakeConstraints({ (make) in
                make.width.height.equalTo(40)
                make.top.equalTo(5)
                make.left.equalToSuperview().offset(10)
            })
            messageTextLabel.snp.remakeConstraints({ (make) in
                make.left.equalTo(headImageView.snp.right).offset(5)
                make.top.equalTo(headImageView)
            })
        }
    }
    
}
