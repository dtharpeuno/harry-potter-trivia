//
//  Book.swift
//  HPTrivia
//
//  Created by dtharpeuno on 1/12/26.
//

struct Book: Identifiable {
	let id: Int
	let image: String
	let questions: [Question]
	var status: BookStatus
	
	
	enum BookStatus {
		case active, inactive, locked
	}
}
