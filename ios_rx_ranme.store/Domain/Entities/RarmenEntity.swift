//
//  RarmenEntity.swift
//  ios_rx_ranme.store
//
//  Created by 井上晶太 on 2017/03/26.
//  Copyright © 2017年 井上晶太. All rights reserved.
//
import Foundation
import Infrastructure

public struct RarmenEntity {
    public var id = "0"
    public var storeNameValue: StoreNameValue
    public var telephoneNumberValue: TelphoneNumberValue
    public var recordData: RarmenStore!
    
    public init() {
        id = "0"
        recordData = nil
        storeNameValue = StoreNameValue("ラーメン")
        telephoneNumberValue = TelphoneNumberValue("00-0000-00")
    }
    
    public mutating func setData(rarmenData: RarmenStore) {
        id = rarmenData.id
        recordData = rarmenData
        storeNameValue = StoreNameValue(rarmenData.storeName)
        telephoneNumberValue = TelphoneNumberValue(rarmenData.telephoneNumber)
    }
    
    public func isEmpty() -> Bool{
        return self.id == "0"
    }
}
