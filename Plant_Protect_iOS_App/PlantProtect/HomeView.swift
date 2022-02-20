//
//  HomeViw.swift
//  Plant
//
//  Created by Sanchitha Dinesh on 2/19/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.darkPink, Color.lightGreen]), startPoint: .topLeading, endPoint: .bottomTrailing)
                VStack {
                    Text("Plant Protect")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .bold()
                        .padding()
                    NavigationLink(destination: ContentView(classifier: ImageClassifier())) {
                        Text("Classify Plant!")
                            .foregroundColor(Color.white)
                            .fontWeight(.bold)
                            .padding()
                            .background(Color.lightGreen)
                            .cornerRadius(10)
                            .shadow(color: Color.white, radius: 20)
                            .padding()
                }
                }
                
            }.ignoresSafeArea()
            
        }
        
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
