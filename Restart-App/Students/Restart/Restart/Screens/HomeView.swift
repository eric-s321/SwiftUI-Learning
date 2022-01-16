//
//  HomeView.swift
//  Restart
//
//  Created by Eric Scagnelli on 1/9/22.
//

import SwiftUI

struct HomeView: View {
    // MARK: Retrieve App Storage property
    //Value is NOT set here
    //this initializer is just a failsafe incase the value is not found in storage due to error
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    
    // MARK: Body
    var body: some View {
        VStack(spacing: 20) {
            Text("Home")
                .font(.largeTitle)
            Button(action: {
                //setting this to false calls the app storage setter
                //value is persisted in App Storage
                isOnboardingViewActive = true;
            }){
                Text("Restart")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
