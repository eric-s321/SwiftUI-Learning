//
//  ContentView.swift
//  SwiftUI-Tutorial
//
//  Created by Eric Scagnelli on 1/5/22.
//

import SwiftUI

extension Image{
    func imageModifier() -> some View {
        self
            .resizable()
            .scaledToFit()
    }
    
    func iconModifier() -> some View {
        self
            .imageModifier()
            .frame(maxWidth: 128)
            .foregroundColor(SwiftUI.Color.purple)
            .opacity(0.5)
    }
}

struct ContentView: View {
    private let IMAGE_URL: String = "https://credo.academy/credo-academy@3x.png"
    
    var body: some View {
        // MARK: 1, BASIC
        // AsyncImage(url: URL(string: IMAGE_URL))
        
        // MARK: 2, SCALE
        //AsyncImage(url: URL(string: IMAGE_URL), scale: 3.0)
        
        // MARK: 3. PLACEHOLDER
        /*
        AsyncImage(url: URL(string: IMAGE_URL)) { image in
            image.imageModifier()
        } placeholder: {
            Image(systemName: "photo.circle.fill").iconModifier()
        }
        .padding(40)
         */
        
        // MARK: PHASE
        /*
        AsyncImage(url: URL(string: IMAGE_URL)) { phase in
            //SUCCESS
            //FAILURE
            //EMPTY (default)
            if let image = phase.image {
                image.imageModifier()
            } else if phase.error != nil {
                Image(systemName: "ant.circle.fill").iconModifier()
            } else{
                Image(systemName: "photo.circle.fill").iconModifier()
            }
        }
        .padding(40)
         */
        
        // MARK: 5, Animation
        AsyncImage(url: URL(string: IMAGE_URL), transaction: Transaction(animation: SwiftUI.Animation.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.25))) { phase in
            switch phase {
            case.success(let image):
                image.imageModifier()
            case.failure:
                Image(systemName: "ant.circle.fill").iconModifier()
            case.empty:
                Image(systemName: "photo.circle.fill").iconModifier()
            @unknown default:
                ProgressView()
            }
        }
        .padding(40)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
