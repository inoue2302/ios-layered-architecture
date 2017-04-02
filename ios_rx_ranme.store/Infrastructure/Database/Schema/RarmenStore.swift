//
//  RarmenStore.swift
//  ios_rx_ranme.store
//
//  Created by 井上晶太 on 2017/03/26.
//  Copyright © 2017年 井上晶太. All rights reserved.
//

import RealmSwift

public class RarmenStore: Object {
    public dynamic var id: String = "0"
    public dynamic var storeName: String = "シフト"
    public dynamic var telephoneNumber = "0-0000-0000"
    
    override public static func primaryKey() -> String? {
        return "id"
    }
}
