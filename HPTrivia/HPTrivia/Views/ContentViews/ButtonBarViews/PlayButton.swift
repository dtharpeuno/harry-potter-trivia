//
//  PlayButton.swift
//  HPTrivia
//
//  Created by dtharpeuno on 1/11/26.
//

import SwiftUI

struct PlayButton: View {
	@Binding var animateViewIn: Bool
	
	@State private var playGame = false
	@State private var scalePlayButton = false
	
	let geo: GeometryProxy
	
    var body: some View {
		VStack {
			if animateViewIn {
				Button {
					playGame.toggle()
				} label: {
					Text("Play")
						.font(.largeTitle)
						.foregroundStyle(.white)
						.padding(.vertical, 7)
						.padding(.horizontal, 50)
						.background(.brown)
						.clipShape(.rect(cornerRadius: 7))
						.shadow(radius: 5)
						.scaleEffect(scalePlayButton ? 1.2 : 1)
						.onAppear{
							withAnimation(.easeInOut(duration: 1.3).repeatForever()) {
								scalePlayButton.toggle()
							}
						}
				}
				.transition(.offset(y: geo.size.height/3))
			}
		}
		.animation(.easeInOut(duration: 0.7).delay(2), value: animateViewIn)
		
    }
}

#Preview {
	GeometryReader{
		geo in
		PlayButton(animateViewIn: .constant(true), geo: geo)
	}
}
