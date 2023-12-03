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
                    
                    Color("ColorRec")
                        .ignoresSafeArea(.all)
                 
                    VStack(){
                        Text("Reminder timing")
                            .fontWeight(.regular)
                            .foregroundColor(Color.white)
                            .padding(.trailing,190)
                        
                        
                        
                        DatePicker("" , selection:$selectedDate,
                                   displayedComponents: [.date])
                        .padding(.trailing,220)
                     
                        .accentColor(Color.white)
                        .datePickerStyle(CompactDatePickerStyle())
                      
                        
                        .padding()
                        
                        Text(" Select when you'd like to receive reminders")
                            .fontWeight(/*@START_MENU_TOKEN@*/.regular/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color.white)
                            .accessibilityIdentifier(/*@START_MENU_TOKEN@*/"Identifier"/*@END_MENU_TOKEN@*/)
                        
                        
                        ScrollView(.horizontal){
                            HStack{
                                SelectButton3(isSelected: $isSelected1, text3: "Month before", color:.green )
                                    .onTapGesture {
                                        isSelected1.toggle()
                                        if  isSelected1{
                                            isSelected2=false
                                            isSelected3=false
                                        }
                                    }
                                
                                SelectButton3(isSelected: $isSelected2, text3: "Week before", color: .green)
                                    .onTapGesture {
                                        isSelected2.toggle()
                                        if  isSelected2{
                                            isSelected1=false
                                            isSelected3=false
                                        }
                                    }
                                SelectButton3(isSelected: $isSelected3, text3: "3 Days before", color: .green)
                                    .onTapGesture {
                                        isSelected3.toggle()
                                        if  isSelected3{
                                            isSelected1=false
                                            isSelected2=false
                                        }
                                    }
                            }}.padding(.leading,20)
                       
                        
                      
                            .padding()
                            
                            Toggle(isOn: $toggle)
                            {
                                Text("Send confirmation after reminder ")
                                    .foregroundColor(.white)
                                
                                
                                
                            }
                        
                            
                            .padding(.leading,35)
                        
                        
                        
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
                                    Text("Save")
                                        .foregroundColor(.black)
                                }
                                
                            }
                        }
                    }
                    
                }
            }
        }
    }}
#Preview {
    CarWash()
}
