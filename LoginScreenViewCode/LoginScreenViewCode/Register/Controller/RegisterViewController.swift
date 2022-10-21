//
//  RegisterViewController.swift
//  LoginScreenViewCode
//
//  Created by Ramon Queiroz dos Santos on 21/10/22.
//

import UIKit

class RegisterViewController: UIViewController {
	
	var registerView: RegisterView?
	
	override func loadView() {
		registerView = RegisterView()
		view = registerView
		navigationController?.isNavigationBarHidden = true
	}

    override func viewDidLoad() {
        super.viewDidLoad()
    }


}
