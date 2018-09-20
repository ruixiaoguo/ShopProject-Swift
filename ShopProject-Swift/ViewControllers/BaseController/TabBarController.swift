//
//  TabBarController.swift
//  ShopProject-Swift
//
//  Created by grx on 2018/9/4.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    /** 定义变量 */
    var _backView:UIView? = nil
    var items:NSArray = []
    let NameArray = ["新闻","视频","社区","我的"];
    let PicArr = ["main_blue","grid_blue","cart_blue","me_blue"]
    let PicSelectArr = ["main","grid","cart","me"]
    let VCArray = [MainViewController(),ClassViewController(),CartViewController(),MyViewController()]
    //初始化数组
    var NavVCArr:[NSObject] = [NSObject]()
    var nav:BaseNavigationController = BaseNavigationController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.CreatTabBar()
    }
    
    func CreatTabBar(){
        //添加中央按钮
        setValue(CenterTabBar(), forKey: "tabBar")
        
        for i in 0..<VCArray.count {
            nav = BaseNavigationController(rootViewController:(VCArray[i] as AnyObject as! UIViewController))
            nav.tabBarItem.title = NameArray[i]
            nav.tabBarItem.image = UIImage(named:PicArr[i])
            nav.tabBarItem.selectedImage = UIImage(named:PicSelectArr[i])
            VCArray[i].title = NameArray[i]
            NavVCArr.append(nav)
        }
        self.viewControllers = NavVCArr as? [UIViewController]
        for  i in 0 ..< NavVCArr.count {
            //设置导航栏的背景图片 （优先级高）
            (NavVCArr[i] as AnyObject).navigationBar.setBackgroundImage(UIImage(named:"NavigationBar"), for:.default)
            //设置导航栏的背景颜色 （优先级低）
            (NavVCArr[i] as AnyObject).navigationBar.barTintColor = UIColor.white
            //设置导航栏的字体颜色
            (NavVCArr[i] as AnyObject).navigationBar.titleTextAttributes =
                [kCTForegroundColorAttributeName: UIColor.red] as [NSAttributedStringKey : Any]
        }
        //tabBar 底部工具栏背景颜色 (以下两个都行)
        self.tabBar.barTintColor = UIColor.white
        self.tabBar.backgroundColor = UIColor.white
        //设置 tabBar 工具栏字体颜色 (未选中  和  选中)
        self.tabBar.tintColor = gof_ColorWithHex(0xcfb292)
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
