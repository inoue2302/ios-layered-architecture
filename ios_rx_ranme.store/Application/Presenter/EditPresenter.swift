//
//  EditPresenter.swift
//  ios_rx_ranme.store
//
//  Created by Shota Inoue on 2017/03/28.
//  Copyright © 2017年 井上晶太. All rights reserved.
//

import Foundation
import RxSwift
import Domain
import Realm
import RealmSwift

public class EditPresenter {
    public let telphoneNumberValue = Variable<String>("")
    public let storeNameValue = Variable<String>("")
    public var router: EditPageRouter!
    public var entity: RarmenEntity
    
    public init(_ cellValue: RarmenPresenter.RarmenListCellValue) {
        self.entity = cellValue.getEntity()
        telphoneNumberValue.value = self.entity.telephoneNumberValue.telephoneNumber
        storeNameValue.value      = self.entity.storeNameValue.storeName
    }
    
    public func editStore() {
        entity.storeNameValue.storeName = storeNameValue.value
        entity.telephoneNumberValue.telephoneNumber = telphoneNumberValue.value
        RarmenRepository.editRarmenstore(entity)
        router.transitionToBack()
    }
    
    public func trasitionToBack() {
        router.transitionToBack()
    }
}
