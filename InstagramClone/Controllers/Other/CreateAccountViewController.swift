//
//  CreateAccountSiViewController.swift
//  InstagramClone
//
//  Created by Morgan Duverney on 6/4/21.
//

import SafariServices
import UIKit

class CreateAccountViewController: UIViewController, UITextFieldDelegate {
    
    private let profilePictureImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .label
        imageView.image = UIImage(systemName: "person.circle")
        imageView.contentMode = .scaleToFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 45
        return imageView
    }()
    
    private let usernameField: CustomTextField = {
        let field = CustomTextField()
        field.placeholder = "Username"
        field.keyboardType = .default
        field.returnKeyType = .next
        field.autocorrectionType = .no
        return field
    }()
    
    private let emailField: CustomTextField = {
        let field = CustomTextField()
        field.placeholder = "Email Address"
        field.keyboardType = .emailAddress
        field.returnKeyType = .next
        field.autocorrectionType = .no
        return field
    }()
    
    private let passwordField: CustomTextField = {
        let field = CustomTextField()
        field.placeholder = "Create Password"
        field.keyboardType = .default
        field.isSecureTextEntry = true
        field.returnKeyType = .continue
        field.autocorrectionType = .no
        return field
    }()
    
    private let createAccountButton: UIButton = {
        let button = UIButton()
        button.setTitle("Create Account", for: .normal)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        return button
    }()
    
    private let termsOfServiceButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.link, for: .normal)
        button.setTitle("Terms of Service", for: .normal)
        return button
    }()
    
    private let privacyPolicyButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.link, for: .normal)
        button.setTitle("Privacy Policy", for: .normal)
        return button
    }()
    
    // MARK: - Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Create Account"
        view.backgroundColor = .systemBackground
        addSubviews()
        
        usernameField.delegate = self
        emailField.delegate = self
        passwordField.delegate = self
        addButtonActions()
    }
    
    private func addSubviews() {
        view.addSubview(profilePictureImageView)
        view.addSubview(usernameField)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(createAccountButton)
        view.addSubview(termsOfServiceButton)
        view.addSubview(privacyPolicyButton)
    }
    
    // TODO: Use constraints instead of frames
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let imageSize: CGFloat = 90
        profilePictureImageView.frame = CGRect(x:(view.width - imageSize)/2, y:view.safeAreaInsets.top + 10, width: imageSize, height: imageSize)
        usernameField.frame = CGRect(x: 25, y: profilePictureImageView.bottom+20, width: view.width-50, height: 50)
        emailField.frame = CGRect(x: 25, y: usernameField.bottom+10, width: view.width-50, height: 50)
        passwordField.frame = CGRect(x: 25, y: emailField.bottom+10, width: view.width-50, height: 50)
        createAccountButton.frame = CGRect(x: 45, y: passwordField.bottom+10, width: view.width-90, height: 50)
        termsOfServiceButton.frame = CGRect(x: 45, y: createAccountButton.bottom+40, width: view.width-90, height: 50)
        privacyPolicyButton.frame = CGRect(x: 45, y: termsOfServiceButton.bottom+5, width: view.width-90, height: 50)
    }
    
    private func addButtonActions() {
        createAccountButton.addTarget(self, action: #selector(didTapCreateAccount), for: .touchUpInside)
        termsOfServiceButton.addTarget(self, action: #selector(didTapTermsOfService), for: .touchUpInside)
        privacyPolicyButton.addTarget(self, action: #selector(didTapPrivacyPolicy), for: .touchUpInside)
    }
    
    // MARK: - Actions -
    
    @objc func didTapCreateAccount() {
        usernameField.resignFirstResponder()
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
    }
    
    @objc func didTapTermsOfService() {
        guard let url = URL(string: "https://www.facebook.com/help/instagram/termsofuse") else {return}
        let viewController = SFSafariViewController(url: url)
        present(viewController, animated: true)
    }
    
    @objc func didTapPrivacyPolicy() {
        guard let url = URL(string: "https://help.instagram.com/519522125107875") else {return}
        let viewController = SFSafariViewController(url: url)
        present(viewController, animated: true)
    }
    
    private func createAccount() {
        guard let email = emailField.text,
              let password = passwordField.text,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty,
              password.count >= 6 else {
            return
        }
        // TODO: Sign in with auth manager
    }
    
    // MARK: - Field Delegate -
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameField {
            emailField.becomeFirstResponder()
        }
        else if textField == emailField {
            passwordField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        createAccount()
        return true
    }
}
