//
//  ZHPageBodyView.swift
//  TestBaiSi
//
//  Created by Tony on 2018/8/7.
//  Copyright © 2018年 TonyTony. All rights reserved.
//

import UIKit

protocol ZHPageBodyViewDelegate: class {
    func pageBodyViewdidSelectItemAtIndexPath(index:Int)
}

class ZHPageBodyView: UIView,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    weak var delegate : ZHPageBodyViewDelegate?
    
    open var bodyControlArr:[UIViewController]?=[];
    
    lazy var bodyCollectionView:UICollectionView = {
        
        let layout = UICollectionViewFlowLayout();
        layout.scrollDirection = .horizontal;
        layout.itemSize = CGSize(width: self.bounds.width, height: self.bounds.height);
        layout.minimumLineSpacing = 0;
        
        let bodyCollectionView = UICollectionView(frame: self.bounds, collectionViewLayout: layout);
        bodyCollectionView.backgroundColor = UIColor.orange;
        bodyCollectionView.dataSource = self;
//        bodyCollectionView.isScrollEnabled = true;
        bodyCollectionView.delegate = self;
        bodyCollectionView.isPagingEnabled = true;
//        bodyCollectionView.alwaysBounceHorizontal = true;
        bodyCollectionView.register(ZHPageBodyCell.self, forCellWithReuseIdentifier: "CellID");
        return bodyCollectionView;
    }()

    override init(frame: CGRect) {
        super.init(frame: frame);
        self.isUserInteractionEnabled = true;
        self.addSubview(bodyCollectionView);
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return (bodyControlArr?.count)!;
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: self.bounds.width, height: self.bounds.height);
    }

    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell:ZHPageBodyCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellID", for: indexPath) as! ZHPageBodyCell;
        
        
        let oldView = cell.contentView.viewWithTag(1001);
        if oldView != nil {
            oldView?.removeFromSuperview();
        }

        let subVc = bodyControlArr![indexPath.row];
        subVc.view.tag = 1001;
        cell.contentView.addSubview(subVc.view);
        subVc.view.snp.makeConstraints { (make) in
            make.edges.equalToSuperview();
        }
        return cell;
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {

        let currentPage = scrollView.contentOffset.x/self.bounds.size.width;

        delegate?.pageBodyViewdidSelectItemAtIndexPath(index: Int(currentPage));

    }
    
    open func headerItemToDesWithDesIndex(index:Int){

        if (index <= ((bodyControlArr?.count)! - 1))
        {
            let desIndexpath = NSIndexPath(row: index, section: 0);
            bodyCollectionView.scrollToItem(at: desIndexpath as IndexPath, at: .centeredHorizontally, animated: true);
            bodyCollectionView.reloadData();
        }
        
    }
}
