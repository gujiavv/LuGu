//
//  WTNavigationController.swift
//  demo0409
//
//  Created by 111 on 2018/4/13.
//  Copyright © 2018年 mars. All rights reserved.
//

import UIKit

class WTNavigationController: ENSideMenuNavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.statusBarStyle = .lightContent
        UIApplication.shared.isStatusBarHidden = false
        sideMenu = ENSideMenu.init(sourceView: self.view, menuViewController: WTTableViewController(), menuPosition: .left)
        sideMenu?.menuWidth =  100.0
        sideMenu?.bouncingEnabled = false
        view.bringSubview(toFront: navigationBar)
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
