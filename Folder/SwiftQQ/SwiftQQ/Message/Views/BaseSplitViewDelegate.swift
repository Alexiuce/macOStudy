//
//  BaseSplitViewDelegate.swift
//  SwiftQQ
//
//  Created by Alexcai on 2018/2/19.
//

import Cocoa


class BaseSplitViewDelegate: NSObject, NSSplitViewDelegate {

    var layout:NSCollectionViewFlowLayout?
    
    
    func splitView(_ splitView: NSSplitView, resizeSubviewsWithOldSize oldSize: NSSize) {
        guard let oldWidth = splitView.arrangedSubviews.first?.frame.size.width else { return  }
        splitView.adjustSubviews()
        splitView.setPosition(oldWidth, ofDividerAt: 0)
    }
    func splitView(_ splitView: NSSplitView, constrainMinCoordinate proposedMinimumPosition: CGFloat, ofSubviewAt dividerIndex: Int) -> CGFloat {
        return 100
    }
    func splitView(_ splitView: NSSplitView, constrainMaxCoordinate proposedMaximumPosition: CGFloat, ofSubviewAt dividerIndex: Int) -> CGFloat {
        return 200
    }
    
    func splitViewDidResizeSubviews(_ notification: Notification) {
        guard let width = layout?.collectionView?.frame.width else{ return }
        layout?.itemSize = NSMakeSize(width, 85)
    }
}
