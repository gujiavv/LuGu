//
//  WTCollectionViewController.swift
//  LuGu
//
//  Created by 111 on 2018/6/12.
//  Copyright © 2018年 mars. All rights reserved.
//

import UIKit

private let fallImageCellID = "FallImageCell"
private let loadMoreCellID = "loadMoreCell"

class WTCollectionViewController: UICollectionViewController ,UICollectionViewDelegateFlowLayout{
    var currentItemNumber:Int = 0
    var imageArray = [String]()
    private let refreshControl = UIRefreshControl()
    override func viewDidLoad() {
        super.viewDidLoad()

        configViewController()
        addLogoViewInBackground()
        self.collectionView!.register(UINib(nibName:fallImageCellID,bundle:nil), forCellWithReuseIdentifier: fallImageCellID)
        self.updateItemImages(currentItemNumber:currentItemNumber,isLoadMore: false)
        if self.title == "首页" { // stroyBorad的title
            self.title = "噜咕"
        }
        refreshControl.tintColor = WTMainTintColor()
        refreshControl.addTarget(self, action:#selector(WTCollectionViewController.pullRefreshAction(sender:)), for: .valueChanged)
        collectionView?.addSubview(refreshControl)

    }
    
    @IBAction func showMenuTableViewController(sender: UIBarButtonItem) {
        toggleSideMenuView()
    }
    private var currentPageIndex:Int = 1
    private var isFetching = false
    private func updateItemImages(currentItemNumber:Int,isLoadMore: Bool = false) -> Void {
        
        if isFetching {
            return
        }
        
        isFetching = true
        
        if isLoadMore {
            currentPageIndex = currentPageIndex + 1
        }else{
            currentPageIndex = 1
        }
        requestItemImages(type: cidByItemNumber(number: currentItemNumber), page: currentPageIndex) { (images) in
            let strongSelf = self
            if strongSelf.refreshControl.isRefreshing {
                strongSelf.refreshControl.endRefreshing()
            }
            strongSelf.imageArray = images!
            strongSelf.collectionView?.reloadData()
            strongSelf.isFetching = false
            
        }
    }
    
    @objc func pullRefreshAction(sender: UIRefreshControl) {
        updateItemImages(currentItemNumber: currentItemNumber)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return self.imageArray.count
        case 1:
            return self.imageArray.isEmpty ? 0:1
        default:
            return 0
        }
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: fallImageCellID, for: indexPath) as! FallImageCell
        cell .configureWithImageUrl(imageUrl:self.imageArray[indexPath.row], collectionView: collectionView, indexPath: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 1 {
            return CGSize(width: WTScreenWidth(), height: 80)
        }
        
        let frame: CGRect = CGRect(x:0, y:0, width:WTScreenWidth()/2, height:WTScreenWidth()/2*4/3).insetBy(dx: 3, dy: 3)
        return CGSize(width:frame.size.width, height:frame.size.height)
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if section == 0 {
            return 4
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if section == 0 {
            return 4
        }
        return 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 0 {
            return UIEdgeInsetsMake(4, 4, 4, 4)
        }
        return UIEdgeInsetsMake(0, 0, 0, 0)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "presentAlbumVC", sender: indexPath)
    }
    
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
