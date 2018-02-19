//
//  MessageViewController.swift
//  SwiftQQ
//
//  Created by Alexcai on 2018/2/18.
//

import Cocoa

class MessageViewController: NSViewController {

    @IBOutlet weak var baseSplitView: NSSplitView!
    @IBOutlet weak var subSplitView: NSSplitView!
    @IBOutlet weak var collectionView: NSCollectionView!
    
    @IBOutlet weak var collectionFlowLayout: NSCollectionViewFlowLayout!
    
    var messageData = [MessageModel]()   // 消息数组
    
    let baseSplitViewDelegate = BaseSplitViewDelegate()
    let subSplitViewDelegate = SubSplitViewDelegate()
    class func controller() -> MessageViewController{
        let vc = NSStoryboard.init(name: NSStoryboard.Name.init(rawValue: "message"), bundle: nil).instantiateInitialController() as! MessageViewController
        return vc
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer?.backgroundColor = NSColor.brown.cgColor
        // 1. 数据初始化
        setupData()
        // 2. UI初始化
        setupUI()
    }
}
// MARK: 初始化方法
extension MessageViewController{
    fileprivate func setupData(){
        // 1. 初始化消息数据
        let msgData = MessageModel(headName: "test", name: "Bob", msg: "好好学习")
        let msgData1 = MessageModel(headName: "test", name: "Steve", msg: "good good study")
        let msgData2 = MessageModel(headName: "test", name: "小宝", msg: "mac很不错")
        let msgData3 = MessageModel(headName: "test", name: "爱和水", msg: "我爱iOS")
        let msgData4 = MessageModel(headName: "test", name: "妞妞", msg: "睡觉去了")
        
        messageData.append(msgData)
        messageData.append(msgData1)
        messageData.append(msgData2)
        messageData.append(msgData3)
        messageData.append(msgData4)
    }
    fileprivate func setupUI(){
        baseSplitView.delegate = baseSplitViewDelegate
        subSplitView.delegate = subSplitViewDelegate
        
        // 设置CollectionView
        configCollectionView()
    }
}

// MARK:
extension MessageViewController: NSCollectionViewDelegate,NSCollectionViewDataSource{
    // 每组有多少行
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return messageData.count
    }
    // 返回每组的item view
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let item = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier.init("messageItem"), for: indexPath) as! CollectionItem
        item.model = messageData[indexPath.item]
        return item
    }
}

// MARK: 自定义方法
extension MessageViewController{
    fileprivate func configCollectionView(){
        collectionFlowLayout.itemSize = NSMakeSize(collectionView.frame.width, 85)
        collectionFlowLayout.minimumLineSpacing = 0
        collectionFlowLayout.minimumInteritemSpacing = 0
        let itemNib = NSNib(nibNamed: NSNib.Name.init("CollectionItem"), bundle: nil)
        collectionView.register(itemNib, forItemWithIdentifier: NSUserInterfaceItemIdentifier.init("messageItem"))
        baseSplitViewDelegate.layout = collectionFlowLayout
    }
}

