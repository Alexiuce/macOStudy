//
//  ShellTask.swift
//  SimuLooker
//
//  Created by caijinzhu on 2018/2/27.
//  Copyright © 2018年 alexiuce.github.io. All rights reserved.
//

import Cocoa





struct ShellTask{
    
    /* 执行cmd 指令 */
    static func execCmd(cmd: String, arguments: [String], callback: @escaping (String)->()){
        let task = Process()
        task.launchPath = cmd
        task.arguments = arguments
        
        let result = Pipe()
        task.standardOutput = result
        
        result.fileHandleForReading.waitForDataInBackgroundAndNotify()
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name.NSFileHandleDataAvailable, object: result.fileHandleForReading, queue: nil) { (noti) in
            let resultData = result.fileHandleForReading.availableData
            guard let resultString = String(data: resultData, encoding: String.Encoding.utf8) else{return}
            callback(resultString)
        }
        
        task.terminationHandler = { task in
          print("exec cmd finished")
        }
        task.launch()
        task.waitUntilExit()
    }
    
}
