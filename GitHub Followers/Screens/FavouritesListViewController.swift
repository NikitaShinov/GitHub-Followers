//
//  FavouritesListViewController.swift
//  GitHub Followers
//
//  Created by max on 09.02.2022.
//

import UIKit

class FavouritesListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBlue
        
        PersistenceManager.retrieveFavourites { result in
            switch result {
            case .success(let favorites):
                print (favorites)
            case .failure(let error):
                break
            }
        }
    }
}
