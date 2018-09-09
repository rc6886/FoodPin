//
//  RestaurantFactory.swift
//  FoodPin
//
//  Created by admin on 9/9/18.
//  Copyright © 2018 rc6886. All rights reserved.
//

import Foundation

class RestaurantFactory {
    static func getRestaurants() -> [Restaurant] {
        return [
            Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "Hong Kong", image: "cafedeadend", isVisited: false),
            Restaurant(name: "Homei", type: "Cafe", location: "Hong Kong", image: "homei", isVisited: false),
            Restaurant(name: "Teakha", type: "Tea House", location: "Hong Kong", image: "teakha", isVisited: false),
            Restaurant(name: "Cafe loisl", type: "Austrian / Causual Drink", location: "Hong Kong", image: "cafeloisl", isVisited: false),
            Restaurant(name: "Petite Oyster", type: "French", location: "Hong Kong", image: "petiteoyster", isVisited: false),
            Restaurant(name: "For Kee Restaurant", type: "Bakery", location: "Hong Kong", image: "forkeerestaurant", isVisited: false),
            Restaurant(name: "Po's Atelier", type: "Bakery", location: "Hong Kong", image: "posatelier", isVisited: false),
            Restaurant(name: "Bourke Street Backery", type: "Chocolate", location: "Sydney", image: "bourkestreetbakery", isVisited: false),
            Restaurant(name: "Haigh's Chocolate", type: "Cafe", location: "Sydney", image: "haighschocolate", isVisited: false),
            Restaurant(name: "Palomino Espresso", type: "American / Seafood", location: "Sydney", image: "palominoespresso", isVisited: false),
            Restaurant(name: "Upstate", type: "American", location: "New York", image: "upstate", isVisited: false),
            Restaurant(name: "Traif", type: "American", location: "New York", image: "traif", isVisited: false),
            Restaurant(name: "Graham Avenue Meats", type: "Breakfast & Brunch", location: "New York", image: "grahamavenuemeats", isVisited: false),
            Restaurant(name: "Waffle & Wolf", type: "Coffee & Tea", location: "New York", image: "wafflewolf", isVisited: false),
            Restaurant(name: "Five Leaves", type: "Coffee & Tea", location: "New York", image: "fiveleaves", isVisited: false),
            Restaurant(name: "Cafe Lore", type: "Latin American", location: "New York", image: "cafelore", isVisited: false),
            Restaurant(name: "Confessional", type: "Spanish", location: "New York", image: "confessional", isVisited: false),
            Restaurant(name: "Barrafina", type: "Spanish", location: "London", image: "barrafina", isVisited: false),
            Restaurant(name: "Donostia", type: "Spanish", location: "London", image: "donostia", isVisited: false),
            Restaurant(name: "Royal Oak", type: "British", location: "London", image: "royaloak", isVisited: false),
            Restaurant(name: "CASK Pub and Kitchen", type: "Thai", location: "London", image: "caskpubkitchen", isVisited: false)
        ]
    }
}
