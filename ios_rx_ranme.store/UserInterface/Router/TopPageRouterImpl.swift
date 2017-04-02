//
//  TopPageRouter.swift
//  rx-swift-test
//
//  Created by Shota Inoue on 2017/03/21.
//  Copyright © 2017年 井上晶太. All rights reserved.
//
import UIKit
import Application
import Domain

public struct TopPageRouterImpl: TopPageRouter {
    var routerDelegate: RouterDelegate
    
    public init(delegate: RouterDelegate) {
        routerDelegate = delegate
    }
    
    public func transitionToAdd() {
        let addViewCtrl = AddViewController(nibName: "AddViewController", bundle: nil)
        addViewCtrl.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        routerDelegate.trasionToNext(to: addViewCtrl, animated: true, completion: nil)
    }
    
    public func transitionToEdit(_ cellValue: RarmenPresenter.RarmenListCellValue) {
        let editViewCtrl = EditViewController(nibName: "EditViewController", bundle: nil)
        editViewCtrl.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        editViewCtrl.viewModel = EditPresenter(cellValue)
        routerDelegate.trasionToNext(to: editViewCtrl, animated: true, completion: nil)
    }
}
