//
//  BubbleModel.swift
//  Lec6 Code
//
//  Created by CIS 1951 Staff on 2/22/24.
//

import Foundation
import SwiftUI

struct Bubble: Identifiable {
    enum BubbleType: CaseIterable {
        case swipe
        case tap
    }
    
    public init(color: Color, x: CGFloat, y: CGFloat, size: CGFloat, type: BubbleType, swipeAngle: Angle? = nil, tapCount: Int? = nil) {
        self.color = color
        self.x = x
        self.y = y
        self.size = size
        self.type = type
        self.swipeAngle = swipeAngle
        self.tapCount = tapCount
    }
    
    public init(color: Color, boundary: CGSize) {
        self.color = color
        self.size = CGFloat.random(in: 20...50)
        self.x = CGFloat.random(in: self.size...boundary.width - self.size)
        self.y = CGFloat.random(in: self.size...boundary.height - self.size)
        self.type = BubbleType.allCases.randomElement()!
        
        switch self.type {
        case .swipe:
            self.swipeAngle = Angle(degrees: Double.random(in: -180...180))
        case .tap:
            self.tapCount = Int.random(in: 1...3)
        }
    }
    
    let id = UUID()
    var color: Color
    var x: CGFloat
    var y: CGFloat
    var size: CGFloat
    var type: BubbleType
    var swipeAngle: Angle?
    var tapCount: Int?
}
