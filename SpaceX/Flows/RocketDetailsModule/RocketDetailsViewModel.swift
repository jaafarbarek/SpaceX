//
//  RocketDetailsViewModel.swift
//  SpaceX
//
//  Created by Jaafar Barek on 26/03/2021.
//

import RxSwift

class RocketDetailsViewModel {
    typealias Dependencies = HasNetworkService
    
    private let dependencies: Dependencies
    let launch: Launch
    
    private(set) var rocket: Rocket!
    let disposeBag = DisposeBag()
    let downloadTrigger = PublishSubject<Void>()
    var rocketSubject = PublishSubject<Rocket>()

    init(dependencies: Dependencies, launch: Launch) {
        self.dependencies = dependencies
        self.launch = launch
        fetchRocket() 
    }
}

// MARK: Internal API
extension RocketDetailsViewModel {
    func fetchRocket() {
        
        downloadTrigger
            .subscribe(onNext: { [unowned self] in
                
                DispatchQueue.global(qos: .background).async {
                    self.dependencies.networkService
                        .getRocketDetails(id: launch.rocket ?? "")
                        .observeOn(MainScheduler.instance)
                        .subscribe(onNext: { [unowned self] rocket in
                            self.rocket = rocket
                            self.rocketSubject.onNext(self.rocket)
                        })
                        .disposed(by: self.disposeBag)
                }
            })
            .disposed(by: disposeBag)
        
    }
    
    var tripName: String {
        return launch.name ?? ""
    }
    
    var name: String {
        return rocket?.name ?? ""
    }
    
    var description: String {
        return rocket?.description ?? ""
    }
    
    var imageUrl: URL? {
        guard let imageUrlString = rocket?.images?.first,
              let url = URL(string: imageUrlString) else {
            return nil
        }
        
        return url
    }
    
    var wikepediaUrl: URL? {
        guard let wikepediaUrlString = rocket?.wikipedia,
              let url = URL(string: wikepediaUrlString) else {
            return nil
        }
        
        return url
    }
}
