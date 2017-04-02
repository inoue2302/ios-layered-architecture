//
//  RouterDelegate.swift
//  rx-swift-test
//
//  Created by Shota Inoue on 2017/03/21.
//  Copyright © 2017年 井上晶太. All rights reserved.
//

import UIKit

public protocol RouterDelegate {
    func trasionToNext(to:UIViewController, animated: Bool, completion: (() -> ())?)
    func trasionToBack(animated: Bool, completion: (() -> ())?)
}
