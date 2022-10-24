//
//  Alert.swift
//  LoginScreenViewCode
//
//  Created by Ramon Queiroz dos Santos on 24/10/22.
//

import Foundation
import UIKit

class Alert:NSObject{
	
	var controller: UIViewController
	
	init(controller: UIViewController) {
		self.controller = controller
	}
	
	func getAlert(titulo:String, mensagem:String, completion:(() -> Void)? = nil){
		let alertController = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
		let cancel = UIAlertAction(title: "OK", style: .cancel) { action in
			completion?()
		}
		alertController.addAction(cancel)
		self.controller.present(alertController, animated: true, completion: nil)
	}
}
