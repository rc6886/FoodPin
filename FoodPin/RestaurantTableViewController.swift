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
    var restaurants = RestaurantFactory.getRestaurants()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.cellLayoutMarginsFollowReadableWidth = true
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell";
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
            as! RestaurantTableViewCell
        
        cell.nameLabel.text = restaurants[indexPath.row].name
        cell.locationLabel.text = restaurants[indexPath.row].location
        cell.typeLabel.text = restaurants[indexPath.row].type
        cell.thumbnailImageView.image = UIImage(named: restaurants[indexPath.row].image)

        cell.accessoryType = restaurants[indexPath.row].isVisited ? .checkmark : .none
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRestaurantDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! RestaurantDetailViewController
                
                destinationController.restaurantImageName = restaurants[indexPath.row].image
                destinationController.restaurantName = restaurants[indexPath.row].name
                destinationController.restaurantType = restaurants[indexPath.row].type
                destinationController.restaurantLocation = restaurants[indexPath.row].location
            }
        }
    }
//    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .actionSheet)
//
//        if let popoverController = optionMenu.popoverPresentationController {
//            if let cell = tableView.cellForRow(at: indexPath) {
//                popoverController.sourceView = cell
//                popoverController.sourceRect = cell.bounds
//            }
//        }
//        
//        let cancelActions = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//
//        optionMenu.addAction(cancelActions)
//        optionMenu.addAction(buildCallAction(row: indexPath.row))
//        optionMenu.addAction(buildCheckInAction(tableView: tableView, indexPath: indexPath))
//
//        present(optionMenu, animated: true, completion: nil)
//
//        tableView.deselectRow(at: indexPath, animated: true)
//    }

    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete", handler: {(action, sourceView, completionHandler) in
            self.restaurants.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            completionHandler(true)
        })

        let shareAction = UIContextualAction(style: .normal, title: "Share") { (action, sourceView, completionHandler) in
            let defaultText = "Just checking in at " + self.restaurants[indexPath.row].name
            let activityController: UIActivityViewController

            if let imageToShare = UIImage(named: self.restaurants[indexPath.row].image) {
                activityController = UIActivityViewController(activityItems: [defaultText, imageToShare], applicationActivities: nil)
            } else {
                activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)

            }
            self.present(activityController, animated: true, completion: nil)
            completionHandler(true)
        }
        
        deleteAction.backgroundColor = UIColor(red: 231.0/255.0, green: 76.0/255.0, blue: 60.0/255.0, alpha: 1.0)
        deleteAction.image = UIImage(named: "delete")
        
        shareAction.backgroundColor = UIColor(red: 254.0/255.0, green: 149.0/255.0, blue: 38.0/255.0, alpha: 1.0)
        shareAction.image = UIImage(named: "share")

        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction, shareAction])
        return swipeConfiguration
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
        let isCheckedIn = self.restaurants[indexPath.row].isVisited
        let title = isCheckedIn ? "Undo Check In" : "Check In"

        return UIAlertAction(title: title, style: .default, handler: {(action: UIAlertAction!) -> Void in
            let cell = tableView.cellForRow(at: indexPath)

            cell?.accessoryType = isCheckedIn ? .none : .checkmark

            self.restaurants[indexPath.row].isVisited = !isCheckedIn
        })
    }
}
