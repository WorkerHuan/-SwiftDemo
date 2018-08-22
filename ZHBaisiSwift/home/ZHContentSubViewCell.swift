//
//  ZHContentSubViewCell.swift
//  TestBaiSi
//
//  Created by Tony on 2018/8/8.
//  Copyright © 2018年 TonyTony. All rights reserved.
//

import UIKit

class ZHContentSubViewCell: UITableViewCell {

    var headerImg:UIImageView?
    var nameLabel:UILabel?
    var time:UILabel?
    
    var myContentView:UIView?
    
    var numArr:NSArray?
    
    var myTextLabel:UILabel?
    var showButton:UIButton?
    
    lazy var showButton1:UIButton = {
        let showButton1 = UIButton(type: .custom);
        showButton1.setTitle("展开", for: .normal);
        showButton1.setTitle("收起", for: .selected);
        showButton1.setTitleColor(UIColor.gray, for: .normal)
        showButton1.setTitleColor(UIColor.gray, for: .selected)
        showButton1.titleLabel?.font = UIFont.systemFont(ofSize: 12);
        showButton1.addTarget(self, action: #selector(textShowButtonAction(sender:)), for: .touchUpInside)
        
        return showButton1;
        
    }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    open func showText(text:String){
        
        if myTextLabel != nil {
            myTextLabel?.text = text;
        }
        
        
        
        let strSize = (text as NSString).boundingRect(with: CGSize(width: self.bounds.width - 20, height: 1000), options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14)], context: nil).size;
        
//        myTextLabel?.numberOfLines = 4;
        
        if showButton == nil {
            
            self.myContentView?.addSubview(showButton1);
            self.showButton = showButton1;
            self.showButton?.snp.makeConstraints({ (make) in
                make.top.equalTo((myTextLabel?.snp.bottom)!).offset(2);
                make.left.equalTo(10);
                make.bottom.equalTo(-2);
                make.width.equalTo(60);
                make.height.equalTo(30);
            })
        }
        
        self.showButton?.isHidden = !(strSize.height > 60);
        
    }
    
    func showVideo(text:String,url:String){
        
    }
    
    @objc func textShowButtonAction(sender:UIButton){
        sender.isSelected = !sender.isSelected;
        myTextLabel?.numberOfLines = sender.isSelected ? 0:4;
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        headerImg = UIImageView();
        self.contentView.addSubview(headerImg!);
        
        nameLabel = UILabel();
        nameLabel?.font = UIFont.systemFont(ofSize: 12);
        self.contentView.addSubview(nameLabel!);
        
        time = UILabel();
        time?.textColor = UIColor.gray;
        time?.font = UIFont.systemFont(ofSize: 10);
        self.contentView.addSubview(time!);
        
        myContentView = UIView();
//        myContentView?.backgroundColor = UIColor.red;
        self.contentView.addSubview(myContentView!);
        
        let bottomView = UIView();
        self.contentView.addSubview(bottomView);
        
        headerImg?.snp.makeConstraints({ (make) in
            make.left.top.equalToSuperview().offset(10);
            make.width.height.equalTo(40);
        })
        
        nameLabel?.snp.makeConstraints({ (make) in
            make.left.equalTo((headerImg?.snp.right)!).offset(5);
            make.top.equalTo((headerImg?.snp.top)!);
            make.right.equalToSuperview().offset(-10);
        })
        
        time?.snp.makeConstraints({ (make) in
            make.left.equalTo((nameLabel?.snp.left)!);
            make.top.equalTo((nameLabel?.snp.bottom)!).offset(10);
            make.height.equalTo(18);
        })
        
        bottomView.snp.makeConstraints { (make) in
//            make.top.equalTo((headerImg?.snp.bottom)!).offset(10);
            make.left.equalToSuperview();
            make.bottom.right.equalToSuperview();
            make.height.equalTo(40);
        }
        
        
        
        
        let userInterImgArr = ["mainCellDing","mainCellCai","mainCellShare","mainCellComment"];
        
        let userInterLabelArr = NSMutableArray();
        
        var lastView:UIView?;
        
        for index in 0...3{
            
            let userInterMap = self.getUserInterView(userImg: userInterImgArr[index]);
            
            let userInterView = userInterMap.userInterView;
            
            userInterLabelArr.add(userInterMap.userInterLabel);
            
            bottomView.addSubview(userInterView);
            
            if index == 0{
                userInterView.snp.makeConstraints({ (make) in
                    make.left.equalTo(0);
                    make.top.bottom.equalTo(0);
                })
            }else if (index == 3)
            {
                userInterView.snp.makeConstraints({ (make) in
                    make.right.equalTo(-15);
                    make.top.bottom.equalTo(0);
                    make.left.equalTo((lastView?.snp.right)!).offset(0);
                    make.width.equalTo((lastView?.snp.width)!);
                })
            }else
            {
                userInterView.snp.makeConstraints({ (make) in
                    make.left.equalTo((lastView?.snp.right)!).offset(0);
                    make.top.bottom.equalTo(0);
                    make.width.equalTo((lastView?.snp.width)!);
                })
            }
            
            lastView = userInterView;
        }
        
        numArr = userInterLabelArr;
        

        
        
        myContentView?.snp.makeConstraints({ (make) in
            make.top.equalTo((headerImg?.snp.bottom)!).offset(10);
            make.left.equalToSuperview();
            make.right.equalToSuperview();
            make.bottom.equalTo(bottomView.snp.top).offset(-10);
            make.height.greaterThanOrEqualTo(60);
        })

        myTextLabel = UILabel();
        myTextLabel?.font = UIFont.systemFont(ofSize: 14);
        self.myContentView?.addSubview(myTextLabel!);

        myTextLabel?.numberOfLines = 0;
        myTextLabel?.snp.makeConstraints({ (make) in
            make.top.equalToSuperview();
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.greaterThanOrEqualTo(1)
        })
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    
    func getUserInterView(userImg:String) -> (userInterView:UIView,userInterLabel:UIView){
        
        let userInterView = UIView();
        
        let userInterImg = UIButton(type: .custom);
        userInterImg.setImage(UIImage(named: userImg), for: .normal);
        userInterView.addSubview(userInterImg);
        
        let userInterLabel = UILabel();
        userInterLabel.font = UIFont.systemFont(ofSize: 12);
        userInterLabel.textColor = UIColor.gray;
        userInterLabel.text = "124";
        userInterView.addSubview(userInterLabel);
        
        userInterImg.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(-5);
            make.centerY.equalToSuperview();
            make.width.height.equalTo(20);
        }
        
        userInterLabel.snp.makeConstraints { (make) in
            make.left.equalTo(userInterImg.snp.right).offset(5);
            make.centerY.equalToSuperview();
        }
        
        return (userInterView,userInterLabel);
    }

}
