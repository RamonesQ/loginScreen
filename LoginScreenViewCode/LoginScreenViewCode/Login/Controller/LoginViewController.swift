//
//  ViewController.swift
//  LoginScreenViewCode
//
//  Created by Ramon Queiroz dos Santos on 20/10/22.
//

import UIKit

class LoginViewController: UIViewController {
	
	
	var loginView: LoginView?
	
	override func loadView() {
		loginView = LoginView()
		view = loginView
		navigationController?.isNavigationBarHidden = true
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		loginView?.delegate(delegate: self)
		loginView?.configTextFieldDelegate(delegate: self)
	}
}

extension LoginViewController: UITextFieldDelegate {
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
	}
}

extension LoginViewController: LoginViewProtocol {
	func actionLoginButton() {
		
	}
	
	func actionRegisterButton() {
		navigationController?.pushViewController(RegisterViewController(), animated: true)
	}
}
