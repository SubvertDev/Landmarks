//
//  Landmarks module
//  Created by SubvertDev on 21/03/2022.
//

import UIKit

final class LandmarksBuilder: ModuleBuilder {

    func build() -> UIViewController {
        let dataStore = LandmarksDataStore()
        let router = LandmarksRouter(dataStore: dataStore)
        let provider = LandmarksProvider(dataStore: dataStore)
        let presenter = LandmarksPresenter()
        let interactor = LandmarksInteractor(presenter: presenter, provider: provider)
        let controller = LandmarksViewController(interactor: interactor, router: router)

        presenter.view = controller
        router.viewController = controller
        
        return controller
    }
}
