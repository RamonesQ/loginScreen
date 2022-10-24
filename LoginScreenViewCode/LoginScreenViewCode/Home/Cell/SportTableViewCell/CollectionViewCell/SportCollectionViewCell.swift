//
//  SportCollectionViewCell.swift
//  LoginScreenViewCode
//
//  Created by Ramon Queiroz dos Santos on 24/10/22.
//

import UIKit

class SportCollectionViewCell: UICollectionViewCell {
	
	static let identifier: String = "SportCollectionViewCell"
	
	let sportCollectionViewCellView: SportCollectionViewCellView = SportCollectionViewCellView()
    
	override init(frame: CGRect) {
		super.init(frame: frame)
		configSuperView()
		setupConstraint()
	}
	
	public func	setupCell(data: DataSport){
		sportCollectionViewCellView.imageView.image = UIImage(named: data.imageName)
		sportCollectionViewCellView.sportName.text = data.name
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func configSuperView(){
		sportCollectionViewCellView.layer.borderWidth = 6.0
		sportCollectionViewCellView.layer.borderColor = UIColor.blue.cgColor
		sportCollectionViewCellView.translatesAutoresizingMaskIntoConstraints = false
		contentView.addSubview(sportCollectionViewCellView)
	}
	
	func setupConstraint(){
		NSLayoutConstraint.activate([
			sportCollectionViewCellView.topAnchor.constraint(equalTo: topAnchor),
			sportCollectionViewCellView.leadingAnchor.constraint(equalTo: leadingAnchor),
			sportCollectionViewCellView.trailingAnchor.constraint(equalTo: trailingAnchor),
			sportCollectionViewCellView.bottomAnchor.constraint(equalTo: bottomAnchor),
		])
	}
}
