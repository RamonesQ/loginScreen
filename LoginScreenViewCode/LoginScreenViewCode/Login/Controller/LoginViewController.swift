//
//  ViewController.swift
//  LoginScreenViewCode
//
//  Created by Ramon Queiroz dos Santos on 20/10/22.
//

import UIKit

class LoginViewController: UIViewController {
	
	
	var snapLoginView: SnapLoginView?
	
	override func loadView() {
		snapLoginView = SnapLoginView()
		view = snapLoginView
		navigationController?.isNavigationBarHidden = true
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		snapLoginView?.delegate(delegate: self)
		snapLoginView?.configTextFieldDelegate(delegate: self)
	}
}

extension LoginViewController: UITextFieldDelegate {
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
	}
	
	func textFieldDidEndEditing(_ textField: UITextField) {
		snapLoginView?.validaTextFields()
	}
}

extension LoginViewController: SnapLoginViewProtocol {
	func actionLoginButton() {
		
	}
	
	func actionRegisterButton() {
		navigationController?.pushViewController(RegisterViewController(), animated: true)
	}
}
