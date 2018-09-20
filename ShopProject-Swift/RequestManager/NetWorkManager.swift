//
//  RequestManager.swift
//  ShopProject-Swift
//
//  Created by grx on 2018/9/11.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit
import Foundation
import Alamofire

class NetWorkManager: NSObject {
    
    //创建一个静态或者全局变量，保存当前单例实例值
    private static let requestManager = NetWorkManager()
    //提供一个公开的用来去获取单例的方法
    class func shareManager() ->NetWorkManager {
        //返回初始化好的静态变量值
        return requestManager
    }
    
    //MARK: ====GET请求
    func NetWorkGetManager(parameters:Dictionary<String,String>, url:String, success:@escaping (_ dic:Dictionary<String, Any>)->(),failure:@escaping (Error)->())->Void{
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            if(response.error == nil){
                let dic:NSDictionary = response.result.value as! NSDictionary
                success(dic as! Dictionary<String, Any>)
            }else{
                failure(response.error!)
            }
        }
    }
    
    func NetWorkPostManager(parameters:Dictionary<String,String>, url:String, success:@escaping (_ dic:Dictionary<String, Any>)->(),failure:@escaping (Error)->())->Void {
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            if(response.error == nil){
                let dic:NSDictionary = response.result.value as! NSDictionary
                success(dic as! Dictionary<String, Any>)
            }else{
                failure(response.error!)
            }
        }
    }
    
}
