//
//  RarmenState.swift
//  ios_rx_ranme.store
//
//  Created by 井上晶太 on 2017/03/26.
//  Copyright © 2017年 井上晶太. All rights reserved.
//
import Foundation
import Infrastructure
import RxSwift
import RealmSwift

public class RarmenState {
    var rarmenObserver: Results<RarmenStore>
    var rarmenObserverNotice: NotificationToken?
    private let RarmenStoreEntityEvent = PublishSubject<[RarmenEntity]>()
    
    public init() {
       rarmenObserver = RarmenRepository.find()
        sendShiftLabelChangeEvent(results: rarmenObserver)
    }
    
    private func sendShiftLabelChangeEvent(results: Results<RarmenStore> ) {
        rarmenObserverNotice = results.addNotificationBlock( { _ in
            let entities = RarmenRepository.makeRarmenEntity(results)
            self.RarmenStoreEntityEvent.onNext(entities)
        })
    }
    
    public func createShiftLabelObserable() -> Observable<[RarmenEntity]> {
        return RarmenStoreEntityEvent
    }
    
    
    deinit {
        rarmenObserverNotice?.stop()
    }
}

