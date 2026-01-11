//
//  SettingsButton.swift
//  HPTrivia
//
//  Created by dtharpeuno on 1/11/26.
//

import SwiftUI

struct SettingsButton: View {
	@Binding var animateViewIn: Bool
	
	@State private var showSettings = false
	
	let geo: GeometryProxy
	
    var body: some View {
		VStack {
			if animateViewIn {
				Button {
					showSettings.toggle()
				} label: {
					Image(systemName: "gearshape.fill")
						.font(.largeTitle)
						.foregroundStyle(.white)
						.shadow(radius: 5)
				}
				.transition(.offset(x: geo.size.width/4))
			}
		}
		.animation(.easeOut(duration: 0.7).delay(2.7), value: animateViewIn)
    }
}

#Preview {
	GeometryReader {
		geo in
		SettingsButton(animateViewIn: .constant(true), geo: geo)
	}
}
