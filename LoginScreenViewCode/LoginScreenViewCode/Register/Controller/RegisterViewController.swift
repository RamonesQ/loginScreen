//
//  RegisterViewController.swift
//  LoginScreenViewCode
//
//  Created by Ramon Queiroz dos Santos on 21/10/22.
//

import UIKit

class RegisterViewController: UIViewController {
	
	var registerView: SnapRegisterView?
	
	override func loadView() {
		registerView = SnapRegisterView()
		view = registerView
		navigationController?.isNavigationBarHidden = true
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		registerView?.delegate(delegate: self)
		registerView?.configTextFieldDelegate(delegate: self)
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
		navigationController?.popViewController(animated: true)
	}
}
