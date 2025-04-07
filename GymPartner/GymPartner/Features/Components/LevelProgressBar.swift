//
//  LevelProgressBar.swift
//  GymPartner
//
//  Created by Javier Heisecke on 2025-04-07.
//

import SwiftUI

struct LevelProgressBar: View {

    // MARK: - Properties

    let currentLevel: Double
    let maxLevel: Double
    let barHeight: CGFloat

    init(currentLevel: Double, maxLevel: Double, barHeight: CGFloat = 12) {
        self.currentLevel = currentLevel
        self.maxLevel = maxLevel
        self.barHeight = barHeight
    }

    @State private var gradientStartPoint: UnitPoint = UnitPoint(x: 1.0, y: 0.5)
    @State private var gradientEndPoint: UnitPoint = UnitPoint(x: 2.0, y: 0.5)

    let gradientColors: [Color] = [
        Color.cyan.opacity(0.8),
        Color.blue,
        Color.blue.opacity(0.7),
        Color.cyan.opacity(0.8)
    ]

    private var progress: CGFloat {
        let rawProgress = CGFloat(currentLevel / maxLevel)
        return min(max(rawProgress, 0.0), 1.0)
    }

    // MARK: - Body

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 0)
                    .fill(Color.blue.opacity(0.2))
                    .frame(height: barHeight)
                if progress > 0 {
                    RoundedRectangle(cornerRadius: 0)
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: gradientColors),
                                startPoint: gradientStartPoint,
                                endPoint: gradientEndPoint
                            )
                        )
                        .frame(width: geometry.size.width * progress, height: barHeight)
                        .clipShape(UnevenRoundedRectangle(cornerRadii: .init(bottomTrailing: 2, topTrailing: 2)))
                }
            }
            .frame(height: barHeight)
            .onAppear {
                withAnimation(.linear(duration: 2.0).repeatForever(autoreverses: false)) {
                    gradientStartPoint = UnitPoint(x: -1.0, y: 0.5)
                    gradientEndPoint = UnitPoint(x: 0.0, y: 0.5)
                }
            }
        }
        .frame(height: barHeight)
    }
}

// MARK: - Example Usage Preview

struct ContentView_LevelBarExample: View {
    @State private var currentUserLevel: Double = 0
    let maximumUserLevel: Double = 100
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack(spacing: 30) {
            Text("User Level Progress")
                .font(.title)

            LevelProgressBar(
                currentLevel: currentUserLevel,
                maxLevel: maximumUserLevel
            )
            .padding(.horizontal)

            Text("Level: \(Int(currentUserLevel)) / \(Int(maximumUserLevel))")
                .font(.headline)
            HStack {
                Button("Reset") {
                    withAnimation(.easeInOut) {
                        currentUserLevel = 0
                    }
                }
                Spacer()
                Button("Fill") {
                    withAnimation(.easeInOut) {
                        currentUserLevel = maximumUserLevel
                    }
                }
            }
            .padding(.horizontal)

        }
        .padding()
        .onReceive(timer) { _ in
            if currentUserLevel < maximumUserLevel {
                withAnimation(.linear(duration: 0.1)) {
                    currentUserLevel = min(maximumUserLevel, currentUserLevel + 1)
                }
            }
        }
    }
}

// MARK: - Preview

#Preview("Static Values") {
    VStack(spacing: 20) {
        Text("Static Previews")
            .font(.headline)
        LevelProgressBar(currentLevel: 25, maxLevel: 100)
        LevelProgressBar(currentLevel: 75, maxLevel: 100)
        LevelProgressBar(currentLevel: 100, maxLevel: 100)
        LevelProgressBar(currentLevel: 0, maxLevel: 100)
    }
    .padding()
}

#Preview("Interactive Example") {
    ContentView_LevelBarExample()
}
