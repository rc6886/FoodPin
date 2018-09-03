//
//  RestaurantDetailViewController.swift
//  FoodPin
//
//  Created by admin on 9/3/18.
//  Copyright © 2018 rc6886. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController {
    var restaurantImageName = ""
    @IBOutlet var restaurantImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        restaurantImageView.image = UIImage(named: restaurantImageName)
        
        navigationItem.largeTitleDisplayMode = .never
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
