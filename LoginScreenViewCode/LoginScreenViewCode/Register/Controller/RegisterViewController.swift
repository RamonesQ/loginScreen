//
//  RegisterViewController.swift
//  LoginScreenViewCode
//
//  Created by Ramon Queiroz dos Santos on 21/10/22.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {
	
	var registerView: SnapRegisterView?
	
	var auth: Auth?
	
	override func loadView() {
		registerView = SnapRegisterView()
		view = registerView
		navigationController?.isNavigationBarHidden = true
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		registerView?.delegate(delegate: self)
		registerView?.configTextFieldDelegate(delegate: self)
		auth = Auth.auth()
	}
}

extension RegisterViewController: UITextFieldDelegate{
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
	}
}

extension RegisterViewController: SnapRegisterViewProtocol{
	
	func actionBackButton() {
		navigationController?.popViewController(animated: true)
	}

	func textFieldDidEndEditing(_ textField: UITextField) {
		registerView?.validaTextFields()
	}
	
	func actionRegisterButton() {
		
		guard let email = registerView?.emailTextField.text else {return}
		guard let password = registerView?.passwordTextField.text else {return}
		
		auth?.createUser(withEmail: email, password: password, completion: { (result, error) in
			if error != nil {
				print("\(String(describing: error))")
			} else {
				print("\(email) Cadastrado")
				self.navigationController?.popViewController(animated: true)
			}
		})
	}
}
