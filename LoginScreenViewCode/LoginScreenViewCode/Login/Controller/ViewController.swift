//
//  ViewController.swift
//  LoginScreenViewCode
//
//  Created by Ramon Queiroz dos Santos on 20/10/22.
//

import UIKit

class ViewController: UIViewController {
	
	
	var loginView: LoginView?
	
	override func loadView() {
		loginView = LoginView()
		view = loginView
	}
		
	override func viewDidLoad() {
		super.viewDidLoad()
		loginView?.delegate(delegate: self)
		loginView?.configTextFieldDelegate(delegate: self)
	}
}

extension ViewController: UITextFieldDelegate {
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
	}
}

extension ViewController: LoginViewProtocol {
	func actionLoginButton() {
		
	}
	
	func actionRegisterButton() {
		
	}
}
