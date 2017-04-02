//
//  TopPageRouter.swift
//  ios_rx_ranme.store
//
//  Created by 井上晶太 on 2017/03/27.
//  Copyright © 2017年 井上晶太. All rights reserved.
//
import Domain

public protocol TopPageRouter {
    func transitionToAdd()
    func transitionToEdit(_ cellValue: RarmenPresenter.RarmenListCellValue)
}
