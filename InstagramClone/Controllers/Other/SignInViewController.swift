//
//  SignInViewController.swift
//  InstagramClone
//
//  Created by Morgan Duverney on 6/4/21.
//

import SafariServices
import UIKit

class SignInViewController: UIViewController, UITextFieldDelegate {
    
    private let headerView = SignInHeaderView()
    
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
        field.placeholder = "Password"
        field.keyboardType = .default
        field.isSecureTextEntry = true
        field.returnKeyType = .continue
        field.autocorrectionType = .no
        return field
    }()
    
    private let signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign In", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        return button
    }()
    
    private let createAccountButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.link, for: .normal)
        button.setTitle("Create Account", for: .normal)
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
        title = "Sign In"
        view.backgroundColor = .systemBackground
        addSubviews()
        
        emailField.delegate = self
        passwordField.delegate = self
        addButtonActions()
    }
    
    private func addSubviews() {
        view.addSubview(headerView)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(signInButton)
        view.addSubview(createAccountButton)
        view.addSubview(termsOfServiceButton)
        view.addSubview(privacyPolicyButton)
    }
    
    // TODO: Use constraints instead of frames
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        headerView.frame = CGRect(x:0, y:view.safeAreaInsets.top, width: view.width, height: (view.height - view.safeAreaInsets.top)/3)
        emailField.frame = CGRect(x: 25, y: headerView.bottom+20, width: view.width-50, height: 50)
        passwordField.frame = CGRect(x: 25, y: emailField.bottom+20, width: view.width-50, height: 50)
        signInButton.frame = CGRect(x: 45, y: passwordField.bottom+20, width: view.width-90, height: 50)
        createAccountButton.frame = CGRect(x: 45, y: signInButton.bottom+10, width: view.width-90, height: 50)
        termsOfServiceButton.frame = CGRect(x: 45, y: createAccountButton.bottom+40, width: view.width-90, height: 50)
        privacyPolicyButton.frame = CGRect(x: 45, y: termsOfServiceButton.bottom+5, width: view.width-90, height: 50)
    }
    
    private func addButtonActions() {
        signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
        createAccountButton.addTarget(self, action: #selector(didTapCreateAccount), for: .touchUpInside)
        termsOfServiceButton.addTarget(self, action: #selector(didTapTermsOfService), for: .touchUpInside)
        privacyPolicyButton.addTarget(self, action: #selector(didTapPrivacyPolicy), for: .touchUpInside)
    }
    
    // MARK: - Actions -
    
    @objc func didTapSignIn() {
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        signIn()
    }
    
    @objc func didTapCreateAccount() {
        let vc = CreateAccountViewController()
        vc.completion = { [weak self] in
            DispatchQueue.main.async {
                let tabVC = TabBarController()
                tabVC.modalPresentationStyle = .fullScreen
                self?.present(tabVC, animated: true)
            }
        }
        navigationController?.pushViewController(vc, animated: true)
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
    
    private func signIn() {
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
        if textField == emailField {
            passwordField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        signIn()
        return true
    }
}
