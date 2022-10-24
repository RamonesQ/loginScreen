//
//  HomeViewController.swift
//  LoginScreenViewCode
//
//  Created by Ramon Queiroz dos Santos on 24/10/22.
//

import UIKit

class HomeViewController: UIViewController {
	
	var homeView: HomeView?
	var dataUser:[DataUser] = [DataUser(name: "Caio", imageName: "menino1"),
										DataUser(name: "Felipe", imageName: "menino2"),
										DataUser(name: "Gabi", imageName: "menina1"),
										DataUser(name: "Julia", imageName: "menina1")
	]
	var dataSport: [DataSport] = [DataSport(name: "Corrida", imageName: "corrida"),
											DataSport(name: "Ciclismo", imageName: "ciclismo"),
											DataSport(name: "Natação", imageName: "natacao"),
											DataSport(name: "Yoga", imageName: "yoga"),
											DataSport(name: "Corrida", imageName: "corrida"),
											DataSport(name: "Ciclismo", imageName: "ciclismo"),
											DataSport(name: "Natação", imageName: "natacao"),
											DataSport(name: "Yoga", imageName: "yoga")
	]
	
	override func loadView() {
		homeView = HomeView()
		view = homeView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		homeView?.configTableViewProtocols(delagate: self, dataSource: self)
	}
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return dataUser.count + 1
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		if indexPath.row == dataUser.count {
			let cell: SportTableViewCell? = (tableView.dequeueReusableCell(withIdentifier: SportTableViewCell.identifier, for: indexPath) as? SportTableViewCell)
			cell?.dataCollection(data: self.dataSport)
			return cell ?? UITableViewCell()
		}
		
		let cell: UserDetailTableViewCell? = (tableView.dequeueReusableCell(withIdentifier: UserDetailTableViewCell.identifier, for: indexPath) as? UserDetailTableViewCell)
		cell?.setupCell(data: self.dataUser[indexPath.row])
		return cell ?? UITableViewCell()
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 100
	}
}
