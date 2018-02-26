//
//  ActionTrampline.swift
//  SimuLooker
//
//  Created by caijinzhu on 2018/2/26.
//  Copyright © 2018年 alexiuce.github.io. All rights reserved.
//

import Foundation
import Cocoa



let NSControlActionFunctionAssociatedObjectKey = UnsafeMutablePointer<Int8>.allocate(capacity: 1)



class ActiontTrampoline: NSObject {
    var action: (NSControl) -> Void
    init(action: @escaping(NSControl) -> Void) {
        self.action = action
    }
    
    @objc func action(sender: NSControl){
        action(sender)
    }
}

extension NSControl{
    @nonobjc func setAction(action: @escaping (NSControl)->Void){
        let trampoline = ActiontTrampoline(action: action)
        target = trampoline
       
        self.action = #selector(ActiontTrampoline.action(sender:))
        objc_setAssociatedObject(self, NSControlActionFunctionAssociatedObjectKey, trampoline, .OBJC_ASSOCIATION_RETAIN)
    }
}
