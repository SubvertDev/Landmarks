//
//  DetailedLandmark module
//  Created by SubvertDev on 21/03/2022.
//

import UIKit

final class DetailedLandmarkBuilder: ModuleBuilder {

    func build() -> UIViewController {
        let dataStore = DetailedLandmarkDataStore()
        let router = DetailedLandmarkRouter(dataStore: dataStore)
        let provider = DetailedLandmarkProvider(dataStore: dataStore)
        let presenter = DetailedLandmarkPresenter()
        let interactor = DetailedLandmarkInteractor(presenter: presenter, provider: provider)
        let controller = DetailedLandmarkViewController(interactor: interactor, router: router)

        presenter.view = controller
        router.viewController = controller
        
        return controller
    }
}
