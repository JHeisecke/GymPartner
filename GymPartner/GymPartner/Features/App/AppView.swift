//
//  AppView.swift
//  GymPartner
//
//  Created by Javier Heisecke on 2025-03-18.
//

import SwiftUI

struct AppView: View {

    @State var appState: AppState = AppState()

    var body: some View {
        AppViewBuilder(
            showTabBar: appState.showTabBar,
            tabbarView: {
                Text("TabBar")
            },
            onboardingView: {
                WelcomeView()
            }
        )
    }
}

#Preview {
    AppView()
}
