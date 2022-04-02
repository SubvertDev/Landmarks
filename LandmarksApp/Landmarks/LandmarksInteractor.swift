//
//  Landmarks module
//  Created by SubvertDev on 21/03/2022.
//

protocol LandmarksBusinessLogic {
    func initialState()
    func fetchLandmarks(areFavorites: Bool)
    func cellTapped(withModel: LandmarkModel)
}

final class LandmarksInteractor: LandmarksBusinessLogic {
    private let presenter: LandmarksPresentationLogic
    private let provider: LandmarksProviderProtocol

    init(presenter: LandmarksPresentationLogic, provider: LandmarksProviderProtocol) {
        self.presenter = presenter
        self.provider = provider
    }

    func initialState() {
        fetchLandmarks()
    }
    
    func fetchLandmarks(areFavorites: Bool = false) {
        provider.getJsonData { result in
            switch result {
            case .success(let landmarks):
                self.presenter.presentViewModel(landmarks, areFavorites)
            case .failure(let error):
                self.presenter.presentError(withMessage: error.localizedDescription)
            }
        }
    }
    
    func cellTapped(withModel landmark: LandmarkModel) {
        provider.setChosenLandmark(landmark)
    }
}
