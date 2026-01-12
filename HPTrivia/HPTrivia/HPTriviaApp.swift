//
//  HPTriviaApp.swift
//  HPTrivia
//
//  Created by dtharpeuno on 1/8/26.
//

import SwiftUI

@main
struct HPTriviaApp: App {
	private var game = Game()
	
	var body: some Scene {
		WindowGroup {
			ContentView()
				.environment(game)
		}
	}
}


/**
 App Dev Plan
 --Game Intro Screen
 -- Gameplay Screen
 -- Game Logic
 -- Audio
 -- Animations
 --In-app purchases
 -- Store
 -- Instructions Screen - started - done
 --Books
 -- Persist Scores
 **/

