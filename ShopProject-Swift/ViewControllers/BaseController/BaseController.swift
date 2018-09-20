//
//  BaseController.swift
//  ShopProject-Swift
//
//  Created by grx on 2018/9/11.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class BaseController: UIViewController {
    
    var leftView:UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //自定义返回按钮
        leftView = UIButton(type: .custom);
        leftView.frame = CGRect(x:0, y:0, width:100, height:40)
        leftView.addTarget(self, action: #selector(backToPrevious), for: .touchUpInside)
        let button =   UIButton(type: .custom)
        button.frame = CGRect(x:0, y:0, width:20, height:40)
        button.setImage(UIImage(named:"back"), for: .normal)
        button.addTarget(self, action: #selector(backToPrevious), for: .touchUpInside)
        leftView.addSubview(button)
        leftView.isHidden = true
        let leftBarBtn = UIBarButtonItem(customView: leftView)
        //用于消除左边空隙，要不然按钮顶不到最前面
        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil,
                                     action: nil)
        spacer.width = -15;
        self.navigationItem.leftBarButtonItems = [spacer,leftBarBtn]
    }
    
    //返回按钮点击响应
    @objc func backToPrevious(){
        self.navigationController!.popViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
