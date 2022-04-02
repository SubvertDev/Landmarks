//
//  DetailedLandmarkRouter.swift
//  LandmarksApp
//
//  Created by Subvert on 3/21/22.
//

import Foundation

protocol DetailedLandmarkRouterProtocol {
    func closeDetailedLandmarkVC()
}

protocol DetailedLandmarkDataPassing {
    var dataStore: DetailedLandmarkDataStore { get }
}

final class DetailedLandmarkRouter: DetailedLandmarkRouterProtocol, DetailedLandmarkDataPassing {
    unowned var viewController: DetailedLandmarkViewController!
    let dataStore: DetailedLandmarkDataStore
    
    init(dataStore: DetailedLandmarkDataStore) {
        self.dataStore = dataStore
    }
    
    func closeDetailedLandmarkVC() {
        viewController.navigationController?.popViewController(animated: true)
    }
}
