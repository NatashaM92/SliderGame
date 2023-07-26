//
//  SliderUIKit.swift
//  SliderGame
//
//  Created by Наталья Миронова on 26.07.2023.
//

import SwiftUI

struct SliderUIKit: UIViewRepresentable {
	
	@Binding var currentValue: Float
	
	let alpha: CGFloat
	
	func makeUIView(context: Context) -> UISlider {
		let slider = UISlider()
		// с мин и макс не работает
		//		slider.minimumValue = 0
		//		slider.maximumValue = 100
		slider.minimumTrackTintColor = .blue
		
		slider.addTarget(
			context.coordinator,
			action: #selector(Coordinator.sliderValueChanged),
			for: .valueChanged)
		
		return slider
	}
	
	func updateUIView(_ uiView: UISlider, context: Context) {
		uiView.value = currentValue
		uiView.thumbTintColor = .init(red: 1.0, green: 0.0, blue: 0.0, alpha: alpha)
	}
	
	func makeCoordinator() -> Coordinator {
		Coordinator(currentValue: $currentValue)
	}
}

extension SliderUIKit {
	class Coordinator: NSObject {
		@Binding var currentValue: Float
		
		init(currentValue: Binding<Float>) {
			self._currentValue = currentValue
		}
		
		@objc func sliderValueChanged(_ sender: UISlider) {
			currentValue = sender.value
		}
	}
}

struct SliderUIKit_Previews: PreviewProvider {
	static var previews: some View {
		SliderUIKit(currentValue: .constant(50), alpha: 0.15 )
	}
}
