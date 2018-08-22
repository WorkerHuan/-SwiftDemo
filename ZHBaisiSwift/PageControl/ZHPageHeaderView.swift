//
//  ZHPageHeaderView.swift
//  TestBaiSi
//
//  Created by Tony on 2018/8/7.
//  Copyright © 2018年 TonyTony. All rights reserved.
//

import UIKit

protocol ZHPageHeaderViewDelegate: class {
    func pageHeaderViewdidSelectItemAtIndexPath(index:Int)
    
}

class ZHPageHeaderView: UIView,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    weak var delegate : ZHPageHeaderViewDelegate?
    
    open var itemWidth:CGFloat? = 80;
    open var headerTitleArr:[String]? = ["选中","取消"];
    var selectIndexPath:NSIndexPath = NSIndexPath(row: 0, section: 0);
    

    lazy var headerCollectionView:UICollectionView = {
        
        let layout = UICollectionViewFlowLayout();
        layout.scrollDirection = .horizontal;
       
        layout.itemSize = CGSize(width: itemWidth!, height: self.bounds.size.height);
        
        
        layout.minimumLineSpacing = 0;
        
        let headerCollectionView = UICollectionView(frame: self.bounds, collectionViewLayout: layout);
        headerCollectionView.backgroundColor = UIColor.white;
        headerCollectionView.dataSource = self;
        headerCollectionView.delegate = self;
        headerCollectionView.showsHorizontalScrollIndicator = false;
        headerCollectionView.bounces = false;
        headerCollectionView.register(ZHPageHeaderCell.self, forCellWithReuseIdentifier: "CellID");
        return headerCollectionView;
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        self.addSubview(headerCollectionView);
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: itemWidth!, height: self.bounds.size.height);
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return (headerTitleArr?.count)!;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell:ZHPageHeaderCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellID", for: indexPath) as! ZHPageHeaderCell;
        if(selectIndexPath as IndexPath == indexPath)
        {
            cell.label?.textColor = UIColor.red;
            cell.linView?.isHidden = false;
        }else
        {
            cell.label?.textColor = UIColor.gray;
            cell.linView?.isHidden = true;
        }
        cell.label?.text = headerTitleArr?[indexPath.row];
        
        return cell;
    }
    
    
    //item 对应的点击事件
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        delegate?.pageHeaderViewdidSelectItemAtIndexPath(index: indexPath.row);
        selectIndexPath = indexPath as NSIndexPath;
        headerCollectionView.reloadData();
        
    }


    open func scrollCollectionItemToDesWithDesIndex(index:Int){

        if (index <= ((headerTitleArr?.count)! - 1))
        {
            let desIndexpath = NSIndexPath(row: index, section: 0);
            
            headerCollectionView.scrollToItem(at: desIndexpath as IndexPath, at: .centeredHorizontally, animated: true);
            selectIndexPath = desIndexpath;
            headerCollectionView.reloadData();
        }
        
        
    }
     func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("sssd");
    }
}
