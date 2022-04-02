//
//  Landmarks module
//  Created by SubvertDev on 21/03/2022.
//

protocol LandmarksPresentationLogic {
    func presentViewModel(_: [LandmarkModel], _ favorites: Bool)
    func presentError(withMessage: String)
}

final class LandmarksPresenter: LandmarksPresentationLogic {
    weak var view: LandmarksDisplayLogic?

    func presentViewModel(_ landmarks: [LandmarkModel], _ areFavorites: Bool) {
        if areFavorites {
            let favoriteLandmarks = landmarks.filter { $0.isFavorite == true }
            view?.updateView(with: favoriteLandmarks)
        } else {
            view?.updateView(with: landmarks)
        }
    }
    
    func presentError(withMessage message: String) {
        view?.showError(message: message)
    }
}
