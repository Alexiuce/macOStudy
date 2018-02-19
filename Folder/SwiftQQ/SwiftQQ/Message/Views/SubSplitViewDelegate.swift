//
//  SubSplitViewDelegate.swift
//  SwiftQQ
//
//  Created by Alexcai on 2018/2/19.
//

import Cocoa

class SubSplitViewDelegate: NSObject, NSSplitViewDelegate {
    
    func splitView(_ splitView: NSSplitView, resizeSubviewsWithOldSize oldSize: NSSize) {
        guard let oldHeight = splitView.arrangedSubviews.first?.frame.size.height else { return  }
        splitView.adjustSubviews()
        let delatH = splitView.frame.size.height - oldSize.height
        
        splitView.setPosition(oldHeight + delatH, ofDividerAt: 0)
    }
    func splitView(_ splitView: NSSplitView, constrainMinCoordinate proposedMinimumPosition: CGFloat, ofSubviewAt dividerIndex: Int) -> CGFloat {
        return splitView.frame.size.height * 0.7
    }
    func splitView(_ splitView: NSSplitView, constrainMaxCoordinate proposedMaximumPosition: CGFloat, ofSubviewAt dividerIndex: Int) -> CGFloat {
        return splitView.frame.size.height * 0.9
    }
}
