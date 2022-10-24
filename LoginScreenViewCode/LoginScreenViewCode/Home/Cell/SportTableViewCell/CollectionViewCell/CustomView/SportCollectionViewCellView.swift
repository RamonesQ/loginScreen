//
//  SportCollectionViewCellView.swift
//  LoginScreenViewCode
//
//  Created by Ramon Queiroz dos Santos on 24/10/22.
//

import UIKit

class SportCollectionViewCellView: UIView {
	
	lazy var viewBackground:UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .green
		return view
	}()

	override init(frame: CGRect) {
		super.init(frame: frame)
		configSuperView()
		configConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func configSuperView(){
		addSubview(viewBackground)
	}
	
	func configConstraints(){
		NSLayoutConstraint.activate([
			viewBackground.topAnchor.constraint(equalTo: topAnchor),
			viewBackground.leadingAnchor.constraint(equalTo: leadingAnchor),
			viewBackground.trailingAnchor.constraint(equalTo: trailingAnchor),
			viewBackground.bottomAnchor.constraint(equalTo: bottomAnchor),
		])
	}
	
}
