//
//  UserDetailTableViewCell.swift
//  LoginScreenViewCode
//
//  Created by Ramon Queiroz dos Santos on 24/10/22.
//

import UIKit

class UserDetailTableViewCell: UITableViewCell {
	
	static let identifier: String = "UserDetailTableViewCell"
	
	lazy var userImageView:UIImageView = {
		let image = UIImageView()
		image.translatesAutoresizingMaskIntoConstraints = false
		image.contentMode = .scaleAspectFit
		return image
	}()
	
	lazy var nameLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = .black
		return label
	}()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		configSuperView()
		setupConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func configSuperView(){
		contentView.addSubview(userImageView)
		contentView.addSubview(nameLabel)
	}
	
	public func setupCell(data: DataUser){
		nameLabel.text = data.name
		userImageView.image = UIImage(named: data.imageName)
	}
	
	private func setupConstraints() {
		NSLayoutConstraint.activate([
			userImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
			userImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
			userImageView.heightAnchor.constraint(equalToConstant: 80),
			userImageView.widthAnchor.constraint(equalToConstant: 80),
			
			nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
			nameLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 20),
			
		])
	}
	
}
