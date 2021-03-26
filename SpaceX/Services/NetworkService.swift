//
//  NetworkService.swift
//  SpaceX
//
//  Created by Jaafar Barek on 26/03/2021.
//

import RxSwift

protocol NetworkService: class {
    
    var baseUrl: String { get set }
    
    // MARK: Get Upcoming Trips
    func getUpcomingTrips() -> Observable<[Launch]>
    
    // MARK: Get Rocket Details
    func getRocketDetails(id: String) -> Observable<Rocket>
}
