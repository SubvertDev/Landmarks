//
//  Errors+Ext.swift
//  LandmarksApp
//
//  Created by Subvert on 3/22/22.
//

import Foundation

// MARK: LandmarksProviderError
enum LandmarksProviderError: Error {
    case noJsonFile
    case decodingFailure
}

extension LandmarksProviderError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .noJsonFile:
            return NSLocalizedString("No json file error", comment: "")
        case .decodingFailure:
            return NSLocalizedString("Error decoding json data", comment: "")
        }
    }
}

// MARK: DetailedLandmarkProviderError
enum DetailedLandmarkProviderError: Error {
    case noData
}

extension DetailedLandmarkProviderError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .noData:
            return NSLocalizedString("No landmark data error", comment: "")
        }
    }
}
