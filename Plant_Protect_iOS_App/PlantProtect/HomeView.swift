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
                LinearGradient(gradient: Gradient(colors: [Color.lightBlue, Color.lightGreen]), startPoint: .topLeading, endPoint: .bottomTrailing)
                
                VStack {
                    Text("Plant Protect")
                        .font(.system(size: 56.0))
                        .foregroundColor(.black)
                        .bold()
                        .padding()
                    
                    Spacer()
                        .frame(height: 100)
                    NavigationLink(destination: ContentView(classifier: ImageClassifier())) {
                        Text("Classify Plant!")
                            .foregroundColor(Color.white)
                            .fontWeight(.bold)
                            .font(.system(size: 30))
                            .padding()
                            .background(Color.lightGreen)
                            .cornerRadius(10)
                            .shadow(color: Color.white, radius: 20)
                            .padding()
                    
                }
                }
                
            }.ignoresSafeArea()
            
        }
        .navigationTitle("Plant Protect")
        .navigationBarHidden(false)
        
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
