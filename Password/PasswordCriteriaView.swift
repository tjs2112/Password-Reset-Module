//
//  PasswordCriteriaView.swift
//  Password
//
//  Created by Todd Smith on 4/2/25.
//

import Foundation
import UIKit

class PasswordCriteriaView: UIView {
    
    // Components
    let stackView = UIStackView()
    let imageView = UIImageView()
    let criteriaLabel = UILabel()
    
    // images
    let circleImage = UIImage(systemName: "circle")!.withTintColor(.tertiaryLabel, renderingMode: .alwaysOriginal)
    let checkarkImage = UIImage(systemName: "checkmark.circle")!.withTintColor(.systemGreen, renderingMode: .alwaysOriginal)
    let xmarkImage = UIImage(systemName: "xmark.circle")!.withTintColor(.systemRed, renderingMode: .alwaysOriginal)
      
    init(criteriaText: String) {
        super.init(frame: .zero)
        
        criteriaLabel.text = criteriaText
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override var intrinsicContentSize: CGSize {
//        return CGSize(width: 100, height: 5)
//    }
}

extension PasswordCriteriaView {
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 8

        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = circleImage
        
        criteriaLabel.translatesAutoresizingMaskIntoConstraints = false
        criteriaLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
        criteriaLabel.textColor = .secondaryLabel
//        criteriaLabel.adjustsFontSizeToFitWidth = true
//        criteriaLabel.minimumScaleFactor = 0.8
        

    }
    
    func layout() {
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(criteriaLabel)
        
        addSubview(stackView)
     
        // stackView
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            bottomAnchor.constraint(equalTo: stackView.bottomAnchor)
        ])
        
        // CHCR
        imageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        criteriaLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)
    }
}
