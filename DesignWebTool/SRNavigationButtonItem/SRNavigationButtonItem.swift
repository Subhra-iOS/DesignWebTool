//
//  SRNavigationButtonItem.swift
//  PrintApp
//
//  Created by Subhr Roy on 17/09/18.
//  Copyright © 2018 ARC Document Solutions. All rights reserved.
//

import Foundation
import UIKit

public enum BarItemType : Int64 {
    case rightBarItem
    case leftBarItem
    case flexibleBarItem
    case disable
    
}

protocol SRBarButtonItemProtocol : NSObjectProtocol {
    func didTapOnBarButtonActionWith(sender:Any,type : BarItemType) -> Void
}

class SRNavigationButtonItem : UIBarButtonItem{
    
    private  var barItemType : BarItemType = .leftBarItem
    private  var itemTitle : String?
    private  weak var buttonActionDelegate : SRBarButtonItemProtocol?
    
    public private(set) var rightBarButton : UIButton?
    public private(set) var leftBarButton : UIButton?
        
    
    
    convenience init(backBarItemTitle : String, actionDelegate : UIViewController){
        
        self.init()
        self.barItemType = .leftBarItem
        self.buttonActionDelegate = actionDelegate as? SRBarButtonItemProtocol
        setupNavigationBackButton(strTitle: backBarItemTitle, navigationItems: actionDelegate.navigationItem)
    }
    
    convenience init(rightItemButton : UIButton, actionDelegate : UIViewController?){
        
        self.init()
        if let _ = actionDelegate {
            
            self.buttonActionDelegate = actionDelegate as? SRBarButtonItemProtocol
            rightItemButton.addTarget(self, action: #selector(SRNavigationButtonItem.didTapOnLeftBarButton(sender:)), for: .touchUpInside)
            
        }
        
        self.rightBarButton = rightItemButton
        rightItemButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -13)
        self.customView = rightItemButton
        let leading   =  NSLayoutConstraint(item: rightItemButton, attribute: .top, relatedBy: .equal, toItem: self.customView, attribute: .top, multiplier: CGFloat(1.0), constant: CGFloat(0.0))
        let taril  =  NSLayoutConstraint(item: rightItemButton, attribute: .trailing, relatedBy: .equal, toItem: self.customView, attribute: .trailing, multiplier: CGFloat(1.0), constant: CGFloat(0.0))
        let height = NSLayoutConstraint(item: rightItemButton, attribute: .height, relatedBy: .equal, toItem: self.customView, attribute: .height, multiplier: 1.0, constant: 0.0)
        self.customView?.addConstraints([leading, taril, height])
        
    }
    
    
   private func setupNavigationBackButton(strTitle:String, navigationItems:UINavigationItem) {
        
        let button = UIButton(type: .custom);
        self.leftBarButton = button
        //button.setImage(UIImage(named: "back"), for: .normal)
        
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitle(strTitle, for: .normal)
        button.contentHorizontalAlignment = .left
        button.addTarget(self, action: #selector(didTapOnbackBarButton(sender:)), for: .touchUpInside)
        button.frame = CGRect(x: 15, y: 0, width: 70, height: 40)
        button.contentEdgeInsets = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let btnNext : UIBarButtonItem = UIBarButtonItem(customView: button)
        let btnSpace : UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        btnSpace.width = -5
        navigationItems.leftBarButtonItems = [btnSpace,btnNext];
    
        self.leftBarButton = button
    
    }

    @objc private func didTapOnbackBarButton(sender:Any){
        
        self.buttonActionDelegate?.didTapOnBarButtonActionWith(sender: sender, type: self.barItemType)
        

    }
    
    override init() {
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
        
    private func addButton(_ type : BarItemType) -> UIButton{
        
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 30)
        
        if type == .leftBarItem {
            
            self.leftBarButton = button
            
        }else {
            
            self.rightBarButton = button
           
            
        }
        
        return  button
    }
    
    @objc private func didTapOnLeftBarButton(sender:Any) -> Void{
        
        self.buttonActionDelegate?.didTapOnBarButtonActionWith(sender: sender, type: self.barItemType)
        
    }
    
}

