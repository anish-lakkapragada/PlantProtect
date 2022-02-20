//
//  ContentView.swift
//  Plant
//
//  Created by Sanchitha Dinesh on 2/19/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State var isPresenting: Bool = false
    @State var uiImage: UIImage?
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @ObservedObject var classifier: ImageClassifier
    
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.darkPink, Color.lightGreen]), startPoint: .topLeading, endPoint: .bottomTrailing)
            
            VStack{
                VStack{
                    Button(action: {
                        if uiImage != nil {
                            classifier.detect(uiImage: uiImage!)
                        }
                    }) {
                        Text("")
                            .foregroundColor(.orange)
                            .font(.title)
                    }
                    
                    
                    Group {
                        if let imageClass = classifier.imageClass {
                            HStack{
                                Text("Plant:")
                                    .font(.caption)
                                Text(imageClass)
                                    .bold()
                            }
                        } else {
                            HStack{
                                Text("Plant: NA")
                                    .font(.caption)
                            }
                        }
                    }
                    .font(.subheadline)
                    .padding()
                    
                }
                Rectangle()
                    .strokeBorder()
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color.white, radius: 20)
                    .frame(width: 320, height: 640)
                    .overlay(
                        Group {
                            if uiImage != nil {
                                Image(uiImage: uiImage!)
                                    .resizable()
                                    .scaledToFit()
                            }
                        }
                    )
                HStack {
                    Image(systemName: "photo")
                        .onTapGesture {
                            isPresenting = true
                            sourceType = .photoLibrary
                            
                        }
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.lightGreen)
                        .cornerRadius(10)
                        .shadow(color: Color.white, radius: 20)
                    Spacer()
                        .frame(width: 50, height: 50)
                    Image(systemName: "camera")
                        .onTapGesture {
                            isPresenting = true
                            sourceType = .camera
                        }
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.lightGreen)
                        .cornerRadius(10)
                        .shadow(color: Color.white, radius: 20)
                }
                
                .sheet(isPresented: $isPresenting){
                    ImagePicker(uiImage: $uiImage, isPresenting:  $isPresenting, sourceType: $sourceType)
                        .onDisappear{
                            if uiImage != nil {
                                classifier.detect(uiImage: uiImage!)
                            }
                        }
                    
                }
                .padding()
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()
extension Color {
    static let lightGreen = Color(red: 105 / 255, green: 214 / 255, blue: 134 / 255)
    static let darkPink = Color(red: 255 / 255, green: 166 / 255, blue: 240 / 255)
}
