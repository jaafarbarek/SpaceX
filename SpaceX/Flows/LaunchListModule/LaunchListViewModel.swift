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
}

// MARK: Private Helper Methods
private extension LaunchListViewModel {
    
    // MARK: Initialization subscription for [launch]
    func fetchTrips() {
        downloadTrigger
            .subscribe(onNext: { [unowned self] in
                
                DispatchQueue.global(qos: .background).async {
                    self.dependencies.networkService
                        .getUpcomingTrips()
                        .observeOn(MainScheduler.instance)
                        .subscribe(onNext: { [unowned self] launchSubjectList in
                            self.launchList = launchSubjectList
                            self.filterLaunchList()
                            self.launchSubjectList.onNext(self.launchList)
                        })
                        .disposed(by: self.disposeBag)
                }
            })
            .disposed(by: disposeBag)
    }
    
    
    // MARK: Filters lanch trips for only upcming and successful ones in the last 3 years
    func filterLaunchList() {
        launchList = launchList
            .filter{ $0.success == true || $0.upcoming == true }
            .filter {
                guard let tripDate = $0.date?.toDate() else { return false }
                
                return tripDate.checkIfDateInRange(years: 3)
            }
    }
}
