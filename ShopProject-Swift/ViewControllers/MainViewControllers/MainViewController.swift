//
//  MainViewController.swift
//  ShopProject-Swift
//
//  Created by grx on 2018/9/11.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit
import SwiftFCXRefresh
import SwiftyJSON
import HandyJSON
//import DetailModel
import MonkeyKing

class MainViewController: BaseController,UITableViewDelegate,UITableViewDataSource {
    //轮播图变量
    var cycleScrollView:WRCycleScrollView?
    //tableView
    private lazy var tableViewMain :UITableView = UITableView(frame: CGRect(x: 0, y: -20, width: self.view.frame.width, height: self.view.frame.height), style: UITableViewStyle.plain)
    //懒加载数据源-可变数组用Var，类型自动推导,数组字典都用[]
    private lazy var dataSouce :[String] = [String]()
    //上下拉刷新加载
    var headerRefreshView: FCXRefreshHeaderView?
    var footerRefreshView: FCXRefreshFooterView?
    
    // MARK:=========视图将要显示时调用该方法
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true;
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent;
    }
    
    // MARK:=========当视图将要消失时调用该方法
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false;
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.default;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = ""
        self.initView()
        //数据
        self.dataSouce += ["我就两个字","中新网4月17日电  据韩联社报道，韩国海洋水产部(简称“海水部”)“世越号”现场处理本部和负责世越号船体清理工作的韩国打捞局(Korea Salvage)为方便搜寻失踪者遗体的工作人员开展工作已于17日完成护栏安装，预计失踪者遗体搜寻工作有望于18日正式启动","这是第三个","3月28日，在将“世越”号船体运往木浦新港前，工作人员也同样在半潜船甲板上发现过动物尸骨。本月2日，工作人员曾在半潜船甲板上发现9块动物尸骨、“世越”号船长李某的护照及手提包、信用卡、圆珠笔等物品，但截至目前仍未发现9名失踪者的遗体。","","2014年4月16日，“世越”号在全罗南道珍岛郡附近水域沉没，共致295人遇难，迄今仍有9人下落不明，遇难者大多是学生。"]
    }
    
    // MARK:=========创建视图
    func initView(){
        /** 轮播图 */
        let height:CGFloat = 200
        let frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: height)
        let localImages = ["localImg6","localImg7","localImg8","localImg9","localImg10"]
        let descs = ["韩国防部回应停止部署萨德:遵照最高统帅指导方针",
                     "勒索病毒攻击再次爆发 国内校园网大面积感染",
                     "Win10秋季更新重磅功能：跟安卓与iOS无缝连接",
                     "《琅琊榜2》为何没有胡歌？胡歌：我看过剧本，离开是种保护",
                     "阿米尔汗在印度的影响力，我国的哪位影视明星能与之齐名呢？"]
        cycleScrollView = WRCycleScrollView(frame:frame, type:.LOCAL, imgs:localImages, descs:descs)
        cycleScrollView!.delegate = self
        cycleScrollView?.descLabelFont = UIFont.boldSystemFont(ofSize: 15)
        cycleScrollView?.descLabelHeight = 50
        cycleScrollView?.pageControlAliment = .CenterBottom
        self.view.addSubview(cycleScrollView!)
        
        self.view.addSubview(tableViewMain)
        //去分割线
        //        tableViewMain.separatorStyle = UITableViewCellSeparatorStyle.none
        tableViewMain.delegate = self
        tableViewMain.dataSource = self
        //注册cell重用
        tableViewMain.register(MainCell.self , forCellReuseIdentifier: "ID")
        //设置Header
        tableViewMain.tableHeaderView = cycleScrollView
        //开启自动计算高度
        //【重点】注意千万不要实现行高的代理方法，否则无效：heightForRowAt
        tableViewMain.estimatedRowHeight = 44//预估高度，随便设置
        tableViewMain.rowHeight = UITableViewAutomaticDimension
        /** 添加上拉刷新/下拉加载 */
        self.addRefreshView()
    }
    //MARK:========tableViewDelegate协议代理
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSouce.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"ID") as! MainCell
        cell.selectionStyle = .none
        cell.getTitle(contain: self.dataSouce[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("点击=====\(indexPath.row)")
        let mainDetailVC = MainDetilController()
        mainDetailVC.titleStr = self.dataSouce[indexPath.row] as NSString
        mainDetailVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(mainDetailVC, animated: true)
        mainDetailVC.callClickBack = {(name:String) in
            print("\(name)")
        }
        }
    

    
    //MARK:========滑动处理状态栏颜色
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pointY = scrollView.contentOffset.y
        if pointY < -20 || pointY > 175{
            UIApplication.shared.statusBarStyle = UIStatusBarStyle.default;
        }else {
            UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent;
        }
    }
    
    //MARK:========添加上下拉刷新
    func addRefreshView() {
        headerRefreshView = tableViewMain.addFCXRefreshHeader { [weak self] (refreshHeader) in
            self?.refreshAction()
        }
        footerRefreshView = tableViewMain.addFCXRefreshFooter { [weak self] (refreshHeader) in
            self?.loadMoreAction()
        }
    }
    //MARK:========下拉刷新
    func refreshAction(){
        self.headerRefreshView?.endRefresh()
        self.tableViewMain.reloadData()
    }
    
    //MARK:========上拉加载更多
    func loadMoreAction() {
        self.dataSouce.append("教师节，马云终究还是选择“退休”去当老师了")
        self.footerRefreshView?.endRefresh()
        self.tableViewMain.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

// MARK: =====点击图片代理回调
extension MainViewController: WRCycleScrollViewDelegate
{
    /// 点击图片回调
    func cycleScrollViewDidSelect(at index:Int, cycleScrollView:WRCycleScrollView)
    {
        print("点击了第\(index+1)个图片")
    }
    /// 图片滚动回调
    func cycleScrollViewDidScroll(to index:Int, cycleScrollView:WRCycleScrollView)
    {
        //        print("滚动到了第\(index+1)个图片")
    }
}
