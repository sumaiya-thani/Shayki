//
//  Splash2.swift
//  Shayki
//
//  Created by sumaiya on 02/12/2566 BE.
//

import SwiftUI
import SSSwiftUIGIFView
struct SplashScreen: View {
    @State private var isActive = false

      var body: some View {
          ZStack {
              Color("Color") // Set your background color
                  .edgesIgnoringSafeArea(.all)

              VStack(alignment: .center) {
                 

                  SwiftUIGIFPlayerView(gifName: "logo2")
                 
                      .frame(width: 300, height: 300) // Adjust te size as needed
                      .onAppear {
                          withAnimation(.easeIn(duration: 1.2)) {
                             
                          }
                      }
                  Text("Shayki")
                      .font(Font.custom("Baskerville-Bold", size: 36))
                      .fontWeight(.bold)
                      .foregroundColor(.white.opacity(0.80))
                      
                     
              }
              .padding()
              .onAppear {
                  DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                      withAnimation {
                          self.isActive = true
                      }
                  }
              }
              .fullScreenCover(isPresented: $isActive, content: {
                  MainScreen()
              })
          }
      }
}

#Preview {
    SplashScreen()
}
