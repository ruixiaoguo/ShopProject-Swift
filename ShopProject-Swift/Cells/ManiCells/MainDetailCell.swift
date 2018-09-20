//
//  MainDetailCell.swift
//  ShopProject-Swift
//
//  Created by grx on 2018/9/12.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit
import Kingfisher

class MainDetailCell: UITableViewCell {
    //标题
    private lazy var titleLable:UILabel = UILabel()
    //图片
    private lazy var bgImageView:UIImageView = UIImageView()
    //内容
    private lazy var contenLable:UILabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        /** 创建UI */
        self.InitUI()
    }
    
    func InitUI(){
        //标题
        titleLable.textColor = UIColor.black
        titleLable.font = UIFont.systemFont(ofSize: 16)
        titleLable.numberOfLines = 0
        contentView.addSubview(titleLable)
        titleLable.snp.makeConstraints{(make) in
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.top.equalToSuperview().offset(10)
        }
        //图片
        bgImageView.contentMode = .scaleAspectFill
        bgImageView.clipsToBounds = true
        contentView.addSubview(bgImageView)
        bgImageView.snp.makeConstraints{(make) in
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.top.equalTo(titleLable.snp.bottom).offset(10)
            make.height.equalTo(200)
        }
        //内容
        contenLable.textColor = UIColor.lightGray
        contenLable.font = UIFont.systemFont(ofSize: 14)
        contenLable.numberOfLines = 0
        contentView.addSubview(contenLable)
        contenLable.snp.makeConstraints{(make) in
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.top.equalTo(bgImageView.snp.bottom).offset(10)
            make.bottom.equalTo(contentView).offset(-20)
        }
    }
    
    internal func getModel(model:DetailModel){
        titleLable.text = model.title
        let imageUrl:NSURL = NSURL(string: model.cover_image_url!)!
        bgImageView.kf.setImage(with: ImageResource(downloadURL:imageUrl as URL), placeholder: UIImage(named: "image11"), options: nil, progressBlock: nil, completionHandler: nil)
        contenLable.text = model.share_msg
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
