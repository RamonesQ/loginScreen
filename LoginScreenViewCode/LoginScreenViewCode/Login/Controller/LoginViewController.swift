//
//  ViewController.swift
//  LoginScreenViewCode
//
//  Created by Ramon Queiroz dos Santos on 20/10/22.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
	
	
	var snapLoginView: SnapLoginView?
	var auth: Auth?
	
	override func loadView() {
		snapLoginView = SnapLoginView()
		view = snapLoginView
		navigationController?.isNavigationBarHidden = true
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		auth = Auth.auth()
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
		// guard let login = snapLoginView else {return}
		guard let email = snapLoginView?.emailTextField.text else {return}
		guard let password = snapLoginView?.passwordTextField.text else {return}
		
		auth?.signIn(withEmail: email, password: password, completion: { (usuario, error) in
			if error != nil {
				print("\(String(describing: error))")
			} else {
				if usuario == nil {
					print("Tivemos um erro, tente mais tarde")
				} else {
					print("Usuario logado")
				}
			}
		})
	}
	
	func actionRegisterButton() {
		navigationController?.pushViewController(RegisterViewController(), animated: true)
	}
}
