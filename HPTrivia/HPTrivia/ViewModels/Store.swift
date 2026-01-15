//
//  Store.swift
//  HPTrivia
//
//  Created by dtharpeuno on 1/15/26.
//

import StoreKit

@MainActor
@Observable
class Store {
	var products: [Product] = []
	var purchased =  Set<String>()
	
	private var updates: Task<Void, Never>? = nil
	
	// load all products
	func loadProducts() async {
		do {
			products = try await Product.products(for: ["hp4", "hp5", "hp6", "hp7"])
			products.sort {
				$0.displayName < $1.displayName
			}
		} catch {
			print("Error \(error)")
		}
	}
	
	
	//purchase a product
	
	//check for purchased products
	
	//connect with app store
}
