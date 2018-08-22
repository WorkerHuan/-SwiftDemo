//
//  ZHPublicViewController.swift
//  TestBaiSi
//
//  Created by Tony on 2018/8/9.
//  Copyright © 2018年 TonyTony. All rights reserved.
//

import UIKit

class ZHPublicViewController: UIViewController {

    @IBOutlet weak var cancelBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        cancelBtn.layer.borderColor = UIColor.lightGray.cgColor
        cancelBtn.layer.borderWidth = 0.6
        cancelBtn.layer.cornerRadius = 2
        cancelBtn.layer.masksToBounds = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        for view in self.view.subviews {
            view.transform = CGAffineTransform(translationX: 0, y: -600)
        }
        cancelBtn.transform = CGAffineTransform(translationX: 0, y: 0)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        for view in self.view.subviews {
            var delay:Double = 0.0
            switch view.tag {
            case 1001:
                delay = 0.25
            case 1002:
                delay = 0.15
            case 1003:
                delay = 0.2
            case 1004:
                delay = 0.1
            case 1005:
                delay = 0.0
            case 1006:
                delay = 0.05
            case 1007:
                delay = 0.0
            default:
                delay = 0.3
            }
            
            UIView.animate(withDuration: 0.6,
                           delay: delay,
                           usingSpringWithDamping: 0.82,
                           initialSpringVelocity: 0,
                           options: .curveEaseOut,
                           animations: { () -> Void in
                            view.transform = CGAffineTransform.identity
            }) { (bool:Bool) -> Void in
                
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

    @IBAction func cancelAction(_ sender: Any) {
        
        for view in self.view.subviews {
            var delay:Double = 0.0
            switch view.tag {
            case 1001:
                delay = 0.25
            case 1002:
                delay = 0.15
            case 1003:
                delay = 0.2
            case 1004:
                delay = 0.1
            case 1005:
                delay = 0.02
            case 1006:
                delay = 0.05
            case 1007:
                delay = 0.0
            default:
                delay = 0.3
            }
            UIView.animate(withDuration: 0.5,
                           delay: delay,
                           usingSpringWithDamping: 1,
                           initialSpringVelocity: 0,
                           options: .curveEaseOut,
                           animations: { () -> Void in
                            view.transform = CGAffineTransform(translationX: 0, y: 500)
                            
            }) { (bool:Bool) in
                self.dismiss(animated: false, completion: nil)
            }
        }
        
    }
    
    
    
}
