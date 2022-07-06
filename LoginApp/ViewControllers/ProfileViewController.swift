//
//  ProfileViewController.swift
//  LoginApp
//
//  Created by Андрей on 06.07.2022.
//

import UIKit

class ProfileViewController: UIViewController {
	
	// MARK: - IB Outlets
	@IBOutlet var imageView: UIImageView!
	@IBOutlet var birthdayLabel: UILabel!
	@IBOutlet var cityLabel: UILabel!
	@IBOutlet var phoneLabel: UILabel!
	@IBOutlet var emailLabel: UILabel!
	
	// MARK: - Public properties
	var person: Person!

	// MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
		setupOutlets()
    }
	
	override func viewDidLayoutSubviews() {
		setupImageView()
	}

}

// MARK: - Override Methods
extension ProfileViewController {
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let infoVC = segue.destination as? InfoViewController {
			infoVC.hobbies = person.hobbies
		}
	}
}

// MARK: - Private methods
extension ProfileViewController {
	private func setupImageView() {
		imageView.layer.borderWidth = 1
		imageView.layer.masksToBounds = false
		imageView.layer.borderColor = UIColor.black.cgColor
		imageView.layer.cornerRadius = imageView.frame.height / 2
		imageView.clipsToBounds = true
	}
	
	private func setupOutlets() {
		imageView.image = UIImage(named: person.image)
		birthdayLabel.text = person.birthday
		cityLabel.text = person.city
		phoneLabel.text = person.phoneNumber
		emailLabel.text = person.email
	}
}
