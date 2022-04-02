//
//  DetailedLandmark module
//  Created by SubvertDev on 21/03/2022.
//

protocol DetailedLandmarkBusinessLogic {
    func initialState()
}

final class DetailedLandmarkInteractor: DetailedLandmarkBusinessLogic {
    let presenter: DetailedLandmarkPresentationLogic
    let provider: DetailedLandmarkProviderProtocol

    init(presenter: DetailedLandmarkPresentationLogic, provider: DetailedLandmarkProviderProtocol) {
        self.presenter = presenter
        self.provider = provider
    }
    
    func initialState() {
        showLandmark()
    }

    private func showLandmark() {
        provider.getLandmark { result in
            switch result {
            case .success(let landmark):
                self.presenter.presentLandmark(landmark)
            case .failure(let error):
                self.presenter.presentError(withMessage: error.localizedDescription)
            }
        }
    }
}
