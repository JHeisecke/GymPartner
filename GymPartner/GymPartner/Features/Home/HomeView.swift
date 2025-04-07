//
//  HomeView.swift
//  GymPartner
//
//  Created by Javier Heisecke on 2025-04-03.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(spacing: 0) {
            topSection
            VStack {
                Color.accent.opacity(0.6)
            }
            .ignoresSafeArea()
        }
    }

    // MARK: - Top Section

    private var topSection: some View {
        VStack(spacing: 0) {
            HStack {
                avatar
                VStack(alignment: .leading, spacing: 5) {
                    Text("Javier Heisecke")
                        .font(.headline)
                    HStack {
                        Image(systemName: "shield.righthalf.filled")
                        Text("Dark Knight")
                    }
                    .font(.subheadline)
                }
                .foregroundStyle(.white)
                Spacer()
            }
            .padding(.horizontal)
            .background(.accent.opacity(0.9))
            LevelProgressBar(currentLevel: 20, maxLevel: 100, barHeight: 10)
        }
    }

    private var avatar: some View {
        Image("mascot")
            .resizable()
            .scaledToFit()
            .frame(width: 50)
            .offset(y: 20)
            .background(.white)
            .clipShape(Circle())
    }
}

#Preview {
    HomeView()
}
