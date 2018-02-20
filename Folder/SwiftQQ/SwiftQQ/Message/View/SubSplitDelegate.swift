//
//  SubSplitDelegate.swift
//  SwiftQQ
//
//  Created by Alexcai on 2018/2/19.
//  Copyright © 2018年 Alexcai. All rights reserved.
//

import Cocoa

class SubSplitDelegate: NSObject , NSSplitViewDelegate{
    // 实现底部视图尺寸固定不变
    func splitView(_ splitView: NSSplitView, resizeSubviewsWithOldSize oldSize: NSSize) {
        // 1. 获取原有顶部视图的高度
        guard let oldHeight = splitView.arrangedSubviews.first?.frame.height else { return  }
        // 2. 调整splitView的布局
        splitView.adjustSubviews()
        // 3. 计算新的分隔条位置
        let changedHeight = splitView.frame.height - oldSize.height  // 改变后的高度 - 原来的高度
        // 4. 设置splitView的分隔条位置
        splitView.setPosition(oldHeight + changedHeight, ofDividerAt: 0)
    }
    
    // 限制间隔条的最小值
    func splitView(_ splitView: NSSplitView, constrainMinCoordinate proposedMinimumPosition: CGFloat, ofSubviewAt dividerIndex: Int) -> CGFloat {
        return splitView.frame.height * 0.7
    }
    // 限制间隔条的最大值
    func splitView(_ splitView: NSSplitView, constrainMaxCoordinate proposedMaximumPosition: CGFloat, ofSubviewAt dividerIndex: Int) -> CGFloat {
        return splitView.frame.height * 0.85
    }
}
