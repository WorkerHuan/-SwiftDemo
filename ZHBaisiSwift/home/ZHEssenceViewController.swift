//
//  ZHEssenceViewController.swift
//  TestBaiSi
//
//  Created by Tony on 2018/7/26.
//  Copyright © 2018年 TonyTony. All rights reserved.
//

import UIKit

class ZHEssenceViewController: UIViewController {

    var titleName: String? = nil;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let controls = NSMutableArray();
        let headerTitleArr = ["全部","视频","图片","段子"];
        for i in 0...3{
            let subVc:ZHContentSubViewController = ZHContentSubViewController();
            subVc.contentViewType = subContentViewType(rawValue: i);
            controls.add(subVc);
        }
        
        let pageVc = ZHPageViewController();
        pageVc.headerTitleArr = headerTitleArr as NSArray;
        pageVc.bodyControlArr = controls;
        pageVc.itemWidth = 120;
        pageVc.view.frame = CGRect(x: 0, y: 64, width: self.view.bounds.width, height: self.view.bounds.height-64);
        self.view.addSubview(pageVc.view);
        self.addChildViewController(pageVc);
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
