//
//  Conection.swift
//  ios_rx_ranme.store
//
//  Created by 井上晶太 on 2017/03/26.
//  Copyright © 2017年 井上晶太. All rights reserved.
//
import Foundation
import Realm
import RealmSwift

class Conection {
    
    private static var realmPerThread: Dictionary < String, Realm > = [:]
    
    static func sharedInstance() throws -> Realm {
        var realm = self.realmPerThread[self.threadId()]
        if realm == nil {
            do {
                realm = try Realm()
                self.realmPerThread[threadId()] = realm
            } catch let error as RLMError.Code {
                print("Realm init error: \(error)")
                switch error {
                case .fileAccess:
                    throw Exception.LackResources
                case .fail:
                    throw Exception.Unexpected
                default:
                    throw Exception.ProgramError
                }
            } catch {
                print("Realm init error: unexpected")
            }
        }
        return realm!
    }
    
    static func destroy() {
        self.realmPerThread.removeValue(forKey: self.threadId())
    }
    
    private static func threadId() -> String {
        let id = "\(Thread.current)"
        return id
    }
    
    enum Exception : Error {
        case LackResources
        case Unexpected
        case ProgramError
    }
}

