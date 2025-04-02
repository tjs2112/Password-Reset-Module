//
//  PasswordStatusView.swift
//  Password
//
//  Created by Todd Smith on 4/2/25.
//

import Foundation
import UIKit

class PasswordStatusView: UIView {
    
    let stackView = UIStackView()
    let passwordLengthCriteriaView = PasswordCriteriaView(criteriaText: "8-32 characters (no spaces)")
    let criteriaExplanationLabel = UILabel()
    let upperCaseCriteriaView = PasswordCriteriaView(criteriaText: "Uppercase Letter (A-Z)")
    let lowerCaseCriteriaView = PasswordCriteriaView(criteriaText: "Lowercase Letter (a-z)")
    let digitCriteriaView = PasswordCriteriaView(criteriaText: "Digit (0-9)")
    let specialCharCriteriaView = PasswordCriteriaView(criteriaText: "Special Character (Ex. !@#$%^)")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 200)
    }
}

extension PasswordStatusView {
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .tertiarySystemFill
        
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .equalCentering
        
        
        passwordLengthCriteriaView.translatesAutoresizingMaskIntoConstraints = false
        
        criteriaExplanationLabel.translatesAutoresizingMaskIntoConstraints = false
        criteriaExplanationLabel.attributedText = makeAttributedString()
        criteriaExplanationLabel.numberOfLines = 0
        criteriaExplanationLabel.lineBreakMode = .byWordWrapping
                
        upperCaseCriteriaView.translatesAutoresizingMaskIntoConstraints = false
        
        lowerCaseCriteriaView.translatesAutoresizingMaskIntoConstraints = false
        
        digitCriteriaView.translatesAutoresizingMaskIntoConstraints = false
        
        specialCharCriteriaView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func layout() {
        stackView.addArrangedSubview(passwordLengthCriteriaView)
        stackView.addArrangedSubview(criteriaExplanationLabel)
        stackView.addArrangedSubview(upperCaseCriteriaView)
        stackView.addArrangedSubview(lowerCaseCriteriaView)
        stackView.addArrangedSubview(digitCriteriaView)
        stackView.addArrangedSubview(specialCharCriteriaView)
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 2),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 2)
        ])
    }
}

extension PasswordStatusView {
    
    private func makeAttributedString() -> NSMutableAttributedString {
        
        let normalTextAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .subheadline), .foregroundColor: UIColor.secondaryLabel]
        let boldTextAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.boldSystemFont(ofSize: UIFont.preferredFont(forTextStyle: .subheadline).pointSize), .foregroundColor: UIColor.label]
        
        let rootSting = NSMutableAttributedString(string: "Use at least ", attributes: normalTextAttributes)
        rootSting.append(NSAttributedString(string: "3 of the 4", attributes: boldTextAttributes))
        rootSting.append(NSAttributedString(string: " below criteria when creating your password.", attributes: normalTextAttributes))
        
        return rootSting
    }
}
