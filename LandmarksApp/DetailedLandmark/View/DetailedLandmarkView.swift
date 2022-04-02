//
//  Created by SubvertDev on 21/03/2022.
//

import UIKit
import MapKit

final class DetailedLandmarkView: UIView {

    private let mapView = MKMapView()
    private let landmarkInfoView = LandmarkInfoView()
    
    private let imageContainerView: UIView = {
        let containerView = UIView()
        containerView.clipsToBounds = false
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 0.4
        containerView.layer.shadowOffset = .zero
        containerView.layer.shadowRadius = 10
        return containerView
    }()
    
    private let landmarkImageView: UIImageView = {
        let imageView = UIImageView()
        let imageWidth = UIScreen.main.bounds.width * K.DetailedImage.widthMultiplier
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 4
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.cornerRadius = imageWidth / 2
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        addSubviews()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Public
    func updateView(with landmark: LandmarkModel) {
        landmarkImageView.image = UIImage(named: landmark.imageName)
        landmarkInfoView.nameLabel.text = landmark.name
        landmarkInfoView.starImageView.image = landmark.isFavorite ? UIImage(systemName: "star.fill") : nil
        landmarkInfoView.parkLabel.text = landmark.park
        landmarkInfoView.locationLabel.text = landmark.state
        
        let coordinate = CLLocationCoordinate2D(latitude: landmark.coordinates.latitude,
                                                longitude: landmark.coordinates.longitude)
        let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 2200, longitudinalMeters: 2200)
        mapView.setRegion(region, animated: false)
    }

    // MARK: Private
    private func addSubviews() {
        addSubview(mapView)
        addSubview(imageContainerView)
        imageContainerView.addSubview(landmarkImageView)
        addSubview(landmarkInfoView)
    }
    
    private func makeConstraints() {
        mapView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(K.MapView.heightMultiplier)
        }
        imageContainerView.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(K.DetailedImage.widthMultiplier)
            make.height.equalTo(imageContainerView.snp.width)
            make.centerY.equalTo(mapView.snp.bottom)
            make.centerX.equalToSuperview()
        }
        landmarkImageView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
        landmarkInfoView.snp.makeConstraints { make in
            make.top.equalTo(imageContainerView.snp.bottom).offset(22)
            make.leading.equalToSuperview().offset(K.Spacing.normal)
            make.trailing.equalToSuperview().inset(K.Spacing.normal)
        }
    }
}
