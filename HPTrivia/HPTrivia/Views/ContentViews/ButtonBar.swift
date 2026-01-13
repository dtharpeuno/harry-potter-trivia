//
//  ButtonBar.swift
//  HPTrivia
//
//  Created by dtharpeuno on 1/11/26.
//

import SwiftUI

struct ButtonBar: View {
	@Binding var animateViewIn: Bool
	@Binding var playGame: Bool
	
	let geo: GeometryProxy
	
    var body: some View {
		HStack {
			Spacer()
			
			InstructionsButton(animateViewIn: $animateViewIn, geo: geo)
			
			Spacer()
			
			PlayButton(animateViewIn: $animateViewIn, playGame: $playGame, geo: geo)
			
			Spacer()
			
			SettingsButton(animateViewIn: $animateViewIn, geo: geo)
			
			Spacer()
		}
		.frame(width: geo.size.width)
    }
}

#Preview {
	GeometryReader {
		geo in
		ButtonBar(animateViewIn: .constant(true), playGame: .constant(false), geo: geo)
	}
}
