//
//  SpacexService.swift
//  SpaceX
//
//  Created by Jaafar Barek on 26/03/2021.
//

import Foundation
import RxSwift
import RxCocoa

enum ServiceError: Error {
    case cannotParse
}

/// A service that knows how to perform requests for GitHub data.
class SpacexService: NetworkService {
    
    
    var baseUrl = "https://api.spacexdata.com/v4/"
    
    private let session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    /// - Parameters: None
    /// - Returns: A list of most upcoming launches
    func getUpcomingTrips() -> Observable<[Launch]> {
        let urlString = baseUrl + "launches"
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)
        return session.rx
            .data(request: request)
            .flatMap { json throws -> Observable<[Launch]> in
                
                let decoder = JSONDecoder()
                
                do {
                    let trips = try decoder.decode([Launch].self, from: json)
                    return Observable.just(trips)
                } catch {
                    return Observable.error(ServiceError.cannotParse)
                }
            }
    }
    
    /// - Parameters: id: String (id of the rocket)
    /// - Returns: Get Rocket details for a launch
    func getRocketDetails(id: String) -> Observable<Rocket> {
        let urlString = baseUrl + "rockets/\(id)"
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)
        return session.rx
            .data(request: request)
            .flatMap { json throws -> Observable<Rocket> in
                
                let decoder = JSONDecoder()
                
                do {
                    let trips = try decoder.decode(Rocket.self, from: json)
                    return Observable.just(trips)
                } catch {
                    return Observable.error(ServiceError.cannotParse)
                }
            }
    }
}
