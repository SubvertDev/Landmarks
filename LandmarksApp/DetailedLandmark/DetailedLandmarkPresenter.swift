//
//  DetailedLandmark module
//  Created by SubvertDev on 21/03/2022.
//

protocol DetailedLandmarkPresentationLogic {
    func presentLandmark(_ : LandmarkModel)
    func presentError(withMessage: String)
}

final class DetailedLandmarkPresenter: DetailedLandmarkPresentationLogic {
    weak var view: DetailedLandmarkDisplayLogic?

    func presentLandmark(_ landmark: LandmarkModel) {
        view?.showLandmark(viewModel: landmark)
    }
    
    func presentError(withMessage message: String) {
        view?.showError(message: message)
    }
}
