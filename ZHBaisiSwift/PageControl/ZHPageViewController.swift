//
//  ZHPageViewController.swift
//  TestBaiSi
//
//  Created by Tony on 2018/8/7.
//  Copyright © 2018年 TonyTony. All rights reserved.
//

import UIKit

class ZHPageViewController: UIViewController,ZHPageHeaderViewDelegate,ZHPageBodyViewDelegate {
    
    
    
    

    open var headerTitleArr:NSArray? = []
    open var bodyControlArr:NSArray? = []
    
    open var itemWidth:CGFloat?;
    
    var pageHeaderView:ZHPageHeaderView?
    var pageBodyView:ZHPageBodyView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pageHeaderView = ZHPageHeaderView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 50));
        pageHeaderView?.itemWidth = itemWidth;
        pageHeaderView?.delegate = self;
        pageHeaderView?.headerTitleArr = (headerTitleArr as! [String]);
        self.view.addSubview(pageHeaderView!);
        
        pageBodyView  = ZHPageBodyView(frame: CGRect(x: 0, y: 50, width: self.view.bounds.width, height: self.view.bounds.height - 50))
        pageBodyView?.delegate = self;
        pageBodyView?.bodyControlArr = (bodyControlArr as! [UIViewController]);
        self.view.addSubview(pageBodyView!);
        for vc in bodyControlArr! {
            self.addChildViewController(vc as! UIViewController);
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func pageHeaderViewdidSelectItemAtIndexPath(index: Int) {
        pageBodyView?.headerItemToDesWithDesIndex(index: index);
    }
    
    func pageBodyViewdidSelectItemAtIndexPath(index: Int) {
        pageHeaderView?.scrollCollectionItemToDesWithDesIndex(index: index);
    }
    

}
