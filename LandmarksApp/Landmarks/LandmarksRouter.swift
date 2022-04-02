//
//  LandmarksRouter.swift
//  LandmarksApp
//
//  Created by Subvert on 3/21/22.
//

import Foundation

protocol LandmarksRouterProtocol {
    func openDetailedLandmarkVC()
}

protocol LandmarksDataPassing {
    var dataStore: LandmarksDataStore { get }
}

final class LandmarksRouter: LandmarksRouterProtocol, LandmarksDataPassing {
    weak var viewController: LandmarksViewController?
    let dataStore: LandmarksDataStore
    
    init(dataStore: LandmarksDataStore) {
        self.dataStore = dataStore
    }
    
    func openDetailedLandmarkVC() {
        let destinationVC = DetailedLandmarkBuilder().build() as! DetailedLandmarkViewController
        var destinationDS = destinationVC.router.dataStore
        passDataToDetailedLandmarkVC(source: dataStore, destination: &destinationDS)
        viewController?.navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    private func passDataToDetailedLandmarkVC(source: LandmarksDataStore, destination: inout DetailedLandmarkDataStore) {
        destination.landmark = source.chosenLandmark
    }
}
