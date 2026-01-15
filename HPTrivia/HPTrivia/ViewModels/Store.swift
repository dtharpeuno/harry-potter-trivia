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
	
	init() {
		updates = watchForUpdates()
	}
	
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
	func purchase(_ product: Product) async {
		do {
			let result = try await product.purchase()
			
			switch result {
				// purchase successful, but need to verify transaction
				case .success(let verificationResult):
				switch verificationResult {
					case .unverified(let signedType, let verificationError):
						print("Error \(verificationError)")
					
					case .verified(let signedType):
						purchased.insert(signedType.productID)
						
						await signedType.finish()
					}
				
				// User cancelled or dissaproved
				case .userCancelled:
					break
				
				// Waiting for some sort of approval
				case .pending:
					break
				
				@unknown default:
					break
			}
			
		} catch {
			print("Error \(error)")
		}
	}
	
	//check for purchased products
	private func checkPurchased() async {
		for product in products {
			for await status in product.currentEntitlements {
				switch status {
				case .verified(let signedType):
					if signedType.revocationDate == nil {
						purchased.insert(signedType.productID)
					} else {
						purchased.remove(signedType.productID)
					}
					
				case .unverified(_, let error):
					print("Unverified transaction:", error)
				}
			}
		}
	}
	
	//connect with app store
	private func watchForUpdates() -> Task<Void, Never> {
		Task(priority: .background) {
			for await _ in Transaction.updates {
				await checkPurchased()
			}
		}
	}
}
