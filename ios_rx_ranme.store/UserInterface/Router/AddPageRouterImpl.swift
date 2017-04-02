//
//  AddPageRouterImpl.swift
//  ios_rx_ranme.store
//
//  Created by Shota Inoue on 2017/03/27.
//  Copyright © 2017年 井上晶太. All rights reserved.
//

import UIKit
import Application

public struct AddPageRouterImpl: AddPageRouter {
    var routerDelegate: RouterDelegate
    
    public init(delegate: RouterDelegate) {
        routerDelegate = delegate
    }
    
    public func transitionToBack() {
        routerDelegate.trasionToBack(animated: true, completion: nil)
    }
}
