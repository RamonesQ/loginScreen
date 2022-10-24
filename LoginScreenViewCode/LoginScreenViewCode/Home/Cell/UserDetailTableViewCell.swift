//
//  UserDetailTableViewCell.swift
//  LoginScreenViewCode
//
//  Created by Ramon Queiroz dos Santos on 24/10/22.
//

import UIKit
import SnapKit

class UserDetailTableViewCell: UITableViewCell {
	
	static let identifier: String = "UserDetailTableViewCell"
	
	lazy var userDetailView:UserDetailView = {
		let view = UserDetailView()
		return view
	}()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		configSuperView()
		ConfigConstraintsDescriptionCell()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func configSuperView(){
		contentView.addSubview(userDetailView)
	}
	
	public func setupCell(data: DataUser){
		userDetailView.nameLabel.text = data.name
		userDetailView.userImageView.image = UIImage(named: data.imageName)
	}
	
	private func ConfigConstraintsDescriptionCell(){
		userDetailView.snp.makeConstraints { make in
			make.edges.equalToSuperview()
		}
	}

}
