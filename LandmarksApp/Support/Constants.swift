//
//  Constants.swift
//  LandmarksApp
//
//  Created by Subvert on 3/21/22.
//

import UIKit

struct K {
    
    struct Titles {
        static let landmarkTitle = "Landmarks"
    }
    
    struct Error {
        static let whoopsTitle = "Whoops!"
        static let errorTitle = "Error"
        static let okTitle = "OK"
        static let landmarkError = "Can't load landmark\n"
    }
    
    struct Header {
        static let labelText = "Favorites only"
        static let height = 44
        static var frame: CGRect { .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 44) }
    }
    
    struct Images {
        static let starImageName = "star.fill"
    }
    
    struct DetailedImage {
        static let widthMultiplier = 0.61
    }
    
    struct MapView {
        static let heightMultiplier = 0.335
    }
    
    struct TableView {
        static let separatorInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
    }
    
    struct CellAppearance {
        static let cellHeight: CGFloat = 62
        static let imageWidth: CGFloat = 50
    }
    
    struct CellReuseId {
        static let landmarkCell = "LandmarkCell"
        static let favoriteSwitchCell = "FavoriteSwitchCell"
    }
    
    struct Fonts {
        struct Size {
            static let small: CGFloat = 15
            static let big: CGFloat = 28
        }
    }
    
    struct Spacing {
        static let zero = 0
        static let little = 6
        static let small = 8
        static let normal = 16
        static let big = 20
        static let extra = 24
    }
    
    struct StackView {
        struct Spacing {
            static let zero: CGFloat = 0
            static let small: CGFloat = 8
            static let normal: CGFloat = 16
        }
    }
}
