//
//  SnapRegisterView.swift
//  LoginScreenViewCode
//
//  Created by Ramon Queiroz dos Santos on 21/10/22.
//

import UIKit
import SnapKit

protocol SnapRegisterViewProtocol: AnyObject{
	func actionBackButton()
	func actionRegisterButton()
}

class SnapRegisterView: UIView {
	
	private weak var delegate: SnapRegisterViewProtocol?
	
	func delegate(delegate: SnapRegisterViewProtocol?){
		self.delegate = delegate
	}
	
	lazy var backButton: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setImage(UIImage(named: "back"), for: .normal)
		button.addTarget(self, action: #selector(self.tappedBackButton), for: .touchUpInside)
		return button
	}()
	
	lazy var imageAddUser:UIImageView = {
		let image = UIImageView()
		image.translatesAutoresizingMaskIntoConstraints = false
		image.image = UIImage(named: "usuario")
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
	
	lazy var registerButton: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setTitle("Cadastrar", for: .normal)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
		button.setTitleColor(.lightGray, for: .normal)
		button.clipsToBounds = true
		button.layer.cornerRadius = 7.5
		button.backgroundColor = UIColor(red: 3/255, green: 58/255, blue: 51/255, alpha: 1.0)
		button.isEnabled = false
		button.addTarget(self, action: #selector(self.tappedRegisterButton), for: .touchUpInside)
		return button
	}()

	override init(frame: CGRect) {
		super.init(frame: frame)
		configBackground()
		configSuperView()
		configImageAddUserConstarint()
		configBackButtonConstraint()
		configEmailTextFieldConstarint()
		configPasswordTextFieldConstarint()
		configRegisterButtonConstarint()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func configBackground(){
		backgroundColor = UIColor(red: 24/255, green: 177/255, blue: 104/255, alpha: 1.0)
	}
	
	private func configSuperView(){
		addSubview(backButton)
		addSubview(imageAddUser)
		addSubview(emailTextField)
		addSubview(passwordTextField)
		addSubview(registerButton)
	}
	
	public func configTextFieldDelegate(delegate: UITextFieldDelegate){
		emailTextField.delegate = delegate
		passwordTextField.delegate = delegate
	}
	
	@objc private func tappedBackButton(){
		self.delegate?.actionBackButton()
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
			registerButton.setTitleColor(.white, for: .normal)
			registerButton.isEnabled = true
		} else {
			registerButton.setTitleColor(.lightGray, for: .normal)
			registerButton.isEnabled = false
		}
	}

	func configImageAddUserConstarint(){
		imageAddUser.snp.makeConstraints { make in
			make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(20)
			make.centerX.equalToSuperview()
			make.width.height.equalTo(150)
		}
	}
	
	func configBackButtonConstraint(){
		backButton.snp.makeConstraints { make in
			make.top.equalTo(imageAddUser.snp.top)
			make.left.equalTo(safeAreaLayoutGuide.snp.left).offset(20)
		}
	}
	
	func configEmailTextFieldConstarint(){
		emailTextField.snp.makeConstraints { make in
			make.top.equalTo(imageAddUser.snp.bottom).offset(40)
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
	
	func configRegisterButtonConstarint(){
		registerButton.snp.makeConstraints { make in
			make.top.equalTo(passwordTextField.snp.bottom).offset(40)
			make.leading.equalTo(imageAddUser.snp.leading)
			make.trailing.equalTo(imageAddUser.snp.trailing)
			make.height.equalTo(60)
		}
	}
}
