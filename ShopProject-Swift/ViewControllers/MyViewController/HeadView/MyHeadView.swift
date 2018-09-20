//
//  MyHeadView.swift
//  ShopProject-Swift
//
//  Created by grx on 2018/9/13.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class MyHeadView: UIView {
    
    var headBgImage:UIImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initUI()
    }
    
    fileprivate func initUI(){
        self.addSubview(headBgImage)
        headBgImage.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.top.equalTo(0)
            make.height.equalTo(200)
        }
        headBgImage.image = UIImage(named: "MyHeadImage")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
