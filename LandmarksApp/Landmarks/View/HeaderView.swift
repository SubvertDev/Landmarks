//
//  HeaderView.swift
//  LandmarksApp
//
//  Created by Subvert on 3/22/22.
//

import UIKit

final class HeaderView: UIView {
    
    private let topSeparator: UIView = {
        let separator = UIView()
        separator.backgroundColor = .opaqueSeparator
        return separator
    }()
    
    private let favoriteLabel: UILabel = {
        let label = UILabel()
        label.text = K.Header.labelText
        return label
    }()
    
    private let favoriteSwitch: UISwitch = {
        let favSwitch = UISwitch()
        favSwitch.addTarget(nil,
                            action: #selector(LandmarksViewController.favoriteSwitchClicked(_:)),
                            for: .valueChanged)
        return favSwitch
    }()
    
    private let bottomSeparator: UIView = {
        let separator = UIView()
        separator.backgroundColor = .opaqueSeparator
        return separator
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(topSeparator)
        addSubview(favoriteLabel)
        addSubview(favoriteSwitch)
        addSubview(bottomSeparator)
    }
    
    private func makeConstraints() {
        topSeparator.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview()
            make.leading.equalTo(K.Spacing.normal)
            make.height.equalTo(0.5)
        }
        favoriteLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(K.Spacing.big)
        }
        favoriteSwitch.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(K.Spacing.big)
        }
        bottomSeparator.snp.makeConstraints { make in
            make.bottom.trailing.equalToSuperview()
            make.leading.height.equalTo(topSeparator)
        }
    }
}
