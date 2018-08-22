//
//  ZHTabBarController.swift
//  TestBaiSi
//
//  Created by Tony on 2018/7/26.
//  Copyright © 2018年 TonyTony. All rights reserved.
//

import UIKit

class ZHTabBarController: UITabBarController,UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.initControl();
        delegate = self;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func initControl(){
        
        let homeNav = ZHNavigationController(rootViewController: ZHEssenceViewController());
        let newNav = ZHNavigationController(rootViewController: ZHNewViewController());
        let addNav = ZHNavigationController(rootViewController: ZHAddViewController());
        let followNav = ZHNavigationController(rootViewController: ZHFollowViewController());
        let meNav = ZHNavigationController(rootViewController: ZHMeViewController());
        
        homeNav.tabBarItem.image = UIImage(named: "tabBar_essence_icon")?.withRenderingMode(.alwaysOriginal) ;
        homeNav.tabBarItem.selectedImage = UIImage(named: "tabBar_essence_click_iconN")?.withRenderingMode(.alwaysOriginal);
        homeNav.tabBarItem.title = "精华";
        
        newNav.tabBarItem.image = UIImage(named: "tabBar_new_iconN")?.withRenderingMode(.alwaysOriginal);
        newNav.tabBarItem.selectedImage = UIImage(named: "tabBar_new_click_iconN")?.withRenderingMode(.alwaysOriginal);
        newNav.tabBarItem.title = "最新";
        
        addNav.tabBarItem.image = UIImage(named: "tabBar_publish_icon")?.withRenderingMode(.alwaysOriginal);
        addNav.tabBarItem.selectedImage = UIImage(named: "tabBar_publish_icon")?.withRenderingMode(.alwaysOriginal);
        addNav.tabBarItem.imageInsets = UIEdgeInsetsMake(7, 0, -7, 0)
       
        
        followNav.tabBarItem.image = UIImage(named: "tabBar_friendTrends_icon")?.withRenderingMode(.alwaysOriginal);
        followNav.tabBarItem.selectedImage = UIImage(named: "tabBar_friendTrends_click_iconN")?.withRenderingMode(.alwaysOriginal);
        followNav.tabBarItem.title = "关注";
        
        meNav.tabBarItem.image = UIImage(named: "tabBar_me_icon")?.withRenderingMode(.alwaysOriginal);
        meNav.tabBarItem.selectedImage = UIImage(named: "tabBar_me_click_iconN")?.withRenderingMode(.alwaysOriginal);
        meNav.tabBarItem.title = "我的";
        
        self.viewControllers = [homeNav,newNav,addNav,followNav,meNav];
    }
    
    func setControlItemStyle() {
        
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController == tabBarController.viewControllers![2] {
            
            let publicVc = ZHPublicViewController(nibName: "ZHPublicViewController", bundle: nil);
            
            UIApplication.shared.keyWindow?.rootViewController?.present(publicVc, animated: false, completion: nil)
            
            return false
        }
        return true
    }

}
