//
//  ContentView.swift
//  SliderGame
//
//  Created by Наталья Миронова on 26.07.2023.
//

import SwiftUI

struct ContentView: View {
	
	@State private var targetValue = Int.random(in: 0...100)
	@State private var currentValue: Float = 0
	@State private var showAlert = false
	
	var body: some View {
		VStack(spacing: 16) {
			Text("Подвиньте слайдер, как можно ближе к \(targetValue)")
			HStack {
				Text("0")
				SliderUIKit(currentValue: $currentValue, alpha: (CGFloat(computeScore()))/100)
				Text("100")
			}
			Button("Проверить") {
				showAlert.toggle()
			}.alert("Твой результат", isPresented: $showAlert, actions: {}) {
				Text("\(computeScore())")
			}
			Button("Начать заново") {
				currentValue = 0
				targetValue = getRandomNumber()
			}
		}
		.padding()
	}
	
	private func getRandomNumber() -> Int {
		Int.random(in: 0...100)
	}
	
	private func computeScore() -> Int {
		let difference = abs(targetValue - lround(Double(currentValue) * 100))
		return 100 - difference
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
