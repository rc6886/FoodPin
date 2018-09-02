//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by admin on 8/29/18.
//  Copyright © 2018 rc6886. All rights reserved.
//

import Foundation
import UIKit

class RestaurantTableViewController: UITableViewController {
    var restaurantNames = [
        "Cafe Deadend",
        "Homei",
        "Teakha",
        "Cafe Loisl",
        "Petite Oyster",
        "For Kee Restaurant",
        "Po's Atelier",
        "Bourke Street Bakery",
        "Haigh's Chocolate",
        "Palomino Espresso",
        "Upstate", "Traif",
        "Graham Avenue Meats",
        "Waffle & Wolf",
        "Five Leaves",
        "Cafe Lore",
        "Confessional",
        "Barrafina",
        "Donostia",
        "Royal Oak",
        "CASK Pub and Kitchen"]
    
    var restaurantImages = [
        "cafedeadend",
        "homei",
        "teakha",
        "cafeloisl",
        "petiteoyster",
        "forkeerestaurant",
        "posatelier",
        "bourkestreetbakery",
        "haighschocolate",
        "palominoespresso",
        "upstate",
        "traif",
        "grahamavenuemeats",
        "wafflewolf",
        "fiveleaves",
        "cafelore",
        "confessional",
        "barrafina",
        "donostia",
        "royaloak",
        "caskpubkitchen"]
    
    var restaurantLocations = [
        "Hong Kong",
        "Hong Kong",
        "Hong Kong",
        "Hong Kong",
        "Hong Kong",
        "Hong Kong",
        "Hong Kong",
        "Sydney",
        "Sydney",
        "Sydney",
        "New York",
        "New York",
        "New York",
        "New York",
        "New York",
        "New York",
        "New York",
        "London",
        "London",
        "London",
        "London"]
    
    var restaurantTypes = [
        "Coffee & Tea Shop",
        "Cafe",
        "Tea House",
        "Austrian / Causual Drink",
        "French",
        "Bakery",
        "Bakery",
        "Chocolate",
        "Cafe",
        "American / Seafood",
        "American",
        "American",
        "Breakfast & Brunch",
        "Coffee & Tea",
        "Coffee & Tea",
        "Latin American",
        "Spanish",
        "Spanish",
        "Spanish",
        "British",
        "Thai"]

    var restaurantIsVisited = Array(repeating: false, count: 21)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.cellLayoutMarginsFollowReadableWidth = true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantNames.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell";
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
            as! RestaurantTableViewCell
        
        cell.nameLabel.text = restaurantNames[indexPath.row]
        cell.locationLabel.text = restaurantLocations[indexPath.row]
        cell.typeLabel.text = restaurantTypes[indexPath.row]
        cell.thumbnailImageView.image = UIImage(named: restaurantImages[indexPath.row])

        cell.accessoryType = restaurantIsVisited[indexPath.row]
            ? .checkmark
                : .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .actionSheet)

        if let popoverController = optionMenu.popoverPresentationController {
            if let cell = tableView.cellForRow(at: indexPath) {
                popoverController.sourceView = cell
                popoverController.sourceRect = cell.bounds
            }
        }
        
        let cancelActions = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        optionMenu.addAction(cancelActions)
        optionMenu.addAction(buildCallAction(row: indexPath.row))
        optionMenu.addAction(buildCheckInAction(tableView: tableView, indexPath: indexPath))

        present(optionMenu, animated: true, completion: nil)

        tableView.deselectRow(at: indexPath, animated: true)
    }

    func buildCallAction(row: Int) -> UIAlertAction {
        let title = "Call " + "123-000-\(row)"

        return UIAlertAction(title: title, style: .default, handler: {(action: UIAlertAction) -> Void in
            let alertMessage = UIAlertController(title: "Service Unavailable",
                    message: "Sorry, the call feature is not available yet. Please retry later.",
                    preferredStyle: .alert)

            alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

            self.present(alertMessage, animated: true, completion: nil)
        })
    }

    func buildCheckInAction(tableView: UITableView, indexPath: IndexPath) -> UIAlertAction {
        return UIAlertAction(title: "Check In", style: .default, handler: {(action: UIAlertAction!) -> Void in
            let cell = tableView.cellForRow(at: indexPath)
            cell?.accessoryType = .checkmark

            self.restaurantIsVisited[indexPath.row] = true
        })
    }
}
