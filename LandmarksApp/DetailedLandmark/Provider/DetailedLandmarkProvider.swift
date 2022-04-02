//
//  Created by SubvertDev on 21/03/2022.
//

import Foundation

protocol DetailedLandmarkProviderProtocol {
    func getLandmark(completion: @escaping (Result<LandmarkModel, DetailedLandmarkProviderError>) -> Void)
}

final class DetailedLandmarkProvider: DetailedLandmarkProviderProtocol, DetailedLandmarkDataPassing {
    let dataStore: DetailedLandmarkDataStore
    
    init(dataStore: DetailedLandmarkDataStore) {
        self.dataStore = dataStore
    }
    
    func getLandmark(completion: @escaping (Result<LandmarkModel, DetailedLandmarkProviderError>) -> Void) {
        if let landmark = dataStore.landmark {
            completion(.success(landmark))
        } else {
            completion(.failure(.noData))
        }
    }
}
