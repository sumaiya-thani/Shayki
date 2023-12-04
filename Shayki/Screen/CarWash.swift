//
//  CarWash.swift
//  GifView_SwiftUI
//
//  Created by SHUAA on 30-11-2023.
//

import SwiftUI

struct CarWash: View {
   
    @State private var isSelected1 = false
    @State private var isSelected2 = false
    @State private var isSelected3 = false
    @State var toggle = false
    @State var selectedDate = Date()
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
      
        VStack {
            NavigationView {
                ZStack{
                    
                    Color("ColorRec 1")
                        .ignoresSafeArea(.all)
                 
                    VStack(){
                        Text("Reminder timing")
                            .font(.title2)
                            .foregroundColor(Color.white)
                            .padding(.trailing,190)
                            .padding(.bottom,190)
                        
                        
                        DatePicker("" , selection:$selectedDate,
                        displayedComponents: [.date])
                        .padding(.top, -160)
                        .padding(.trailing,240)
                        .accentColor(Color.blue)
                        .colorMultiply(.black)
                        .environment(\.colorScheme, .dark)
                            .datePickerStyle(CompactDatePickerStyle())
                        
                        .padding()
                        
                        Text(" Select when you'd like to receive reminders")
                            .fontWeight(.regular)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 200)
                            .accessibilityIdentifier(/*@START_MENU_TOKEN@*/"Identifier"/*@END_MENU_TOKEN@*/)

                    }
                        
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
                                .padding(.top, 200)

                            
                            SelectButton1(isSelected: $isSelected2, text1: "Week before", color: .green)
                                .onTapGesture {
                                    isSelected2.toggle()
                                    if  isSelected2{
                                        isSelected1=false
                                        isSelected3=false
                                    }
                                }
                                .padding(.top, 200)

                            SelectButton1(isSelected: $isSelected3, text1: "3 Days before", color: .green)
                                .onTapGesture {
                                    isSelected3.toggle()
                                    if  isSelected3{
                                        isSelected1=false
                                        isSelected2=false
                                    }
                                }
                          .padding(.top, 200)
                        }}.padding(.leading,35)
                  
                            
                                
                        VStack{
                            
                        
                            Toggle(isOn: $toggle)
                            {
                                Text("Send confirmation after reminder ")
                            .foregroundColor(.white)
                    
                            }
                           .padding(.top, 390)
                           .padding(.leading,20)
                           
                        }
                        .padding()
                        .navigationBarTitle("Car Wash")
                        
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
        }
    }
#Preview {
    CarWash()
}
