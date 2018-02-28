//
//  PreTableViewController.swift
//  SimuLooker
//
//  Created by caijinzhu on 2018/2/28.
//  Copyright © 2018年 alexiuce.github.io. All rights reserved.
//

import Cocoa

class PreTableViewController: NSTabViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    override func tabView(_ tabView: NSTabView, didSelect tabViewItem: NSTabViewItem?) {
        super.tabView(tabView, didSelect: tabViewItem)
        
        guard let itemView = tabViewItem?.view,
              let window = view.window,
              let controller = tabViewItem?.viewController
              else {return}
        
        if let  c = controller as? TwoController {
            
            print("back view size \(c.backgroundView.frame.size)")
        }
       
        
        
    }
    
    
    
    
}
