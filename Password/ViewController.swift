//
//  ViewController.swift
//  Password
//
//  Created by Todd Smith on 4/2/25.
//

import UIKit

class ViewController: UIViewController {
    
    let stackView = UIStackView()
    let newPasswordTextField = PasswordTextField(placeHolderText: "New Password")
    let passwordStatusView = PasswordStatusView()
    let confirmNewPasswordTexTField = PasswordTextField(placeHolderText: "Re-Enter New Password")
    let resetPasswordButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
    
}

extension ViewController {
    
    private func style() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
                
        newPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        passwordStatusView.translatesAutoresizingMaskIntoConstraints = false
        passwordStatusView.layer.cornerRadius = 8
        passwordStatusView.clipsToBounds = true
        
        confirmNewPasswordTexTField.translatesAutoresizingMaskIntoConstraints = false
        
        resetPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        resetPasswordButton.setTitle("Reset Password", for: [])
        resetPasswordButton.configuration = .filled()
//        resetPasswordButton.addTarget(self, action: #selector(resetPasswordButtonTapped), for: .primaryActionTriggered)
    }
    
    private func layout() {
        stackView.addArrangedSubview(newPasswordTextField)
        stackView.addArrangedSubview(passwordStatusView)
        stackView.addArrangedSubview(confirmNewPasswordTexTField)
        stackView.addArrangedSubview(resetPasswordButton)
        
        view.addSubview(stackView)
        
        
        // stackView
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 2)
        ])
        
    }
    
}



