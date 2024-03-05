//
//  BubbleView.swift
//  Lec6 Code
//
//  Created by Jordan H on 2/22/24.
//

import SwiftUI

struct BubbleView: View {
    var bubble: Bubble
    
    var body: some View {
        ZStack {
            Circle()
                .fill(RadialGradient(colors: [bubble.color.opacity(0.3), bubble.color], center: UnitPoint(x: 0.2, y: 0.2), startRadius: bubble.size * 0.05, endRadius: bubble.size))
                .strokeBorder(bubble.color, lineWidth: 3)
            
            if bubble.type == .tap {
                Text("\(bubble.tapCount ?? 1)")
            } else {
                Image(systemName: "arrow.right")
                    .rotationEffect(bubble.swipeAngle ?? Angle(degrees: 0))
            }
        }
        .fontDesign(.rounded)
        .fontWeight(.bold)
        .foregroundStyle(.white)
        .frame(width: bubble.size, height: bubble.size)
        .position(x: bubble.x, y: bubble.y)
    }
}

#if os(iOS)
#Preview {
    BubbleView(bubble: Bubble(color: Color.blue, x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2, size: 50, type: .tap, tapCount: 2))
}
#endif
