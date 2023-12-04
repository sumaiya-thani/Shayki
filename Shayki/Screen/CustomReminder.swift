//
//  CustomReminder.swift
//  GifView_SwiftUI
//
//  Created by SHUAA on 29-11-2023.
//

import SwiftUI

struct CustomReminder: View {
    
        @State var toggle = false
        @State var selectedDate = Date()
        @State private var isSelected1 = false
        @State private var isSelected2 = false
        @State private var isSelected3 = false
        @State var text1 : String = ""
        @State var text2 : String = ""

    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            ZStack{
                Color("ColorRec 1")
                    .ignoresSafeArea(.all)
                VStack{
                    TextField(" Title ", text: $text1)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.white.opacity(0.2).cornerRadius(15))
                        .font(.headline)
                    
                        .padding()
                    TextField(" Note ", text: $text2 )
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.white.opacity(0.2).cornerRadius(15))
                        .font(.headline)
                        .padding()
                    
                    Text("Reminders timing")
                        .font(.title3)
                        .foregroundColor(.white)
                        .padding(.bottom,90)
                        .offset(x:-98,y:10)
                    
                  

                    Text(" Select when you'd like to receive reminders")
                        .fontWeight(/*@START_MENU_TOKEN@*/.regular/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color.white)
                        .padding(.bottom, 10)
                        .padding(.trailing)
                        .accessibilityIdentifier(/*@START_MENU_TOKEN@*/"Identifier"/*@END_MENU_TOKEN@*/)
                        
            

                    ScrollView(.horizontal){
                        HStack{
                            SelectButton1(isSelected: $isSelected1, text1: "Month before", color:.green )
                                .onTapGesture {
                                    isSelected1.toggle()
                                    if  isSelected1{
                                        isSelected2=false
                                        isSelected3=false
                                    }
                                }
                                .padding(.bottom, 150)

                            
                            SelectButton1(isSelected: $isSelected2, text1: "Week before", color: .green)
                                .onTapGesture {
                                    isSelected2.toggle()
                                    if  isSelected2{
                                        isSelected1=false
                                        isSelected3=false
                                    }
                                }
                                .padding(.bottom, 150)
                            SelectButton1(isSelected: $isSelected3, text1: "3 Days before", color: .green)
                                .onTapGesture {
                                    isSelected3.toggle()
                                    if  isSelected3{
                                        isSelected1=false
                                        isSelected2=false
                                    }
                                }
                        .padding(.bottom, 150)
                        }}.padding(.leading,35)
//                        Button(action:{}){
//                            Text("Month before")
//                                .font(.callout)
//                                .padding(9)
//                                .foregroundColor(.white)
//                                .background(Color("ColorCard"))
//                                .cornerRadius(10)
//
//                        }
//
//                        Button(action:{}){
//                            Text("Week before")
//                                .font(.callout)
//                                .padding(9)
//                                .foregroundColor(.white)
//                                .background(Color("ColorCard"))
//                                .cornerRadius(10)
//
//                        }
//                        Button(action:{}){
//                            Text("6 day before")
//                                .font(.callout)
//                                .padding(9)
//                                .foregroundColor(.white)
//                                .background(Color("ColorCard"))
//                                .cornerRadius(10)
//
//                        }

                    }

                                    
                VStack{
                    
                
                    Toggle(isOn: $toggle)
                    {
                        Text("Send confirmation after reminder ")
                            .foregroundColor(.white)
                          

                    }
                   .padding(.top, 390)
                   .padding(.leading)
                }
                .padding()
//                    .padding()
//                        .frame(width: 146, height: 100)
                       
//                        .background(Color("ColorCard"))
//                        .clipShape(RoundedRectangle(cornerRadius: 24.0))
//                        .padding(.trailing)
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
                                               Text("Add")
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
