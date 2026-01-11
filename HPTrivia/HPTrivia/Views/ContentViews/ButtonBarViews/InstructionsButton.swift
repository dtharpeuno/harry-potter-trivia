//
//  InstructionsButton.swift
//  HPTrivia
//
//  Created by dtharpeuno on 1/11/26.
//

import SwiftUI

struct InstructionsButton: View {
	@Binding var animateViewIn: Bool
	
	@State private var showInstructions = false
	
	let geo: GeometryProxy
	
    var body: some View {
		VStack {
			if animateViewIn {
				Button {
					showInstructions.toggle()
				} label: {
					Image(systemName: "info.circle.fill")
						.font(.largeTitle)
						.foregroundStyle(.white)
						.shadow(radius: 5)
				}
				.transition(.offset(x: -geo.size.width/4))
			}
		}
		.animation(.easeOut(duration: 0.7).delay(2.7), value: animateViewIn)
		.sheet(isPresented: $showInstructions) {
			Instructions()
		}
    }
	
}

#Preview {
	GeometryReader { geo in
		InstructionsButton(animateViewIn: .constant(true), geo: geo)
	}
}
