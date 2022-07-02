//
//  ViewController.swift
//  LoginApp
//
//  Created by Андрей on 02.07.2022.
//

import UIKit

class LoginViewController: UIViewController {
	
	// MARK: - IB Outlets
	
	@IBOutlet var usernameLabel: UITextField!
	@IBOutlet var passwordLabel: UITextField!
	
	// MARK: - Private Properties
	
	private let username = "User"
	private let password = "Demo"
	
	// MARK: - IB Actions
	@IBAction func loginAction(_ sender: UIButton) {
		if usernameLabel.text == username && passwordLabel.text == password {
			performSegue(withIdentifier: "welcome_seg", sender: nil)
		} else {
			showAlert(
				title: "Invalid login or password",
				message: "Please, enter correct login and password"
			) { _ in
				self.passwordLabel.text = nil
			}
		}
	}
	
	@IBAction func forgotAction(_ sender: UIButton) {
		let message = sender.tag == 0 ? "Your name is \(username) 🙃" : "Your password is \(password)"
		showAlert(title: "Oops!", message: message)
	}
	
	@IBAction func unwind(for segue: UIStoryboardSegue) {
		usernameLabel.text = nil
		passwordLabel.text = nil
	}
	
	// MARK: - Override Methods
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
		welcomeVC.username = username
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		super.touchesBegan(touches, with: event)
		self.view.endEditing(true)
	}
	
	// MARK: - Private Methods
	private func showAlert(title: String, message: String, completion: ((UIAlertAction) -> Void)? = nil ) {
		let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "OK", style: .default, handler: completion))
		present(alert, animated: true)
	}
	
}

