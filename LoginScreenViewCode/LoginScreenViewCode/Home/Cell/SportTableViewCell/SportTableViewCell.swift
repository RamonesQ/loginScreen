//
//  SportTableViewCell.swift
//  LoginScreenViewCode
//
//  Created by Ramon Queiroz dos Santos on 24/10/22.
//

import UIKit

class SportTableViewCell: UITableViewCell {
	
	var sportView: SportView = SportView()
	
	static let identifier: String = "SportTableViewCell"

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		configSuperView()
		setupConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func configSuperView(){
		sportView.translatesAutoresizingMaskIntoConstraints = false
		contentView.addSubview(sportView)
	}
	
	func setupConstraints(){
		NSLayoutConstraint.activate([
			sportView.topAnchor.constraint(equalTo: topAnchor),
			sportView.leadingAnchor.constraint(equalTo: leadingAnchor),
			sportView.trailingAnchor.constraint(equalTo: trailingAnchor),
			sportView.bottomAnchor.constraint(equalTo: bottomAnchor)
		])
	}
	
}
