//
//  CarWash.swift
//  GifView_SwiftUI
//
//  Created by SHUAA on 30-11-2023.
//

import SwiftUI

struct CarWash: View {
    @State var toggle = false
    @State var selectedDate = Date()
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
              VStack {
                  NavigationView {
                      ZStack{
                          Color("ColorRec")
                              .ignoresSafeArea(.all)
                          
                          Text("Reminder timing")
                              .fontWeight(.regular)
                              .foregroundColor(Color.white)
                              .padding(.top, -280)
                          
                          
                          
                          DatePicker("" , selection:$selectedDate,
                          displayedComponents: [.date])
                          .padding(.top, -200)
                          .padding(.trailing,240)
                          .accentColor(Color.white)
                              .datePickerStyle(CompactDatePickerStyle())
                          
                          
                          Text(" Select when you'd like to receive reminders")
                              .fontWeight(/*@START_MENU_TOKEN@*/.regular/*@END_MENU_TOKEN@*/)
                              .foregroundColor(Color.white)
                              .padding(.top, -80)
                              .accessibilityIdentifier(/*@START_MENU_TOKEN@*/"Identifier"/*@END_MENU_TOKEN@*/)

                          
                          HStack{
                      Button(action: {}) {
                          Text("Month before ")
                              .font(.callout)
                              .padding(9)
                            .foregroundColor(.white)
                            .background(Color("colorCard"))
                             .cornerRadius(10)
      //                       .frame(width:150, height:30)

                      }
                      
                              Button(action: {}) {
                                  Text("Week before")
                                      .font(.callout)
                                      .padding(9)
                                      .foregroundColor(.white)
                                      .background(Color("ColorCard"))
                                      .cornerRadius(10)
      //                                .frame(width:150, height:30)

                                  
                              }
                             
                          Button(action: {}) {
                              Text("3 Days before")
                                  .font(.callout)
                          .padding(9)
                      .foregroundColor(.white)
                      .background(Color("ColorCard"))
                     .cornerRadius(10)
      //               .frame(width:150, height:30)
              
                          }
                      
                                  }
                          .padding(.top,180)
                        
                          VStack{
                              
                          
                              Toggle(isOn: $toggle)
                              {
                                  Text("Send confirmation after reminder ")
                                      .foregroundColor(.white)
                                     
                                      
                      
                              }
                              .padding(.top, 400)
                             
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
                                          Text("Save")
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
