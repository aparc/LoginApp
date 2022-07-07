//
//  User.swift
//  LoginApp
//
//  Created by Андрей on 06.07.2022.
//

import Foundation

struct User {
	
	let username: String
	let password: String
	let person: Person
	
	static func getUser() -> User {
		User(
			username: "User",
			password: "Demo",
			person: Person.getPerson()
		)
	}
	
}

struct Person {
	
	let firstName: String
	let surname: String
	let city: String
	let phoneNumber: String
	let email: String
	let birthday: String
	let hobbies: [String]
	let favouriteFoods: [String]
	let image: String
	
	var fullName: String {
		"\(firstName) \(surname)"
	}
	
	static func getPerson() -> Person {
		Person(
			firstName: "Andrei",
			surname: "Parchukov",
			city: "Saint-Petersburg",
			phoneNumber: "+7(911)992-02-xx",
			email: "a.parchukov@yandex.ru",
			birthday: "16 April 1991",
			hobbies: ["Coding", "Snowboards", "Cars", "Games", "Outdoor activities", "Music"],
			favouriteFoods: ["Khinkali", "Borsch", "Pancakes", "Nuggets"],
			image: "photo"
		)
	}
	
}
