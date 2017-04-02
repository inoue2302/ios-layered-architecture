//
//  File.swift
//  ios_rx_ranme.store
//
//  Created by 井上晶太 on 2017/03/26.
//  Copyright © 2017年 井上晶太. All rights reserved.
//
import Foundation

public struct Transaction {
    public static func execute(doProcess: () -> ()) {
        do {
            let realm = try Conection.sharedInstance()
            realm.beginWrite()
            doProcess()
            try realm.commitWrite()
        } catch Conection.Exception.LackResources {
            print("初期化失敗")
        } catch Conection.Exception.Unexpected {
            print("commit失敗")
        } catch {
            print("予期せぬエラー")
        }
    }
}
