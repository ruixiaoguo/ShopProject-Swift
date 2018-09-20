//
//  DetailModel.swift
//  ShopProject-Swift
//
//  Created by grx on 2018/9/12.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit
import HandyJSON
class DetailModel: HandyJSON {
    var id:Int?;
    var title:String?;//标题
    var introduction:String?;//描述内容
    var url:String?;//链接
    var cover_image_url:String?;//图片链接
    var share_msg:String?;//分享描述
    required init(){}
}
