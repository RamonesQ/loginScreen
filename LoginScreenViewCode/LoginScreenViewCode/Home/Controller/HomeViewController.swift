//
//  HomeViewController.swift
//  LoginScreenViewCode
//
//  Created by Ramon Queiroz dos Santos on 24/10/22.
//

import UIKit

class HomeViewController: UIViewController {
	
	var homeView: HomeView?
	var data:[DataUser] = [DataUser(name: "Caio", imageName: "menino1"),
								  DataUser(name: "Felipe", imageName: "menino2"),
								  DataUser(name: "Gabi", imageName: "menina1"),
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
		return data.count + 1
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		if indexPath.row == 3 {
			let cell: SportTableViewCell? = (tableView.dequeueReusableCell(withIdentifier: SportTableViewCell.identifier, for: indexPath) as? SportTableViewCell)
			return cell ?? UITableViewCell()
		}
		
		let cell: UserDetailTableViewCell? = (tableView.dequeueReusableCell(withIdentifier: UserDetailTableViewCell.identifier, for: indexPath) as? UserDetailTableViewCell)
		cell?.setupCell(data: self.data[indexPath.row])
		return cell ?? UITableViewCell()
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 100
	}
}
