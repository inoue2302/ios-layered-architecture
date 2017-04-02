//
//  RarmenCell.swift
//  ios_rx_ranme.store
//
//  Created by 井上晶太 on 2017/03/25.
//  Copyright © 2017年 井上晶太. All rights reserved.
//

import UIKit
//import Domain
import Application

class RarmenCell: UITableViewCell {

    public var storeName: UILabel!
    public var telePhoneNumber: UILabel!
    public var cellValue: RarmenPresenter.RarmenListCellValue!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // UILabelを生成
        storeName = UILabel(frame: CGRect(x:10, y:0, width:self.frame.width / 2, height:self.frame.height))
        storeName.font = UIFont(name: "HiraKakuProN-W3", size: 20)
        storeName.textAlignment = NSTextAlignment.left
        // Cellに追加
        self.addSubview(storeName!)
        
        //シフトテキストラベルを追加
        telePhoneNumber = UILabel(frame: CGRect(x:self.frame.width / 2, y:0, width:self.frame.width, height:self.frame.height))
        telePhoneNumber.font = UIFont(name: "HiraKakuProN-W3", size: 18)
        telePhoneNumber.textAlignment = NSTextAlignment.left
        self.addSubview(telePhoneNumber)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
