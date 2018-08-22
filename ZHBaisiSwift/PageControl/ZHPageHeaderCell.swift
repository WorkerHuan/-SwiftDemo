//
//  ZHPageHeaderCell.swift
//  TestBaiSi
//
//  Created by Tony on 2018/8/7.
//  Copyright © 2018年 TonyTony. All rights reserved.
//

import UIKit

class ZHPageHeaderCell: UICollectionViewCell {
    
    open var label:UILabel?
    open var linView:UIView?
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        
        label = UILabel(frame: self.bounds);
        label?.textAlignment = .center;
        label?.textColor = UIColor.red;
        self.contentView.addSubview(label!);
        
        label?.snp.makeConstraints({ (make) in
            make.top.left.right.equalToSuperview();
            make.bottom.equalToSuperview().offset(-1.5);
        })
        
        linView = UIView();
        linView?.backgroundColor = UIColor.red;
        self.contentView.addSubview(linView!);
        
        linView?.snp.makeConstraints({ (make) in
            make.centerX.equalToSuperview();
            make.bottom.equalToSuperview();
            make.height.equalTo(1.5);
            make.width.equalTo(40);
        })
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
