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
	@State private var scalePlayButton = false
	@State private var showInstructions = false
	@State private var showSettings = false
	@State private var playGame = false
	
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
					
					Spacer()
					
					Spacer()
					
					HStack {
						Spacer()
						
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
						
						Spacer()
						
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
						
						Spacer()
						
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
						
						Spacer()
					}
					.frame(width: geo.size.width)
					
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
		.sheet(isPresented: $showInstructions) {
				Instructions()
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
