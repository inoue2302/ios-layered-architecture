//
//  rarmenPresenter.swift
//  ios_rx_ranme.store
//
//  Created by 井上晶太 on 2017/03/26.
//  Copyright © 2017年 井上晶太. All rights reserved.
//
import Foundation
import RxSwift
import Domain

public class RarmenPresenter {
    var rarmenState :RarmenState
    public let rarmenListCellValues: Variable<[RarmenListCellValue]> = Variable([])
    private let disposeBag = DisposeBag()
    public var router: TopPageRouter!
    
    public init() {
        rarmenState = RarmenState()
        reciveModelChangeEvent()
    }
    
    private func reciveModelChangeEvent() {
        rarmenState.createShiftLabelObserable().subscribe(onNext: { entities in
            self.rarmenListCellValues.value = self.createCellValues(entities)
        }
        ,onError:{ _ in print("error")}
        ,onCompleted:{ _ in print("completed")})
        .addDisposableTo(disposeBag)
    }
    
    public func deleteRarmenstore(_ cellValue: RarmenListCellValue) {
        RarmenRepository.deleteRarmenstore(cellValue.getEntity())
    }
    
    public func trasitionToAddPage() {
        router.transitionToAdd()
    }
    
    public func createCellValues(_ entities: [RarmenEntity]) -> [RarmenListCellValue]{
        let cellValues = entities.map {
            RarmenListCellValue(entity: $0)
        }
        return cellValues
    }
    
    public struct RarmenListCellValue {
        let storeName: String
        let telphoneNumber : String
        var rarmenEntity: RarmenEntity
        
        init(entity: RarmenEntity) {
            storeName = entity.storeNameValue.storeName
            telphoneNumber = entity.telephoneNumberValue.telephoneNumber
            rarmenEntity = entity
        }
        
        public func getStoreName() -> String{
            return storeName
        }
        
        public func getTelphoneNumber() -> String{
            return telphoneNumber
        }
        
        public func getEntity() -> RarmenEntity {
            return rarmenEntity
        }
    }
}
