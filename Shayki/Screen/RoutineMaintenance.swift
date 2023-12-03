//
//  RoutineMaintenance.swift
//  GifView_SwiftUI
//
//  Created by SHUAA on 30-11-2023.
//

import SwiftUI

struct RoutineMaintenance: View {
          @State var toggle = false
      
      @State var selectedDate = Date()
      @Environment(\.presentationMode) var presentationMode
      var body: some View {
          VStack {
              NavigationView {
                  ZStack{
                      Color("ColorRec 1")
                          .ignoresSafeArea(.all)
                      VStack{
                          Text("  Choose reminder type")
                              .fontWeight(.regular)
                              .foregroundColor(Color.white)
                              .multilineTextAlignment(.leading)
                              .padding([.trailing],200.0)
                          
                          HStack{
                              Button(action: {}) {
                                  Text("Tire Rotation")
                                      .font(.callout)
                                      .padding(9)
                                      .foregroundColor(.white)
                                      .background(Color("Color"))
                                      .cornerRadius(16)
                                  //                       .frame(width:150, height:30)
                                  
                              }
                              
                              Button(action: {}) {
                                  Text("Battery Check")
                                      .font(.callout)
                                      .padding(9)
                                      .foregroundColor(.white)
                                      .background(Color("Color"))
                                      .cornerRadius(16)
                                  //                                .frame(width:150, height:30)
                                  
                                  
                              }
                              
                              Button(action: {}) {
                                  Text("Lubricating")
                                      .font(.callout)
                                      .padding(9)
                                      .foregroundColor(.white)
                                      .background(Color("Color"))
                                      .cornerRadius(16)
                                  //               .frame(width:150, height:30)
                                  
                              }
                              
                          }
                          .padding(.top, 20.0)
                          
                          
                          Text("Reminder timing")
                              .fontWeight(/*@START_MENU_TOKEN@*/.regular/*@END_MENU_TOKEN@*/)
                              .foregroundColor(Color.white)
                              .multilineTextAlignment(.leading)
                              .padding(.trailing, 227.0)
                              .padding(.top, 83.0)
                          //  .padding(.top, -80)
                          //  .multilineTextAlignment(.leading)
                          // .lineLimit(0)
                          // .accessibilityIdentifier(/*@START_MENU_TOKEN@*/"Identifier"/*@END_MENU_TOKEN@*/)
                          
                          DatePicker("" , selection:$selectedDate,
                                     displayedComponents: [.date])
                          //   .padding(.top, -200)
                          .padding(.trailing,240)
                          .accentColor(Color.white)
                          .datePickerStyle(CompactDatePickerStyle())
                          .padding(.vertical, 21.0)
                          
                          Text("  Select when you'd like to receive reminders")
                              .fontWeight(.regular)
                              .foregroundColor(Color.white)
                              .multilineTextAlignment(.leading)
                              .padding(.top, 42.0)
                         .padding([.trailing],50.0)
                          
                          HStack{
                              Button(action: {}) {
                                  Text("Month before ")
                                      .font(.callout)
                                      .padding(9)
                                      .foregroundColor(.white)
                                      .background(Color("Color"))
                                      .cornerRadius(16)
                                  //                       .frame(width:150, height:30)
                                  
                              }
                              
                              Button(action: {}) {
                                  Text("Week before")
                                      .font(.callout)
                                      .padding(9)
                                      .foregroundColor(.white)
                                      .background(Color("Color"))
                                      .cornerRadius(16)
                                  //                                .frame(width:150, height:30)
                                  
                                  
                              }
                              
                              Button(action: {}) {
                                  Text("3 Days before")
                                      .font(.callout)
                                      .padding(9)
                                      .foregroundColor(.white)
                                      .background(Color("Color"))
                                      .cornerRadius(16)
                                  //               .frame(width:150, height:30)
                                  
                              }
                              
                          }
                          .padding(.vertical, 18.0)
                          //  .padding(.top,180)
                          
                          VStack{
                              
                              
                              Toggle(isOn: $toggle)
                              {
                                  Text("Send confirmation after reminder ")
                                      .foregroundColor(.white)
                                      .padding(.leading)
                                  
                              }

                              .toggleStyle(SwitchToggleStyle(tint: .black))
                              //  .padding(.top, 400)
                              
                          }
                          .padding(.top, 44.0)
                          .padding()
                          
                          
                      }
                          .navigationBarTitle("Routine maintenance  ")
                          
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
          }}
  }


#Preview {
    RoutineMaintenance()
}
