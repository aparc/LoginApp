//
//  FoodViewController.swift
//  LoginApp
//
//  Created by Андрей on 06.07.2022.
//

import UIKit

class FoodViewController: UIViewController {
	
	// MARK: - IB Outlets
	@IBOutlet var imageViews: [UIImageView]!
	@IBOutlet var foodLabels: [UILabel]!
	
	// MARK: - Public Properties
	var user: User!
	
	// MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
		imageViews.indices.forEach { index in
			if let food = user?.person.favouriteFoods[index] {
				imageViews[index].image = UIImage(named: food)
				foodLabels[index].text = food
			}
		}
    }

}
