//
//  BaseSplitViewDelegate.swift
//  SwiftQQ
//
//  Created by Alexcai on 2018/2/19.
//  Copyright © 2018年 Alexcai. All rights reserved.
//

import Cocoa

class BaseSplitViewDelegate: NSObject, NSSplitViewDelegate {
    // collectionView的布局,用来处理当splitView改变子视图时,collectionView的item更新size
    var collectionLayout: NSCollectionViewFlowLayout?
    
    
    // 实现一侧视图的尺寸固定不变
    func splitView(_ splitView: NSSplitView, resizeSubviewsWithOldSize oldSize: NSSize) {
      // 1. 获取需要保持不变的子视图的原有尺寸
       guard let leftWidth = splitView.arrangedSubviews.first?.frame.width  else { return  }
      // 2. 更新splitView的布局
        splitView.adjustSubviews()
      // 3. 设置分隔条的位置,保持原有不变
        splitView.setPosition(leftWidth, ofDividerAt: 0)
        
    }

    // 限制间隔条的最小值
    func splitView(_ splitView: NSSplitView, constrainMinCoordinate proposedMinimumPosition: CGFloat, ofSubviewAt dividerIndex: Int) -> CGFloat {
     return 100
    }
    // 限制间隔条的最大值
    func splitView(_ splitView: NSSplitView, constrainMaxCoordinate proposedMaximumPosition: CGFloat, ofSubviewAt dividerIndex: Int) -> CGFloat {
        return 200
    }
    
    // 更新子视图
    func splitViewDidResizeSubviews(_ notification: Notification) {
        guard let width = collectionLayout?.collectionView?.frame.width else { return }
       collectionLayout?.itemSize = NSMakeSize(width, 90)
    }
    
    
}
