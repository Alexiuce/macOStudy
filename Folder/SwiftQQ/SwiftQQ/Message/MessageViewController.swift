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
    
    @IBOutlet weak var msgTopView: NSView!    // 右侧顶部视图
    @IBOutlet weak var topNameLabel: NSTextField!  // 顶部视图用户名称
    
    @IBOutlet weak var msgTableView: NSTableView!
    
    var messageData = [MessageModel]()   // 消息数组
    
    var chatArray = [ChatModel]()
    
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
        // 2. 初始化聊天数据
        let chat1 = ChatModel(icon: "test1", content: "hahahdlakjdf")
        chatArray.append(chat1)
        
    }
    fileprivate func setupUI(){
        baseSplitView.delegate = baseSplitViewDelegate
        subSplitView.delegate = subSplitViewDelegate
        
        // 设置CollectionView
        configCollectionView()
        // 设置右侧消息视图
        configMessageView()
    }
}

// MARK:NSCollectionViewDelegate,NSCollectionViewDataSource
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
// MARK: NSTableViewDelegate, NSTableViewDataSource
extension MessageViewController: NSTableViewDelegate, NSTableViewDataSource{
    func numberOfRows(in tableView: NSTableView) -> Int {
        return chatArray.count
    }
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier.init("msgCell"), owner: self) as! MsgCellView
        cell.dataModel = chatArray[row]
        return cell
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
    // 设置消息
    fileprivate func  configMessageView(){
        msgTopView.layer?.backgroundColor = NSColor.lightGray.cgColor
        topNameLabel.stringValue = "hello"
        
        msgTableView.rowHeight = 100
    }
}

