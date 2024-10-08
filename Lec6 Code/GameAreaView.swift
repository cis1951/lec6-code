//
//  GameAreaView.swift
//  Lec6 Code
//
//  Created by CIS 1951 Staff on 2/22/24.
//

import SwiftUI

struct GameAreaView: View {
    @Binding var gameStarted: Bool
    @State private var bubbles: [Bubble] = []

    var body: some View {
        GeometryReader { proxy in
            ZStack {
                ForEach(bubbles) { bubble in
                    BubbleView(bubble: bubble)
                        .onTapGesture {
                            withAnimation {
                                tryRemoveBubble(bubble, taps: 1)
                            }
                        }
                        .gesture(DragGesture(minimumDistance: 3.0, coordinateSpace: .local)
                            .onEnded { value in
                                let angle = atan2(value.translation.height, value.translation.width)
                                withAnimation {
                                    tryRemoveBubble(bubble, angle: Angle(radians: angle))
                                }
                            }
                        )
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .onChange(of: gameStarted) {
                if gameStarted {
                    startGame(size: proxy.size)
                }
            }
        }
    }

    private func startGame(size: CGSize) {
        bubbles.removeAll()
        
        for _ in 1...10 {
            bubbles.append(Bubble(color: Color.blue, boundary: size))
        }
    }

    private func tryRemoveBubble(_ bubble: Bubble, taps: Int = 0, angle: Angle = Angle(degrees: 0)) {
        if bubble.type == .tap {
            if let index = bubbles.firstIndex(where: { $0.id == bubble.id }) {
                bubbles[index].tapCount? -= taps
                if bubbles[index].tapCount == 0 {
                    bubbles.remove(at: index)
                }
            }
        } else if let bubbleAngle = bubble.swipeAngle {
            // Check if angle and bubble's angle are within 30 degrees
            let bubbleAngle = bubbleAngle.degrees.truncatingRemainder(dividingBy: 360)
            let swipeAngle = angle.degrees.truncatingRemainder(dividingBy: 360)
            let angleDiff = abs(bubbleAngle - swipeAngle)

            if angleDiff <= 30 || angleDiff >= 330 {
                bubbles.removeAll { $0.id == bubble.id }
            }
        }
        
        if bubbles.isEmpty {
            gameStarted = false
        }
    }
}

#Preview {
    @Previewable @State var gameStarted = false
    return GameAreaView(gameStarted: $gameStarted)
}
