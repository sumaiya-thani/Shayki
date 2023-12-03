//
//  Card.swift
//  GifView_SwiftUI
//
//  Created by sumaiya on 30/11/2566 BE.
//

import SwiftUI

struct Card: View {
    @State var title = ""
    @State var notes = ""
        @State private var showingSheet1 = false
        @State private var showingSheet2 = false
        @State private var showingSheet3 = false
        @State private var showingSheet4 = false
        @State private var showingSheet5 = false
    var body: some View {
        VStack{
            Button(action: {
                        showingSheet4.toggle()
                    }) {
                        VStack {
                            Text("Car Wash")
                                .padding()
                                .font(.title3)
                            
                            Image(systemName: "car.side")
                                .font(.system(size: 48))
                        }
                        .frame(width: 164, height: 132)
                        .foregroundColor(.white)
                        .background(Color("Color"))
                        .clipShape(RoundedRectangle(cornerRadius: 16.0))
                        .padding(.all, 8.0)
                        .shadow(radius: 10)
                    }
                    .sheet(isPresented: $showingSheet4) {
                        VehicleInfo()
                    }
            
            
            
            
            
            
            
            
            
            
            
            Button(action: {
                // Action to perform when the button is tapped
                print("Button tapped!")
            }) {
                VStack {
                    Text("Car Wash")
                        .padding()
                        .font(.title3)
                    
                    Image(systemName: "car.side")
                        .font(.system(size: 48))
                }
                .frame(width: 164, height: 132)
                .foregroundColor(.white)
                .background(Color("Color"))
                .clipShape(RoundedRectangle(cornerRadius: 16.0))
                .padding(.all, 8.0)
                .shadow(radius: 10)
            }
        }
    }
}
#Preview {
    Card()
}
