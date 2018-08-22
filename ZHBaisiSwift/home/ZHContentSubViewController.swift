//
//  ZHContentSubViewController.swift
//  TestBaiSi
//
//  Created by Tony on 2018/8/7.
//  Copyright © 2018年 TonyTony. All rights reserved.
//

import UIKit

enum subContentViewType:Int {
    case subContentViewTypeForAll = 0
    case subContentViewTypeForVidio
    case subContentViewTypeForText
    case subContentViewTypeForPhoto
}

class ZHContentSubViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    open var contentViewType:subContentViewType?
    
    lazy var dispalyArr:NSMutableArray = {
        let dispalyArr = NSMutableArray();
        return dispalyArr;
    }()
    
    
    lazy var tableView: UITableView = {
        
        let tableView = UITableView();
        tableView.backgroundColor = UIColor.white;
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.tableFooterView = UIView();
        tableView.estimatedRowHeight = 60;
        tableView.rowHeight = UITableViewAutomaticDimension;
        self.view.addSubview(tableView);
        
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview();
        }
        return tableView;
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.reloadData();
        self.view.backgroundColor = UIColor.white;
        
        self.getData();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dispalyArr.count;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:ZHContentSubViewCell? = tableView.dequeueReusableCell(withIdentifier: "CellID") as? ZHContentSubViewCell ;
        if
            cell == nil {
            cell = ZHContentSubViewCell(style: .default, reuseIdentifier: "CellID");
        }
        
        let rowModel = self.dispalyArr[indexPath.row] as! NSDictionary;
        
        cell?.time?.text = rowModel["passtime"] as? String;
        let headerDic = rowModel["u"] as! NSDictionary;
        cell?.nameLabel?.text = headerDic["name"] as? String;
        
        let headArr = headerDic["header"] as! NSArray;
        cell?.headerImg?.downloadedFrom(url: URL(string: headArr[0] as! String)!)
        
        if (self.contentViewType == subContentViewType(rawValue: 0)) {
            cell?.showText(text: rowModel["text"] as! String)
        }
        
        
        
        
        return cell!;
    }
    
    func getData(){
        let urlString = "http://s.budejie.com/topic/list/jingxuan/29/bs02-iphone-4.6/0-20.json";
        let url = URL(string: urlString)
        let request = URLRequest(url: url!)
        let session = URLSession.shared;
    
//        weak let weakSelf = self;
        
        let dataTask = session.dataTask(with: request) { [unowned self](data, resp, err) in
            
            if(err == nil){
                
                let json: NSDictionary = try! JSONSerialization.jsonObject(with: data!, options: []) as! NSDictionary
                
                let dataArr = json["list"] as! NSArray;
                for  i in dataArr{
                    self.dispalyArr.add(i)
                }
                
                DispatchQueue.main.async(execute: {
                    self.tableView.reloadData()
                })
//                print(json);
            }
            
            
            
        }
        dataTask .resume();
        
    }

    

}
