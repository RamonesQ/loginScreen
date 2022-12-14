//
//  SportView.swift
//  LoginScreenViewCode
//
//  Created by Ramon Queiroz dos Santos on 24/10/22.
//

import UIKit

class SportView: UIView {

	lazy var collectionView: UICollectionView = {
		let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		collectionView.showsHorizontalScrollIndicator = false
		collectionView.backgroundColor = .clear
		collectionView.delaysContentTouches = false
		collectionView.register(SportCollectionViewCell.self, forCellWithReuseIdentifier: SportCollectionViewCell.identifier)
		let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
		layout.scrollDirection = .horizontal
		collectionView.setCollectionViewLayout(layout, animated: false)
		return collectionView
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		configSuperView()
		setupConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	public func configProtocolsCollectionView(delegate: UICollectionViewDelegate, dataSource:UICollectionViewDataSource){
		collectionView.delegate = delegate
		collectionView.dataSource = dataSource
	}
	
	func configSuperView(){
		addSubview(collectionView)
	}
	
	func setupConstraints(){
		NSLayoutConstraint.activate([
			collectionView.topAnchor.constraint(equalTo: topAnchor),
			collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
			collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
			collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
		])
	}
	
}
