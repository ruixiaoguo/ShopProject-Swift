//
//  MainDetilController.swift
//  ShopProject-Swift
//
//  Created by grx on 2018/9/11.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit
import SwiftFCXRefresh
import SwiftyJSON
import HandyJSON
import SwiftProgressHUD

class MainDetilController: BaseController,UITableViewDelegate,UITableViewDataSource {
    
    var callClickBack:((_ name:String)->Void)?
    //上下拉刷新加载
    var headerRefreshView: FCXRefreshHeaderView?
    /** 标题 */
    lazy var titleStr:NSString = NSString()
    lazy var detailTableView:UITableView = UITableView(frame: self.view.bounds)
    /** 数据源 */
    var allArray:Array = [Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.leftView.isHidden = false
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = self.titleStr as String
        self.creatView()
        self.fetchHttpRequestData()
    }
    //MARK:==========创建视图
    func creatView(){
        self.detailTableView.separatorStyle = UITableViewCellSeparatorStyle.none
        self.detailTableView.delegate = self
        self.detailTableView.dataSource = self
        //字典计算高度
        self.detailTableView.estimatedRowHeight = 44;
        self.detailTableView.rowHeight = UITableViewAutomaticDimension;
        //注册cell重用
        self.detailTableView .register(MainDetailCell.self, forCellReuseIdentifier: "DetailCellID")
        self.view.addSubview(self.detailTableView)
        /** 添加上拉刷新/下拉加载 */
        self.addRefreshView()
    }
    
    //MARK:========添加上下拉刷新
    func addRefreshView() {
        headerRefreshView = detailTableView.addFCXRefreshHeader { [weak self] (refreshHeader) in
            self?.refreshAction()
        }
    }
    //MARK:========下拉刷新
    func refreshAction(){
        self.fetchHttpRequestData()
    }
    
    //MARK:==========tableViewDelegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.allArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"DetailCellID") as! MainDetailCell
        cell.selectionStyle = .none
        cell.getModel(model: self.allArray[indexPath.row] as! DetailModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailWebVC = DetailWebController()
        let model:DetailModel = self.allArray[indexPath.row] as! DetailModel
        detailWebVC.titleStr = model.title
        detailWebVC.urlString = model.url
        self.navigationController?.pushViewController(detailWebVC, animated: true)
    }
    
    //MARK:==========网络请求
    func fetchHttpRequestData(){
        SwiftProgressHUD.showWait()
        NetworkRequest.sharedInstance.getRequest(urlString: "http://api.liwushuo.com/v2/channels/104/items?ad=2&gender=2&generation=2&limit=20&offset=0", params: [:], success: {(json) -> Void in
            self.allArray.removeAll()
            let jsonDic = JSON(json)
            let jsonArray = jsonDic["data"]["items"]
            for i in 0..<jsonArray.count {
                let dic = jsonArray[i]
                let detailModel = DetailModel.deserialize(from: dic.rawString())
                self.allArray.append(detailModel as Any)
            }
            self.headerRefreshView?.endRefresh()
            self.detailTableView.reloadData()
            SwiftProgressHUD.hideAllHUD()
        }, failture: {(error) -> Void in
            SwiftProgressHUD.hideAllHUD()
        })
    }

    
    override func backToPrevious() {
        self.navigationController!.popViewController(animated: true)
        callClickBack!("反向传值")
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
