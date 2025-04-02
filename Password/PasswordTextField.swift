//
//  Untitled.swift
//  Password
//
//  Created by Todd Smith on 4/2/25.
//

import UIKit

class PasswordTextField: UIView {
    
    let lockImageView = UIImageView(image: UIImage(systemName: "lock.fill"))
    let textField = UITextField()
    let placeHolderText: String
    let eyeButton = UIButton(type: .custom)
    let dividerView = UIView()
    let errorMessageLabel = UILabel()
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        
//        style()
//        layout()
//    }
    
    init(placeHolderText: String) {
        self.placeHolderText = placeHolderText
        
        super.init(frame: .zero)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 55)
    }
}

extension PasswordTextField {
    
    private func style() {
        translatesAutoresizingMaskIntoConstraints = false
//        backgroundColor = .systemOrange
        
        lockImageView.translatesAutoresizingMaskIntoConstraints = false
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = placeHolderText
        textField.isSecureTextEntry = false
        textField.keyboardType = .asciiCapable
//        textField.delegate = self
        textField.attributedPlaceholder = NSAttributedString(string: placeHolderText,
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.secondaryLabel])
        
        eyeButton.translatesAutoresizingMaskIntoConstraints = false
        eyeButton.setImage(UIImage(systemName: "eye.circle"), for: .normal)
        eyeButton.setImage(UIImage(systemName: "eye.slash.circle"), for: .selected)
        eyeButton.addTarget(self, action: #selector(togglePasswordView), for: .touchUpInside)
        
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.backgroundColor = .separator
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        errorMessageLabel.text = "Your password must meet the requirements below."
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.lineBreakMode = .byWordWrapping
        errorMessageLabel.isHidden = false
    }
    
    private func layout() {
        addSubview(lockImageView)
        addSubview(textField)
        addSubview(eyeButton)
        addSubview(dividerView)
        addSubview(errorMessageLabel)
        
        // lockImage
        NSLayoutConstraint.activate([
            lockImageView.centerYAnchor.constraint(equalTo: textField.centerYAnchor),
            lockImageView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
        
        // password Field
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: topAnchor),
            textField.leadingAnchor.constraint(equalToSystemSpacingAfter: lockImageView.trailingAnchor, multiplier: 1)
        ])
        
        // eyeButton
        NSLayoutConstraint.activate([
            eyeButton.centerYAnchor.constraint(equalTo: textField.centerYAnchor),
            eyeButton.leadingAnchor.constraint(equalToSystemSpacingAfter: textField.trailingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalTo: eyeButton.trailingAnchor)
        ])
        
        // dividerView
        NSLayoutConstraint.activate([
            dividerView.heightAnchor.constraint(equalToConstant: 1),
            dividerView.topAnchor.constraint(equalToSystemSpacingBelow: textField.bottomAnchor, multiplier: 1),
            dividerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            trailingAnchor.constraint(equalTo: dividerView.trailingAnchor)
        ])
        
        // errorMessageLabel
        NSLayoutConstraint.activate([
            errorMessageLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            trailingAnchor.constraint(equalTo: errorMessageLabel.trailingAnchor),
            errorMessageLabel.topAnchor.constraint(equalTo: dividerView.bottomAnchor, constant: 4)
        ])
        
        // CHCR
        lockImageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        textField.setContentHuggingPriority(.defaultLow, for: .horizontal)
        eyeButton.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    }
}

// MARK: - Actions
extension PasswordTextField {
    
    @objc func togglePasswordView(sender: UIButton) {
        
        print("toggle called")
        eyeButton.isSelected.toggle()
        textField.isSecureTextEntry.toggle()
    }
}
