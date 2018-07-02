//
//  WTConfig.swift
//  LuGu
//
//  Created by 111 on 2018/6/12.
//  Copyright © 2018年 mars. All rights reserved.
//

import UIKit

func WTScreenBounds() -> CGRect {
    return UIScreen.main.bounds
}
func WTScreenWidth() -> CGFloat {
    return WTScreenBounds().width
}

func WTScreenHeight() -> CGFloat {
    return WTScreenBounds().height
}

func WTRGBColor(r:CGFloat,g:CGFloat,b:CGFloat,alpha:CGFloat) -> UIColor {
    return UIColor(red: r / 255.0,green: g / 255.0,blue: b / 255.0,alpha:alpha)
}

func WTMainTitleColor() -> UIColor {
    return UIColor(red: 0.247, green: 0.247, blue: 0.247, alpha: 1.0)
}

func WTMainTintColor() -> UIColor {
    return UIColor(red: 81/255.0, green: 203/255.0, blue: 164/255.0, alpha: 1.0)
}

extension UIView {
    func viewController() -> UIViewController? {
        var next:UIResponder? = self.next
        repeat {
            if next!.isKind(of: UIViewController.self){
                return (next as? UIViewController)!
            }
            next = next?.next
        }while (next != nil)
        return nil
    }
}
//guard let 与 if let 刚好相反，guard  let守护一定有值。如果没有，直接返回。
//如果if let凭空多一层分支 guard let是降低分支层次的办法
extension UIViewController {
    func configViewController() -> Void {
        guard let navigationController = navigationController else {
            return
        }
        navigationController.navigationBar.backgroundColor = nil
        let textAttributes = [
            NSAttributedStringKey.foregroundColor:WTMainTitleColor(),
            NSAttributedStringKey.font:UIFont.boldSystemFont(ofSize: 17)
        ]
        navigationController.navigationBar.titleTextAttributes = textAttributes
        navigationController.navigationBar.tintColor = WTMainTintColor()
        
    }
    
    func addLogoViewInBackground() -> Void {
        let backgroundView = Bundle.main.loadNibNamed("BackgroundView", owner: self, options: nil)?.last as! UIView
        backgroundView.frame = self.view.bounds
        self.view.backgroundColor = UIColor.white
        self.view.insertSubview(backgroundView, at: self.view.subviews.count - 1)
    }
    
}










