//
//  LaunchListViewModel.swift
//  SpaceX
//
//  Created by Jaafar Barek on 26/03/2021.
//

import RxSwift

class LaunchListViewModel {
    
    typealias Dependencies = HasNetworkService

    private let dependencies: Dependencies
    
    // MARK: Rx Bindings & DisposeBag
    var disposeBag = DisposeBag()
    let downloadTrigger = PublishSubject<Void>()
    let launchSubjectList = PublishSubject<[Launch]>()
    var launchList = [Launch]()
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        fetchTrips()
    }
    
    // MARK: Initialization subscription for [launch]
    func fetchTrips() {
        downloadTrigger
            .subscribe(onNext: { [unowned self] in
                
                DispatchQueue.global(qos: .background).async {
                    self.dependencies.networkService
                        .getUpcomingTrips()
                        .observeOn(MainScheduler.instance)
                        .subscribe(onNext: { [unowned self] launchSubjectList in
                            self.launchList = launchSubjectList.filter{ $0.success == true || $0.upcoming == true }
                            
                            print(self.launchList.count)
                            
                            let pastDate = Calendar.current.date(byAdding: .year, value: -3, to: Date())!
                            
                            
                            self.launchList = self.launchList.filter {
                                if let tripDate = $0.date?.toDate() {
                                    
                                    return pastDate < tripDate
                                }
                                
                                return false
                            }
                        
                            print(self.launchList.count)
                            
                            self.launchList.sort { $0.upcoming! && !$1.upcoming! }
                            
                            self.launchSubjectList.onNext(self.launchList)
                        })
                        .disposed(by: self.disposeBag)
                }
            })
            .disposed(by: disposeBag)
    }
    
}
