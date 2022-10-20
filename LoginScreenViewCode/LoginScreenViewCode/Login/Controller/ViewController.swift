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
	}
}

