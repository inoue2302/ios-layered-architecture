//
//  InitService.swift
//  ios_rx_ranme.store
//
//  Created by 井上晶太 on 2017/03/26.
//  Copyright © 2017年 井上晶太. All rights reserved.
//

import Foundation
import Infrastructure

public struct InitService {
    
    public static func maigration() {
        Initializer.migration()
    }
    
    public static func runSeeder() {
        Transaction.execute(doProcess: { _ in
            self.insertRarmenStore()
        })
    }
    
    public static func insertRarmenStore() {
        let store1 = RarmenStore()
        store1.id = NSUUID().uuidString
        store1.storeName = "ラーメン二郎"
        store1.telephoneNumber = "00-0000-0000"
        
        CoreDao.save(entity: store1)
        let store2 = RarmenStore()
        store2.id = NSUUID().uuidString
        store2.storeName = "麺屋武蔵"
        store2.telephoneNumber = "00-0000-0000"
        CoreDao.save(entity: store2)
        
        let store3 = RarmenStore()
        store3.id = NSUUID().uuidString
        store3.storeName = "天下一品"
        store3.telephoneNumber = "00-0000-0000"
        CoreDao.save(entity: store2)
        
    }
}
