//
//  MyCell.swift
//  ShopProject-Swift
//
//  Created by grx on 2018/9/13.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class MyCell: UITableViewCell {
    //图片
    private lazy var imagePhone : UIImageView = UIImageView()
    //标题
    private lazy var labelTitle:UILabel = UILabel()
    private lazy var lineView:UIView = UIView()
    private lazy var imageTip : UIImageView = UIImageView()

    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        /** 创建UI */
        self.InitUI()
    }
    
    fileprivate func InitUI(){
        //图片
        imagePhone.contentMode = .scaleAspectFill
        imagePhone.clipsToBounds = true
        contentView.addSubview(imagePhone)
        imagePhone.snp.makeConstraints { (make) in
            make.top.equalTo(17.5)
            make.left.equalTo(30)
            make.width.equalTo(25)
            make.height.equalTo(25)
        }
        //标题
        labelTitle.numberOfLines = 0
        labelTitle.textColor = UIColor.black
        contentView.addSubview(labelTitle)
        labelTitle.snp.makeConstraints({ (make) in
            make.top.equalTo(0)
            make.left.equalTo(imagePhone.snp.right).offset(20)
            make.right.equalTo(-80)
            make.height.equalTo(60)
        })
        
        imageTip.contentMode = .scaleAspectFill
        imageTip.clipsToBounds = true
        imageTip.image = UIImage(named: "tipIcon")
        contentView.addSubview(imageTip)
        imageTip.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalTo(-30)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        //分割线
        lineView.backgroundColor = UIColor.lightGray
        contentView.addSubview(lineView)
        lineView.snp.makeConstraints({ (make) in
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(0.5)
            make.bottom.equalTo(contentView).offset(-1)
        })
    }
    
    //控制器传过来的值赋值
    internal func getTitle(contain:String){
        //标题
        labelTitle.text = contain
    }
    
    //控制器传过来的值赋值
    internal func getIcon(contain:String){
        //标题
        imagePhone.image = UIImage(named: contain)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
