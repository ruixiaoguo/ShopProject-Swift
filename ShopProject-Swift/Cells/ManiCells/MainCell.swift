//
//  MainCell.swift
//  ShopProject-Swift
//
//  Created by grx on 2018/9/11.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit
import SnapKit

class MainCell: UITableViewCell {
    //标题
    private lazy var labelTitle:UILabel = UILabel()
    //图片
    private lazy var imagePhone : UIImageView = UIImageView()
    //内容
    private lazy var labelContronter : UILabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        /** 创建UI */
        self.InitUI()
    }
    
    
    fileprivate func InitUI(){
        
        //标题 【重点】必须在创建第一块控件的时候约束：contentView
        labelTitle.numberOfLines = 0
        labelTitle.backgroundColor = UIColor.white
        contentView.addSubview(labelTitle)
        labelTitle.snp.makeConstraints({ (make) in
            make.top.equalTo(contentView).offset(10)
            make.left.equalTo(10)
            make.right.equalTo(-10)
        })
        //图片
        imagePhone.image = UIImage(named: "image11")
        imagePhone.contentMode = .scaleAspectFill
        imagePhone.clipsToBounds = true
        
        contentView.addSubview(imagePhone)
        imagePhone.snp.makeConstraints { (make) in
            make.top.equalTo(labelTitle.snp.bottom).offset(20)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.height.equalTo(200)
        }
        
        //内容 【重点】必须在创建最后一块控件的时候约束：contentView
        contentView.addSubview(labelContronter)
        labelContronter.isUserInteractionEnabled = true
        
        //添加点击手势
        let tapGesture = UITapGestureRecognizer(target: self, action:#selector(Actionbuton))
        labelContronter.addGestureRecognizer(tapGesture)
        labelContronter.numberOfLines = 0
        labelContronter.textColor = UIColor.red
        labelContronter.snp.makeConstraints { (make) in
            make.top.equalTo(imagePhone.snp.bottom).offset(15)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.bottom.equalTo(contentView).offset(-20)
        }
    }
    
    @objc func Actionbuton(){
         print("点击了label")
    }
    
    //控制器传过来的值赋值
    internal func getTitle(contain:String){
        //标题
        labelTitle.text = contain
        //内容
        labelContronter.text = contain
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
