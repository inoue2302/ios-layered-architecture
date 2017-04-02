//
//  TopViewController.swift
//  ios_rx_ranme.store
//
//  Created by 井上晶太 on 2017/03/25.
//  Copyright © 2017年 井上晶太. All rights reserved.
//
import UIKit
import Application
import RxSwift
import RxCocoa
import Domain

public class TopViewController: BaseViewController {
    
    @IBOutlet weak var rarmenStoreLayoutView: UIView!
    @IBOutlet weak var deleteBtn: UIButton!
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var editBtn: UIButton!
    
    var viewModel = RarmenPresenter()
    var currentIndexPath: IndexPath!
    var router: TopPageRouter!
    var rarmenStoreList: RarmenListView!
    private var disposeBag = DisposeBag()
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        rarmenStoreList = RarmenListView(frame: rarmenStoreLayoutView.frame, style: UITableViewStyle.plain)
        rarmenStoreList.frame.origin.x = 0
        rarmenStoreList.frame.origin.y = 0
        rarmenStoreLayoutView.addSubview(rarmenStoreList)
        viewModel.router = TopPageRouterImpl(delegate: self)
        
        viewModel.rarmenListCellValues.asObservable()
            .bindTo(rarmenStoreList.rx.items(cellIdentifier: "cell", cellType: RarmenCell.self)) { (row, cellValue, cell) in
                cell.storeName.text = cellValue.getStoreName()
                cell.telePhoneNumber.text = cellValue.getTelphoneNumber()
                cell.cellValue = cellValue
            }
            .addDisposableTo(disposeBag)
        rarmenStoreList.rx.itemSelected
            .bindNext { [weak self] indexPath in
                print(indexPath)
                self?.currentIndexPath = indexPath
            }
            .addDisposableTo(disposeBag)
        deleteBtn.rx.tap
            .bindNext { [weak self] _ in
                if let indexPath = self?.currentIndexPath {
                    let storeCell = self?.rarmenStoreList.cellForRow(at: indexPath) as! RarmenCell
                    self?.viewModel.deleteRarmenstore(storeCell.cellValue)
                }
            }
            .addDisposableTo(disposeBag)
        editBtn.rx.tap
            .bindNext { [weak self] _ in
                if let indexPath = self?.currentIndexPath {
                    let storeCell = self?.rarmenStoreList.cellForRow(at: indexPath) as! RarmenCell
                    self?.viewModel.router.transitionToEdit(storeCell.cellValue)
                }
            }
            .addDisposableTo(disposeBag)
        addBtn.rx.tap
            .bindNext { [weak self] _ in
            self?.viewModel.router.transitionToAdd()
        }
        .addDisposableTo(disposeBag)
        
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
