//
//  EditViewController.swift
//  ios_rx_ranme.store
//
//  Created by Shota Inoue on 2017/03/28.
//  Copyright © 2017年 井上晶太. All rights reserved.
//

import UIKit
import Application
import RxSwift
import RxCocoa

class EditViewController: BaseViewController {
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var editBtn: UIButton!
    @IBOutlet weak var storeName: UITextField!
    @IBOutlet weak var telphoneNumber: UITextField!
    
    var viewModel: EditPresenter!
    private var disposeBag = DisposeBag()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.router = EditPageRouterImpl(delegate: self)
        
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
        
        editBtn.rx.tap
            .bindNext { _ in
                self.viewModel.editStore()
            }
            .addDisposableTo(disposeBag)
        
        backBtn.rx.tap
            .bindNext { _ in
                self.viewModel.trasitionToBack()
            }
            .addDisposableTo(disposeBag)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
