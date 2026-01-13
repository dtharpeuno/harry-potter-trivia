//
//  Question.swift
//  HPTrivia
//
//  Created by dtharpeuno on 1/8/26.
//

struct Question: Decodable {
	let id: Int
	let question: String
	let answer: String
	let wrong: [String]
	let book: Int
	let hint: String
}
