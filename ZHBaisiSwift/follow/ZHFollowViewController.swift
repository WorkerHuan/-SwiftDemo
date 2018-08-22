//
//  ZHFollowViewController.swift
//  TestBaiSi
//
//  Created by Tony on 2018/7/26.
//  Copyright © 2018年 TonyTony. All rights reserved.
//

import UIKit

class ZHFollowViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.reloadData();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    lazy var tableView:UITableView = {
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

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "CellID") ;
        if
            cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "CellID");
        }
        
        
        
        return cell!;
    }

}
