//
//  ViewController.swift
//  LoginApp
//
//  Created by Андрей on 02.07.2022.
//

import UIKit

class LoginViewController: UIViewController {
	
	// MARK: - IB Outlets
	
	@IBOutlet var usernameTextField: UITextField!
	@IBOutlet var passwordTextField: UITextField!
	
	// MARK: - Private Properties
	private let user = User.getUser()
	
	// MARK: - IB Actions
	@IBAction func loginAction(_ sender: UIButton) {
		if validateCredentials() {
			performSegue(withIdentifier: "welcome_seg", sender: nil)
		} else {
			showAlert(
				title: "Invalid login or password",
				message: "Please, enter correct login and password",
				textFieldToClear: passwordTextField
			)
		}
	}
	
	@IBAction func forgotAction(_ sender: UIButton) {
		let message = sender.tag == 0
		? "Your name is \(user.username) 🙃"
		: "Your password is \(user.password)"
		
		showAlert(title: "Oops!", message: message)
	}
	
	@IBAction func unwind(for segue: UIStoryboardSegue) {
		usernameTextField.text = nil
		passwordTextField.text = nil
	}
	
}

// MARK: - Override Methods
extension LoginViewController {
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		guard let tabBarController = segue.destination as? UITabBarController else { return }
		guard let viewControllers = tabBarController.viewControllers else { return }
		
		viewControllers.forEach { viewController in
			if let wellcomeVC = viewController as? WelcomeViewController {
				wellcomeVC.fullName = "\(user.person.firstName) \(user.person.surname)"
			} else if let navController = viewController as? UINavigationController {
				guard let profileVC = navController.topViewController as? ProfileViewController else { return }
				profileVC.person = user.person
			} else if let foodVC = viewController as? FoodViewController {
				foodVC.favouritesFood = user.person.favouriteFoods
			}
		}
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		super.touchesBegan(touches, with: event)
		view.endEditing(true)
	}
}

// MARK: - Private Methods
extension LoginViewController {
	private func validateCredentials() -> Bool {
		usernameTextField.text == user.username && passwordTextField.text == user.password
	}
	
	private func showAlert(title: String, message: String, textFieldToClear: UITextField? = nil) {
		let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
		let action = UIAlertAction(title: "OK", style: .default) { _ in
			textFieldToClear?.text = nil
		}
		alert.addAction(action)
		present(alert, animated: true)
	}
}

