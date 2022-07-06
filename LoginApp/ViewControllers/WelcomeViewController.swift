//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by Андрей on 02.07.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
	
	// MARK: - IB Outlets
	@IBOutlet var greetingsLabel: UILabel!
	
	// MARK: - Public Properties
	var fullName = ""
	
	// MARK: - Life Cycles Methods
	override func viewDidLoad() {
		super.viewDidLoad()
		setupBackground()
		greetingsLabel.text = "Welcome, \(fullName)!"
	}

}

// MARK: - Private Methods
extension WelcomeViewController {
	private func setupBackground() {
		let gradientLayer = CAGradientLayer()
		gradientLayer.frame = view.bounds
		gradientLayer.colors = [#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1).cgColor, #colorLiteral(red: 0.4991078377, green: 0.9482223392, blue: 0.9685311913, alpha: 1).cgColor]
		view.layer.insertSublayer(gradientLayer, at: 0)
	}
	
}
