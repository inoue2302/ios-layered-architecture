//
//  BaseViewController.swift
//  rx-swift-test
//
//  Created by Shota Inoue on 2017/03/21.
//  Copyright © 2017年 井上晶太. All rights reserved.
//

import UIKit

public class BaseViewController: UIViewController, RouterDelegate {
    
    override public func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    public func trasionToNext(to: UIViewController, animated: Bool, completion: (() -> ())?) {
        present(to, animated: animated, completion: completion)
    }
    
    public func trasionToBack(animated: Bool, completion: (() -> ())?) {
        dismiss(animated: animated, completion: completion)
    }
}
