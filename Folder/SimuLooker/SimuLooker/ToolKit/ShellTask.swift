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
    static func execCmd(cmd: String, arguments: [String]) -> String{
        let task = Process()
        task.launchPath = cmd
        task.arguments = arguments
        let output = Pipe()
        task.standardOutput = output
        task.launch()
        task.waitUntilExit()
        let data = output.fileHandleForReading.readDataToEndOfFile()
        return   String(data: data, encoding: String.Encoding.utf8) ?? ""
    }
}
