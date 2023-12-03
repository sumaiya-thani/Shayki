//
//  CustomReminder.swift
//  GifView_SwiftUI
//
//  Created by SHUAA on 29-11-2023.
//

import SwiftUI

struct CustomReminder: View {
    
    @State var textFieldText : String = ""
    @State var textFieldText2 : String = ""
    @State var toggle = false

    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            ZStack{
                Color("ColorBg")
                    .ignoresSafeArea(.all)
                VStack{
                    TextField( "Title", text: $textFieldText)
                    //.textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(5)
                        .background(Color.gray.opacity(0.3)).cornerRadius(10)
                        .foregroundColor(.white)
                        .font(.headline)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .padding()
                        .offset(x:0,y:10)
                
               
                    
                    TextField( "Note", text: $textFieldText2)
                        .padding(5)
                    //                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .background(Color.gray.opacity(0.3)).cornerRadius(10)
                        .foregroundColor(.white)
                        .font(.headline)
                    
                        .font(.headline)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .padding()
                        .offset(x:0,y:10)
                    
                    Text("Reminders timing")
                        .foregroundColor(.white)
                        .font(.headline)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .padding()
                        .offset(x:-98,y:10)
                    Text("Select when you'd like to receive reminders")
                        .font(.callout)
                        .foregroundColor(.white)

                    HStack{
                        
                        Button(action:{}){
                            Text("Month before")
                                .font(.callout)
                                .padding(9)
                                .foregroundColor(.white)
                                .background(Color("ColorCard"))
                                .cornerRadius(10)

                        }
                        
                        Button(action:{}){
                            Text("Week before")
                                .font(.callout)
                                .padding(9)
                                .foregroundColor(.white)
                                .background(Color("ColorCard"))
                                .cornerRadius(10)

                        }
                        Button(action:{}){
                            Text("6 day before")
                                .font(.callout)
                                .padding(9)
                                .foregroundColor(.white)
                                .background(Color("ColorCard"))
                                .cornerRadius(10)

                        }

                    }
                                    
                    VStack{
                        Toggle(isOn: $toggle) {
                        Text("Send confirmation after reminder")
                        .foregroundColor(.white)
                    

                        }
                        
                    }
                    .padding()
//                        .frame(width: 146, height: 100)
                       
//                        .background(Color("ColorCard"))
//                        .clipShape(RoundedRectangle(cornerRadius: 24.0))
//                        .padding(.trailing)
                }
                
                
            }
            
                   .navigationBarTitle("Set New Reminder ")
            
                   .navigationBarTitleDisplayMode(.inline)
                   .toolbar {
                       ToolbarItem(placement: .cancellationAction) {
                           Button(action: {
                               self.presentationMode.wrappedValue.dismiss()
                           }) {
                               Text("Cancel")
                                   .foregroundColor(.black)
                           }
                       }

                       ToolbarItem(placement: .confirmationAction) {
                           Button(action: {
                               // Save your data here

                           }) {
                               Text("Save")
                                   .foregroundColor(.black)
                           }
                        
                       }
                   }
        }
    }
}

#Preview {
    CustomReminder ()
}
