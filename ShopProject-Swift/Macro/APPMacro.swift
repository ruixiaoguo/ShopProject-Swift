//
//  APPMacro.swift
//  ShopProject-Swift
//
//  Created by grx on 2018/9/4.
//  Copyright © 2018年 grx. All rights reserved.
//

import Foundation
import UIKit

let SCREEN_WIDTH = UIScreen.main.bounds.width
let SCREEN_HEIGH = UIScreen.main.bounds.height
/*代替之前的49*/
let kTabBarHeight: CGFloat = (UIApplication.shared.statusBarFrame.size.height > 20.0 ? 83.0:49.0)

// MARK: ---- 生成颜色
/// 根据RGBA生成颜色(格式为：22,22,22,0.5)
var gof_RGBAColor: (CGFloat, CGFloat, CGFloat, CGFloat) -> UIColor = {red, green, blue, alpha in
    return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: alpha);
}
/// 根据RGB生成颜色(格式为：22,22,22)
var gof_RGBColor: (CGFloat, CGFloat, CGFloat) -> UIColor = {red, green, blue in
    return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1);
}
/// 根据色值生成颜色(无透明度)(格式为0xffffff)
var gof_ColorWithHex: (NSInteger) -> UIColor = {hex in
    return UIColor(red: ((CGFloat)((hex & 0xFF0000) >> 16)) / 255.0, green: ((CGFloat)((hex & 0xFF00) >> 8)) / 255.0, blue: ((CGFloat)(hex & 0xFF)) / 255.0, alpha: 1);
}

// MARK: ---- 三大色调
let kEssentialColor = gof_ColorWithHex(0x46a0f0);  // 主色调，蓝色
let kAssistOrangeColor = gof_ColorWithHex(0xff8c28);  // 辅色调，橙色
let kAssistGreenColor = gof_ColorWithHex(0x5abe00);  // 辅色调，绿色


// MARK: ---- 打印日志
/**
 打印日志
 - parameter message: 日志消息内容
 */
func printLog<T>(message: T)
{
    #if DEBUG
    print(" \(message)");
    #endif
}

