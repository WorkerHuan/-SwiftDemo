//
//  DisPlayModel.swift
//  ZHBaisiSwift
//
//  Created by mac on 2018/8/19.
//  Copyright © 2018年 mac. All rights reserved.
//

import UIKit

class DisPlayModel: NSObject {

    var text: String?
    var u: NSDictionary?
    var passtime: String?
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
    override func setNilValueForKey(_ key: String) {
        
    }
    
    init(dic:[String:AnyObject])
        
    {
        
        super.init()
        
        //模型一键赋值这个其实是运用了kvc的原理
        
        self.setValuesForKeys(dic)
        
        
    }

}
