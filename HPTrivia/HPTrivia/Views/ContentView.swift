//
//  ContentView.swift
//  HPTrivia
//
//  Created by dtharpeuno on 1/8/26.
//

import SwiftUI
import AVKit

struct ContentView: View {
	@State private var audioPlayer: AVAudioPlayer? = nil
	@State private var animateViewIn = false
	
    var body: some View {
		GeometryReader {
			geo in
			ZStack {
				Image(.hogwarts)
					.resizable()
					.frame(width: geo.size.width * 3, height: geo.size.height)
					.padding(.top, 3)
					.phaseAnimator([false, true]) {
						content, phase in
						content
							.offset(x: phase ? geo.size.width / 1.1 : -geo.size.width / 1.1)
					} animation: { _ in
							.linear(duration: 30)
					}
				
				VStack {
					VStack {
						if animateViewIn {
							VStack {
								Image(systemName: "bolt.fill")
									.imageScale(.large)
									.font(.largeTitle)
								
								Text("HP")
									.font(.custom("PartyLetPlain", size: 70))
									.padding(.bottom, -50)
								
								Text("Trivia")
									.font(.custom("PartyLetPlain", size: 60))
							}
							.padding(.top, 70)
							.transition(.move(edge: .top))
						}
					}
					.animation(.easeInOut(duration: 0.7).delay(2), value: animateViewIn)
					
					Spacer()
				}
			}
			.frame(width: geo.size.width, height: geo.size.height)
		}
		.ignoresSafeArea()
		.onAppear{
			animateViewIn = true
//			playAudio()
		}
    }
	
	private func playAudio() {
		let sound = Bundle.main.path(forResource: "magic-in-the-air", ofType: "mp3")
		audioPlayer = try! AVAudioPlayer(contentsOf: URL(filePath: sound!))
		audioPlayer?.numberOfLoops = -1
		audioPlayer?.play()
	}
}

#Preview {
	ContentView()
}
