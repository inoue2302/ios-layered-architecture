//
//  AddPresenter.swift
//  ios_rx_ranme.store
//
//  Created by Shota Inoue on 2017/03/27.
//  Copyright © 2017年 井上晶太. All rights reserved.
//
import Foundation
import RxSwift
import Domain

public class AddPresenter {
    public let telphoneNumberValue = Variable<String>("")
    public let storeNameValue = Variable<String>("")
    public var router: AddPageRouter!
    
    public init() {}
    
    public func addStore() {
        var entity = RarmenEntity()
        entity.storeNameValue.storeName = storeNameValue.value
        entity.telephoneNumberValue.telephoneNumber = telphoneNumberValue.value
        RarmenRepository.addRarmenstore(entity)
        router.transitionToBack()
    }
    
    public func trasitionToBack() {
        router.transitionToBack()
    }
}
