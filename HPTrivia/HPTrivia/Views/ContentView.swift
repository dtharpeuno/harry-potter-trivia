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
				AnimatedBackground(geo: geo)
				VStack {
					
					GameTitle(animateViewIn: $animateViewIn)
					
					Spacer()
					
					RecentScores(animateViewIn: $animateViewIn)
					
					Spacer()
					
					ButtonBar(animateViewIn: $animateViewIn, geo: geo)
					
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
		.environment(Game())
//		.preferredColorScheme(.dark)
}
