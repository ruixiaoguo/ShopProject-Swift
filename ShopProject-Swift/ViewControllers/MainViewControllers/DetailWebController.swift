//
//  DetailWebController.swift
//  ShopProject-Swift
//
//  Created by grx on 2018/9/12.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class DetailWebController: BaseHtmlController {

    var titleStr: String?
    var urlString:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        URLProtocol.wk_registerScheme("http")
        URLProtocol.wk_registerScheme("https")
        JWCacheURLProtocol.startListeningNetWorking()
        self.leftView.isHidden = false
        self.startLoadWithTitle(title: self.titleStr!, url: self.urlString!)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        JWCacheURLProtocol.cancelListeningNetWorking()
    }
    
    override func backToPrevious() {
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
