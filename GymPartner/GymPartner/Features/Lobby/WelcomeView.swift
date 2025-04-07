//
//  WelcomeView.swift
//  GymPartner
//
//  Created by Javier Heisecke on 2025-03-18.
//

import SwiftUI

struct WelcomeView: View {

    @Environment(AppState.self) private var root

    @State private var showSingInPressed = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 8) {
                LinearGradient(colors: [.blue, .yellow, .cyan, .blue.opacity(0.8), .blue], startPoint: .bottomLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()

                titleSection
                    .padding(.top, 24)

                buttons
                    .padding(16)
            }
            .sheet(isPresented: $showSingInPressed) {
                Text("Google, Apple, email")
                    .presentationDetents([.medium])
            }
        }
    }

    private var titleSection: some View {
        VStack {
            Text("Gym Partner")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }

    private var buttons: some View {
        VStack(spacing: 20) {
            NavigationLink {
                OnboardingIntroView()
            } label: {
                Text("Get Started")
            }
            Text("Already have an account? Sign in.")
                .tappableBackground()
                .underline()
                .foregroundStyle(.black)
                .onTapGesture {
                    onSingInPressed()
                }

            HStack {
                Link(destination: URL(string: "google.com")!) {
                    Text("Terms of Service")
                }
                Circle()
                    .frame(width: 4, height: 4)
                Link(destination: URL(string: "google.com")!) {
                    Text("Privacy Policy")
                }
            }
            .foregroundStyle(.blue)
        }
    }

    // MARK: - Actions

    private func handleDidSignIn(isNewUser: Bool) {
        print("Hello")
    }

    private func onSingInPressed() {
        showSingInPressed = true
    }
}

#Preview {
    NavigationStack {
        WelcomeView()
            .environment(AppState())
    }
}
