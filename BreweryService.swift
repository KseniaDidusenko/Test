//
//  BreweryService.swift
//  BreweriesList
//
//  Created by Ksenia on 3/14/20.
//

import Alamofire
import Foundation

private let kGetBreweryApiMethod = "/breweries"

class BreweryService {

  // MARK: - Public properties

  // MARK: - Private properties

  private let networkService = NetworkService.shared()

  // MARK: - Public API

  func receiveBreweries(completion: @escaping BreweriesResultClosure) {
    networkService.request(apiMethod: kGetBreweryApiMethod,
                           parameters: nil,
                           responseClass: [BreweryModel].self) { result in
                            switch result {
                            case .success(let data):
                              completion(.success(data))
                            case .failure(let error):
                              completion(.failure(error))
                            }
    }
  }

  func receiveBreweryByName(name: String, completion: @escaping BreweriesResultClosure) {
    var components = URLComponents()
    components.path = kGetBreweryApiMethod
    components.queryItems = [
      URLQueryItem(name: "by_name", value: name)
    ]
    guard let URL = components.url else { return }
    networkService.request(apiMethod: URL.absoluteString,
                           parameters: nil,
                           responseClass: [BreweryModel].self) { result in
                            switch result {
                            case .success(let data):
                              completion(.success(data))
                            case .failure(let error):
                              completion(.failure(error))
                            }
    }
  }

  // MARK: - Private API

}
