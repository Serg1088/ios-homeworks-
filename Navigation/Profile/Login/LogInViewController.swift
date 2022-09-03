//
//  LogInViewController.swift
//  Navigation
//
//  Created by Сергей Белкин on 14.06.2022.
//

import UIKit
final class LoginViewController: UIViewController {
    
    private let currentUserService = CurrentUserService ()
    private let testUserService = TestUserService ()
    
    private let loginView: UIView = {
        let loginView = UIView()
        return loginView
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
        
    }()

    private lazy var logoImageView: UIImageView = {
        var logo = UIImageView()
        logo.image = UIImage(named: "LogoVK")
        logo.clipsToBounds = true
        return logo
    }()
    
    private lazy var loginTextField: UITextField = {
           
        var login = UITextField()
        login.placeholder = "Email or phone"
        login.tintColor = .lightGray
        login.textColor = .black
        login.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 0))
        login.leftViewMode = .always
        login.font = UIFont.systemFont(ofSize: 16)
        login.keyboardType = .phonePad
        login.clearButtonMode = .whileEditing
        return login
    }()
    private lazy var passwordTextField: UITextField = {
           
        var password = UITextField()
        password.placeholder = "Password"
        password.tintColor = .lightGray
        password.textColor = .black
        password.layer.borderWidth = 0.5
        password.layer.borderColor = UIColor.lightGray.cgColor
        password.isSecureTextEntry = true
        password.autocapitalizationType = .none
        password.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 0))
        password.leftViewMode = .always
        password.font = UIFont.systemFont(ofSize: 16)
        return password
    }()
    
    private lazy var stackLoginPassword: UIStackView = {
        var stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.clipsToBounds = true
        stack.backgroundColor = .systemGray6
        stack.layer.cornerRadius = 10
        stack.layer.borderWidth = 0.5
        stack.layer.borderColor = UIColor.lightGray.cgColor
        return stack
    }()
    
    var LogInButton: UIButton = {
        
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.sizeToFit()
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
        
    }()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
        
        addContent()
        addConstrains()
        setupGestures()
    
    }
    
    private func addContent () {
        view.addSubview(scrollView)
        scrollView.addSubview(loginView)
        [logoImageView, stackLoginPassword, LogInButton].forEach { loginView.addSubview($0) }
        [loginTextField, passwordTextField].forEach { stackLoginPassword.addArrangedSubview($0) }
        [LogInButton,stackLoginPassword, passwordTextField, loginTextField, logoImageView, scrollView, loginView].forEach{ $0.translatesAutoresizingMaskIntoConstraints = false}
    }
    private func addConstrains() {
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: loginView.centerXAnchor, constant: 0),
            logoImageView.topAnchor.constraint(equalTo: loginView.safeAreaLayoutGuide.topAnchor, constant: 120),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            
            stackLoginPassword.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 120),
            stackLoginPassword.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 16),
            stackLoginPassword.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -16),
            stackLoginPassword.heightAnchor.constraint(equalToConstant: 100),
            
            LogInButton.topAnchor.constraint(equalTo: stackLoginPassword.bottomAnchor, constant: 16),
            LogInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -16),
            LogInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 16),
            LogInButton.bottomAnchor.constraint(equalTo: loginView.bottomAnchor),
            LogInButton.heightAnchor.constraint(equalToConstant: 50),
            
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            loginView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            loginView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            loginView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            loginView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            loginView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])
    }

    
    @objc private func buttonAction() {
#if DEBUG
        let user = testUserService.userTest
#else
        let user = currentUserService.userLogin
#endif
        guard loginTextField.text == user.login, passwordTextField.text == user.password else {
            print ("Не верный логин или пароль")
            return
        }
        let profileViewController = ProfileViewController(user: user)
        self.navigationController?.pushViewController(profileViewController, animated: true)
    }
    
    @objc func forcedHidingKeyboard() {
        view.endEditing(true)
    }
    
    
    private func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.forcedHidingKeyboard))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    private let notificationCenter = NotificationCenter.default

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        notificationCenter.addObserver(self,
                                       selector: #selector(openKeyboard),
                                       name: UIResponder.keyboardWillShowNotification,
                                       object: nil)
        notificationCenter.addObserver(self,
                                       selector: #selector(clearKeyboard),
                                       name: UIResponder.keyboardWillHideNotification,
                                       object: nil)
    }

    @objc private func openKeyboard (notification: NSNotification) {
        
        if let keyboard = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = keyboard.height + 16
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboard.height, right: 0)
            
        }
    }
    
    @objc private func clearKeyboard () {
        
        scrollView.contentInset = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
        
    }
    
}

public extension UIView {

    func toAutoLayout() {
        translatesAutoresizingMaskIntoConstraints = false
    }

    func addSubviews(_ subviews: UIView...) {
        subviews.forEach {addSubview($0) }
    }
}

