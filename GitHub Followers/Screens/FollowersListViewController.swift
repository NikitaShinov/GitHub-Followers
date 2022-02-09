//
//  FollowersListViewController.swift
//  GitHub Followers
//
//  Created by max on 09.02.2022.
//

import UIKit

class FollowersListViewController: UIViewController {
    
    var userName: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true

    }

}
