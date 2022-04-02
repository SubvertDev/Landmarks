//
//  Created by SubvertDev on 21/03/2022.
//

import Foundation

protocol LandmarksProviderProtocol {
    func getJsonData(completion: @escaping (Result<[LandmarkModel], LandmarksProviderError>) -> Void)
    func setChosenLandmark(_: LandmarkModel)
}

final class LandmarksProvider: LandmarksProviderProtocol, LandmarksDataPassing {
    var dataStore: LandmarksDataStore
    
    init(dataStore: LandmarksDataStore) {
        self.dataStore = dataStore
    }
    
    func getJsonData(completion: @escaping (Result<[LandmarkModel], LandmarksProviderError>) -> Void) {
        guard let path = Bundle.main.path(forResource: "landmarkData", ofType: "json") else {
            return completion(.failure(.noJsonFile))
        }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let landmarks = try JSONDecoder().decode([LandmarkModel].self, from: data)
            self.dataStore.landmarks = landmarks
            completion(.success(landmarks))
        } catch {
            completion(.failure(.decodingFailure))
        }
    }
    
    func setChosenLandmark(_ landmark: LandmarkModel) {
        dataStore.chosenLandmark = landmark
    }
}
