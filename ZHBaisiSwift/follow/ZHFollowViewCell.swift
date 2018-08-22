//
//  ZHFollowViewCell.swift
//  TestBaiSi
//
//  Created by Tony on 2018/8/10.
//  Copyright © 2018年 TonyTony. All rights reserved.
//

import UIKit

class ZHFollowViewCell: UITableViewCell {

    var iconImgView:UIImageView?
    var nameLabel:UILabel?
    var timeLabel:UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func initSubView(){
        
    }
    
}
