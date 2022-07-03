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
	
	private let username = "User"
	private let password = "Demo"
	
	// MARK: - Override Methods
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
		welcomeVC.username = username
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		super.touchesBegan(touches, with: event)
		view.endEditing(true)
	}
	
	// MARK: - IB Actions
	@IBAction func loginAction(_ sender: UIButton) {
		if usernameTextField.text == username && passwordTextField.text == password {
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
		let message = sender.tag == 0 ? "Your name is \(username) 🙃" : "Your password is \(password)"
		showAlert(title: "Oops!", message: message)
	}
	
	@IBAction func unwind(for segue: UIStoryboardSegue) {
		usernameTextField.text = nil
		passwordTextField.text = nil
	}
	
	// MARK: - Private Methods
	private func showAlert(title: String, message: String, textFieldToClear: UITextField? = nil) {
		let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
		let action = UIAlertAction(title: "OK", style: .default) { _ in
			textFieldToClear?.text = nil
		}
		alert.addAction(action)
		present(alert, animated: true)
	}
	
}

