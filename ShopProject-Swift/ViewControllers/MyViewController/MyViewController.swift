//
//  MyViewController.swift
//  ShopProject-Swift
//
//  Created by grx on 2018/9/11.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class MyViewController: BaseController,UITableViewDelegate,UITableViewDataSource {
    
    lazy var myTableView:UITableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height), style: UITableViewStyle.plain);
    var allTitleArray:Array = [String]()
    var allIconArray:Array = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.green
        allTitleArray += ["个人资料","使用帮助","关于我们","设置"]
        allIconArray += ["icon1","icon2","icon3","icon4"]

        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.separatorStyle = UITableViewCellSeparatorStyle.none
        myTableView.register(MyCell.self, forCellReuseIdentifier:"MyCellID")
        //字典计算高度
        myTableView.estimatedRowHeight = 44;
        myTableView.rowHeight = UITableViewAutomaticDimension;
        self.view.addSubview(myTableView)
        let headView:MyHeadView = MyHeadView(frame:CGRect(x: 0, y: 0, width:SCREEN_WIDTH, height: 200))
        myTableView.tableHeaderView = headView
    }
    
    //MARK:========tableViewDelegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allTitleArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:MyCell = tableView.dequeueReusableCell(withIdentifier: "MyCellID") as! MyCell
        cell.selectionStyle = .none
        cell.getTitle(contain: allTitleArray[indexPath.row])
        cell.getIcon(contain: allIconArray[indexPath.row])
        return cell
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
