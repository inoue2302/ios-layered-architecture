//
//  RarmenListView.swift
//  ios_rx_ranme.store
//
//  Created by 井上晶太 on 2017/03/25.
//  Copyright © 2017年 井上晶太. All rights reserved.
//

import UIKit

class RarmenListView: UITableView {

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        register(RarmenCell.self, forCellReuseIdentifier: "cell")
        backgroundColor = UIColor.white
    }
}
