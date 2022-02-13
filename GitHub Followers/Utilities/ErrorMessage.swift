//
//  ErrorMessage.swift
//  GitHub Followers
//
//  Created by max on 09.02.2022.
//

import Foundation

enum GFError: String, Error {
    case invalidUsername = "This username created an invalid request. Please try again."
    case unableToComplete = "Unable to complete request. Please check your internet connection."
    case invalidResponse = "Invalid response from a server"
    case invalidData = "The data received in invalid"
    case unableToFavourite = "There was a error trying to favourite this user. Please try again."
    case alreadyInFavourites = "You've already favorited this user."
}
