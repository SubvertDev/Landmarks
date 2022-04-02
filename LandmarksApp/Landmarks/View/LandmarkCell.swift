//
//  LandmarkCell.swift
//  LandmarksApp
//
//  Created by Subvert on 3/21/22.
//

import UIKit

final class LandmarkCell: UITableViewCell {
    
    private let cellImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = K.CellAppearance.imageWidth / 2
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let starredImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .systemYellow
        return imageView
    }()
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        accessoryType = .disclosureIndicator
        addSubviews()
        makeConstraints()
    }
    
    // MARK: Public
    func set(with landmark: LandmarkModel) {
        cellImageView.image = UIImage(named: landmark.imageName)
        titleLabel.text = landmark.name
        if landmark.isFavorite {
            let imageConfig = UIImage.SymbolConfiguration(scale: .small)
            starredImageView.image = UIImage(systemName: K.Images.starImageName, withConfiguration: imageConfig)
        } else {
            starredImageView.image = nil
        }
    }
    
    // MARK: Private
    private func addSubviews() {
        addSubview(cellImageView)
        addSubview(titleLabel)
        addSubview(starredImageView)
    }
    
    private func makeConstraints() {
        cellImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(K.Spacing.big)
            make.top.equalToSuperview().offset(K.Spacing.little)
            make.bottom.equalToSuperview().inset(K.Spacing.little)
            make.width.height.equalTo(K.CellAppearance.imageWidth)
        }
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(cellImageView.snp.trailing).offset(10)
            make.centerY.equalToSuperview()
        }
        starredImageView.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel.snp.trailing)
            make.centerY.equalTo(titleLabel)
        }
    }
}
