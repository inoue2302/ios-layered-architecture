//
//  RarmenRepository.swift
//  ios_rx_ranme.store
//
//  Created by 井上晶太 on 2017/03/26.
//  Copyright © 2017年 井上晶太. All rights reserved.
//

import Foundation
import Infrastructure
import RxSwift
import RealmSwift

public struct RarmenRepository {

    public static func find() -> Results<RarmenStore> {
        return CoreDao.find()
    }
    
    public static func findList() -> (Results<RarmenStore>, [RarmenEntity]) {
        var entities = [RarmenEntity]()
        let queryResults = self.find()
        for record in queryResults {
            entities.append(RarmenStoreFactory.createEntity(record))
        }
        return (queryResults, entities)
    }
    
    static func makeRarmenEntity(_ results: Results<RarmenStore>) -> [RarmenEntity]{
        var entities = [RarmenEntity]()
        for record in results {
            entities.append(RarmenStoreFactory.createEntity(record))
        }
        return entities
    }
    
    public static func deleteRarmenstore(_ entity: RarmenEntity) {
        CoreDao.delete(entity: entity.recordData)
    }
    
    public static func addRarmenstore(_ entity: RarmenEntity) {
        let store = RarmenStore()
        store.id = maxId()
        store.storeName = entity.storeNameValue.storeName
        store.telephoneNumber = entity.telephoneNumberValue.telephoneNumber
        Transaction.execute(doProcess: { _ in
            CoreDao.save(entity: store, update: false)
        })
    }
    
    public static func editRarmenstore(_ entity: RarmenEntity) {
        let beforeStore = entity.recordData!
        let afterStore = RarmenStore()
        afterStore.id = beforeStore.id
        afterStore.storeName = entity.storeNameValue.storeName
        afterStore.telephoneNumber = entity.telephoneNumberValue.telephoneNumber
        Transaction.execute(doProcess: { _ in
            CoreDao.save(entity: afterStore, update: true)
        })
    }
    
    private static func maxId() -> String {
        return NSUUID().uuidString
    }
}
