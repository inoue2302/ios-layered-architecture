//
//  CoreDao.swift
//  ios_rx_ranme.store
//
//  Created by 井上晶太 on 2017/03/26.
//  Copyright © 2017年 井上晶太. All rights reserved.
//

import Foundation
import RealmSwift

public class CoreDao<T : Object> {
    
    public static func save(entity: T, update: Bool = false) {
        let realm = try! Conection.sharedInstance()
        realm.add(entity,update: update)
    }
    
    public static func find(condition: String = "") -> Results<T> {
        if condition.isEmpty == true {
            return try! Conection.sharedInstance().objects(T.self)
        }
        return try! Conection.sharedInstance().objects(T.self).filter(condition)
    }
    
    public static func delete(entity: T) {
        let realm = try! Conection.sharedInstance()
        try! realm.write {
            realm.delete(entity)
        }
    }
    
    public static func deleteAll() {
        try! Conection.sharedInstance().deleteAll()
    }
}

