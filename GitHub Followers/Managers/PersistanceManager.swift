//
//  PersistanceManager.swift
//  GitHub Followers
//
//  Created by max on 14.02.2022.
//

import Foundation

enum PersistenceActionType {
    case add, remove
}

enum PersistenceManager {
    static private let defaults = UserDefaults.standard
    
    enum Keys {
        static let favourites = "favourites"
    }
    
    static func updateWith(favorite: Follower,
                           actionType: PersistenceActionType,
                           completion: @escaping (GFError?) -> Void) {
        
        retrieveFavourites { result in
            switch result {
            case .success(let favorites):
                var retrievedFavorites = favorites
                
                switch actionType {
                case .add:
                    guard !retrievedFavorites.contains(favorite) else {
                        completion(.alreadyInFavourites)
                        return
                    }
                    retrievedFavorites.append(favorite)
                case .remove:
                    retrievedFavorites.removeAll { $0.login == favorite.login }
                }
                
                completion(save(favourites: favorites))
                
            case .failure(let error):
                completion(error)
            }
        }
        
    }
    
    
    
    static func retrieveFavourites(completion: @escaping (Result<[Follower], GFError>) -> Void) {
        guard let favouritesData = defaults.object(forKey: Keys.favourites) as? Data else {
            completion(.success([]))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let favourites = try decoder.decode([Follower].self, from: favouritesData)
            completion(.success(favourites))
        } catch {
            completion(.failure(.unableToFavourite))
        }
    }
    
    static func save(favourites: [Follower]) -> GFError? {
        do {
            let encoder = JSONEncoder()
            let encodedFavorites = try encoder.encode(favourites)
            defaults.set(encodedFavorites, forKey: Keys.favourites)
            return nil
        } catch {
            return .unableToFavourite
        }
    }
}
