//
//  ZHTestViewController.swift
//  TestBaiSi
//
//  Created by Tony on 2018/8/6.
//  Copyright © 2018年 TonyTony. All rights reserved.
//

import UIKit

class ZHTestViewController: UIViewController {

    typealias clickBtnClosure = (_ mytext:String?)->Void;
    
    var clickClosure1:clickBtnClosure?
    //为闭包设置调用函数
    open func clickValueClosure(closure:clickBtnClosure?){
        clickClosure1 = closure
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let button = UIButton(type: .custom);
        button.frame = CGRect(x:40, y: 100, width: 80, height: 40);
        button.setTitle("返回", for: .normal);
        button.setTitleColor(UIColor.black, for: .normal);
        button.addTarget(self, action: #selector(btnClick), for: .touchUpInside);
        
        self.view.addSubview(button);
        
    }
    
    @objc func btnClick(){
        if (clickClosure1 != nil) {
            clickClosure1!("22");
        }
        self.Test(name: "测试");
    }

    func Test(name:String?) -> Void {
        print("%@",name as Any);
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
