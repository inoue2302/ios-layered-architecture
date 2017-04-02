//
//  RarmenFactory.swift
//  ios_rx_ranme.store
//
//  Created by 井上晶太 on 2017/04/02.
//  Copyright © 2017年 井上晶太. All rights reserved.
//

import Foundation
import Infrastructure

struct RarmenStoreFactory {
    
    static func createEntity(_ recordData: RarmenStore ) -> RarmenEntity {
        var entity = RarmenEntity()
        entity.id = recordData.id
        entity.recordData = recordData
        entity.storeNameValue = StoreNameValue(recordData.storeName)
        entity.telephoneNumberValue = TelphoneNumberValue(recordData.telephoneNumber)
        return entity
    }
}
