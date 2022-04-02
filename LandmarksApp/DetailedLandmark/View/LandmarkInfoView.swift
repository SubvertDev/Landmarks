//
//  LandmarkInfoView.swift
//  LandmarksApp
//
//  Created by Subvert on 3/21/22.
//

import UIKit

final class LandmarkInfoView: UIView {
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = K.StackView.Spacing.zero
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()
    
    private let topStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = K.StackView.Spacing.small
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()
    
    private let bottomStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = K.StackView.Spacing.normal
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: K.Fonts.Size.big)
        label.setContentHuggingPriority(.required, for: .horizontal)
        return label
    }()
    
    let starImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .systemYellow
        imageView.contentMode = .left
        return imageView
    }()
    
    let parkLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: K.Fonts.Size.small)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.font = .systemFont(ofSize: K.Fonts.Size.small)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Private
    private func addSubviews() {
        addSubview(mainStackView)
        mainStackView.addArrangedSubview(topStackView)
        mainStackView.addArrangedSubview(bottomStackView)
        topStackView.addArrangedSubview(nameLabel)
        topStackView.addArrangedSubview(starImageView)
        bottomStackView.addArrangedSubview(parkLabel)
        bottomStackView.addArrangedSubview(locationLabel)
    }
    
    private func makeConstraints() {
        mainStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
