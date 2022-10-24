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
	var alert: Alert?
	
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
		alert = Alert(controller: self)
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
				self.alert?.getAlert(titulo: "Atenção", mensagem: "Dados incorretos \(String(describing: error))")
			} else {
				if usuario == nil {
					self.alert?.getAlert(titulo: "Atenção", mensagem: "Tivemos um erro, tente mais tarde")
				} else {
					self.alert?.getAlert(titulo: "Parabéns", mensagem: "Usuário logado com sucesso")
				}
			}
		})
	}
	
	func actionRegisterButton() {
		navigationController?.pushViewController(RegisterViewController(), animated: true)
	}
}
