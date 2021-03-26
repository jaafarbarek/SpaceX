//
//  LaunchListViewController.swift
//  SpaceX
//
//  Created by Jaafar Barek on 26/03/2021.
//

import RxSwift

class LaunchListViewController: UIViewController, Presentable {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: LaunchListViewModel!
    var disposeBag = DisposeBag()
    weak var launchSelectable: LaunchSelectable?
    private let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        assert(viewModel != nil, "ViewModel cannot be nil")
        
        setUp()
    }
    
    fileprivate func setUp() {
        configureRefreshControl()
        setupTableView()
        bindTrips()
        showHUD()
        viewModel.downloadTrigger.onNext(())
        title = "Space X"
    }
    
    func setupTableView() {
        tableView.register(cell: LaunchTableViewCell.self)
        tableView.separatorStyle = .none
    }
    
    // MARK: Configuration refresh control
    fileprivate func configureRefreshControl() {
        tableView.refreshControl = refreshControl
    }
    
    // MARK: Element bindings configuration
    fileprivate func bindTrips() {
        viewModel.launchSubjectList
            .bind(to: tableView.rx.items(cellIdentifier: LaunchTableViewCell.defaultReuseIdentifier))
            { [unowned self] (row, launch: Launch, cell: LaunchTableViewCell) in
                cell.configure(item: launch)
                cell.selectionStyle = .none
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
                    if self.refreshControl.isRefreshing {
                        self.refreshControl.endRefreshing()
                    }
                    self.hideHUD()
                })
                
            }
            .disposed(by: disposeBag)
        
        refreshControl.rx.controlEvent(.valueChanged)
            .bind(to: viewModel.downloadTrigger)
            .disposed(by: disposeBag)
        
        tableView.rx.modelSelected(Launch.self).subscribe(onNext: { [unowned self] (launch: Launch) in
            self.launchSelectable?.didSelect(item: launch)
        }).disposed(by: disposeBag)
    }
}
