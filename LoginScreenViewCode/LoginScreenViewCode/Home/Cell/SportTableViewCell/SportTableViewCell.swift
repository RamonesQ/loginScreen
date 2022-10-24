//
//  SportTableViewCell.swift
//  LoginScreenViewCode
//
//  Created by Ramon Queiroz dos Santos on 24/10/22.
//

import UIKit

class SportTableViewCell: UITableViewCell{

	
	var sportView: SportView = SportView()
	var data:[DataSport] = []
	
	static let identifier: String = "SportTableViewCell"

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		configSuperView()
		setupConstraints()
		sportView.configProtocolsCollectionView(delegate: self, dataSource: self)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func configSuperView(){
		sportView.translatesAutoresizingMaskIntoConstraints = false
		contentView.addSubview(sportView)
	}
	
	public func dataCollection(data:[DataSport]){
		self.data = data
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

extension SportTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return self.data.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		let cell:SportCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: SportCollectionViewCell.identifier, for: indexPath) as? SportCollectionViewCell
		cell?.setupCell(data: data[indexPath.row])
		return cell ?? UICollectionViewCell()
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: 140, height: 80)
	}
	
}
