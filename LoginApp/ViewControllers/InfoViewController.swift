//
//  InfoViewController.swift
//  LoginApp
//
//  Created by Андрей on 06.07.2022.
//

import UIKit

class InfoViewController: UIViewController {
	
	// MARK: - IB Outlets
	
	@IBOutlet var hobbiesLabel: UILabel!
	
	// MARK: - Public Properties
	var hobbies: [String]!
	
	// MARK: - Life Cycle Methods
	override func viewDidLoad() {
		hobbiesLabel.text = hobbies.joined(separator: ", ")
	}
	
	// MARK: - IB Actions
	@IBAction func closeAction() {
		dismiss(animated: true)
	}

}
