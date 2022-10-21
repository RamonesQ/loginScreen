//
//  SnapLoginView.swift
//  LoginScreenViewCode
//
//  Created by Ramon Queiroz dos Santos on 21/10/22.
//

import UIKit
import SnapKit

protocol SnapLoginViewProtocol: AnyObject {
	func actionLoginButton()
	func actionRegisterButton()
}

class SnapLoginView: UIView {
	
	private weak var delegate: SnapLoginViewProtocol?
	
	func delegate(delegate:SnapLoginViewProtocol?){
		self.delegate = delegate
	}

	lazy var loginLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = .white
		label.font = UIFont.boldSystemFont(ofSize: 40)
		label.text = "Login"
		return label
	}()
	
	lazy var logoAppImageView:UIImageView = {
		let image = UIImageView()
		image.translatesAutoresizingMaskIntoConstraints = false
		image.image = UIImage(named: "logo")
		image.tintColor = .green
		image.contentMode = .scaleAspectFit
		return image
	}()
	
	lazy var emailTextField: UITextField = {
		let textField = UITextField()
		textField.translatesAutoresizingMaskIntoConstraints = false
		textField.autocorrectionType = .no
		textField.backgroundColor = .white
		textField.borderStyle = .roundedRect
		textField.keyboardType = .emailAddress
		textField.placeholder = "Digite seu email: "
		textField.textColor = .darkGray
		return textField
	}()
	
	lazy var passwordTextField: UITextField = {
		let textField = UITextField()
		textField.translatesAutoresizingMaskIntoConstraints = false
		textField.autocorrectionType = .no
		textField.backgroundColor = .white
		textField.borderStyle = .roundedRect
		textField.keyboardType = .default
		textField.isSecureTextEntry = true
		textField.placeholder = "Digite sua senha: "
		textField.textColor = .darkGray
		return textField
	}()
	
	lazy var loginButton: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setTitle("Logar", for: .normal)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
		button.setTitleColor(.lightGray, for: .normal)
		button.clipsToBounds = true
		button.layer.cornerRadius = 7.5
		button.backgroundColor = UIColor(red: 3/255, green: 58/255, blue: 51/255, alpha: 1.0)
		button.addTarget(self, action: #selector(self.tappedLoginButton), for: .touchUpInside)
		return button
	}()
	
	lazy var registerButton: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setTitle("Cadastre-se", for: .normal)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
		button.setTitleColor(.white, for: .normal)
		button.addTarget(self, action: #selector(self.tappedRegisterButton), for: .touchUpInside)
		return button
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		configBackground()
		configSuperView()
		configloginLabelConstarint()
		configLogoAppImageViewConstarint()
		configEmailTextFieldConstarint()
		configPasswordTextFieldConstarint()
		configLoginButtonConstarint()
		configRegisterButtonConstarint()
	}
	
	private func configBackground(){
		backgroundColor = UIColor(red: 24/255, green: 177/255, blue: 104/255, alpha: 1.0)
	}
	
	private func configSuperView(){
		addSubview(loginLabel)
		addSubview(logoAppImageView)
		addSubview(emailTextField)
		addSubview(passwordTextField)
		addSubview(loginButton)
		addSubview(registerButton)
	}
	
	public func configTextFieldDelegate(delegate: UITextFieldDelegate){
		emailTextField.delegate = delegate
		passwordTextField.delegate = delegate
	}
	
	@objc private func tappedLoginButton(){
		self.delegate?.actionLoginButton()
	}
	@objc private func tappedRegisterButton(){
		self.delegate?.actionRegisterButton()
	}
	
	public func validaTextFields(){
		guard let email: String = emailTextField.text else {return}
		guard let password: String = passwordTextField.text else {return}
		
		if !email.isEmpty && !password.isEmpty{
			configButtonEnable(true)
		} else {
			configButtonEnable(false)
		}
	}
	
	private func configButtonEnable(_ enable: Bool){
		if enable{
			loginButton.setTitleColor(.white, for: .normal)
			loginButton.isEnabled = true
		} else {
			loginButton.setTitleColor(.lightGray, for: .normal)
			loginButton.isEnabled = false
		}
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
		
	func configloginLabelConstarint(){
		loginLabel.snp.makeConstraints { (make) in
			make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(20)
			make.centerX.equalToSuperview()
		}
	}
	func configLogoAppImageViewConstarint(){
		logoAppImageView.snp.makeConstraints { (make) in
			make.top.equalTo(loginLabel.snp.bottom).offset(30)
			make.left.equalTo(safeAreaLayoutGuide.snp.left).offset(80)
			make.right.equalTo(safeAreaLayoutGuide.snp.right).inset(80)
			make.height.equalTo(100)
		}
	}
	func configEmailTextFieldConstarint(){
		emailTextField.snp.makeConstraints { make in
			make.top.equalTo(logoAppImageView.snp.bottom).offset(40)
			make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(30)
			make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).inset(30)
			make.height.equalTo(45)
		}
	}
	func configPasswordTextFieldConstarint(){
		passwordTextField.snp.makeConstraints { make in
			make.top.equalTo(emailTextField.snp.bottom).offset(15)
			make.leading.equalTo(emailTextField.snp.leading)
			make.trailing.equalTo(emailTextField.snp.trailing)
			make.height.equalTo(emailTextField.snp.height)
		}
	}
	func configLoginButtonConstarint(){
		loginButton.snp.makeConstraints { make in
			make.top.equalTo(passwordTextField.snp.bottom).offset(40)
			make.leading.equalTo(logoAppImageView.snp.leading)
			make.trailing.equalTo(logoAppImageView.snp.trailing)
			make.height.equalTo(60)
		}
	}
	func configRegisterButtonConstarint(){
		registerButton.snp.makeConstraints { make in
			make.top.equalTo(loginButton.snp.bottom).offset(40)
			make.leading.equalTo(logoAppImageView.snp.leading)
			make.trailing.equalTo(logoAppImageView.snp.trailing)
			make.height.equalTo(20)
		}
	}
}
