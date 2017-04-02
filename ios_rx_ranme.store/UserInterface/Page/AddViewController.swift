//
//  AddViewController.swift
//  ios_rx_ranme.store
//
//  Created by 井上晶太 on 2017/03/27.
//  Copyright © 2017年 井上晶太. All rights reserved.
//

import UIKit
import Application
import RxSwift
import RxCocoa

class AddViewController: BaseViewController {

    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var storeName: UITextField!
    @IBOutlet weak var telphoneNumber: UITextField!
    
    var viewModel = AddPresenter()
    private var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.router = AddPageRouterImpl(delegate: self)
        
        viewModel.storeNameValue.asObservable()
            .bindTo(storeName.rx.text)
            .addDisposableTo(disposeBag)
        storeName.rx.text
            .bindNext { text in
                self.viewModel.storeNameValue.value = text!
            }
            .addDisposableTo(disposeBag)
        
        viewModel.telphoneNumberValue.asObservable()
            .bindTo(telphoneNumber.rx.text)
            .addDisposableTo(disposeBag)
        
        telphoneNumber.rx.text
            .bindNext { text in
                self.viewModel.telphoneNumberValue.value = text!
            }
            .addDisposableTo(disposeBag)
        
        addBtn.rx.tap
            .bindNext { _ in
                self.viewModel.addStore()
            }
            .addDisposableTo(disposeBag)
        
        backBtn.rx.tap
            .bindNext { _ in
                self.viewModel.trasitionToBack()
            }
            .addDisposableTo(disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
