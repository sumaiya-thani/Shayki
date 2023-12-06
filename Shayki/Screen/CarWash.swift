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
            @State private var isSelected4 = false
            @State private var isSelected5 = false
            @State private var isSelected6 = false
            @State var toggle = false
            @State var selectedDate = Date()
            @Environment(\.presentationMode) var presentationMode
         
 var body: some View {
              VStack {
                  NavigationView {
                      ZStack{
                          Color("Color")
                              .ignoresSafeArea(.all)
                          VStack{
                              
                              Text("Reminder timing")
                                  .fontWeight(.regular)
                                  .foregroundColor(Color.white)
                                  .multilineTextAlignment(.leading)
                                  .padding(.trailing, 227.0)
                                  .padding(.top, 83.0)
                              
                              
                              DatePicker("" , selection:$selectedDate,
                                         displayedComponents: [.date])
                              
                              .padding(.trailing,250)
                              .accentColor(Color.blue)
                              .environment(\.colorScheme, .dark)
                              .datePickerStyle(CompactDatePickerStyle())
                              .padding(.vertical, 21.0)
                              
                              Text("Select when you'd like to receive reminders")
                                  .fontWeight(.regular)
                                  .foregroundColor(Color.white)
                                  .multilineTextAlignment(.leading)
                                  .padding(.top, 42.0)
                                  .padding([.leading],0.0)
                              
                              
                              
                              
                              ScrollView(.horizontal){
                                  HStack{
                                      SelectButton2(isSelected: $isSelected4, text2: "Month before", color:Color("ColorRec") )
                                          .onTapGesture {
                                              isSelected4.toggle()
                                              if  isSelected4{
                                                  isSelected5=false
                                                  isSelected6=false
                                              }
                                          }
                                      
                                      SelectButton2(isSelected: $isSelected5, text2: "Week before", color: Color("ColorRec"))
                                          .onTapGesture {
                                              isSelected5.toggle()
                                              if  isSelected5{
                                                  isSelected4=false
                                                  isSelected6=false
                                              }
                                          }
                                      SelectButton2(isSelected: $isSelected6, text2: "3 Days before", color: Color("ColorRec"))
                                          .onTapGesture {
                                              isSelected6.toggle()
                                              if  isSelected6{
                                                  isSelected4=false
                                                  isSelected5=false
                                              }
                                          }
                                  }}.padding(.top)
                                  .padding(.leading)
                              
                              VStack{
                                  
                                  
                                  Toggle(isOn: $toggle)
                                  {
                                      Text("Send confirmation after reminder ")
                                          .foregroundColor(.white)
                                          .padding(.leading)
                                      
                                  }
                                  
                                  .toggleStyle(SwitchToggleStyle(tint: .green))
                                  //  .padding(.top, 400)
                                  
                              }
                              .padding(.top, 44.0)
                              .padding()
                              
                              
                          } .padding(.bottom,200)
                          
                          
                              .navigationBarTitleDisplayMode(.inline)
                          
                              .toolbar {
                                  ToolbarItem(placement: .confirmationAction) {
                                      HStack{
                                          Button(action: {
                                              
                                          }) {
                                              Text("       Add")
                                                  .foregroundColor(.white)
                                                  .padding(.leading,-110)
                                          }

                                          Text("             Car Wash        ").font(.headline).foregroundColor(Color.white)
                                              .padding(.trailing,45)
                                          Button(action: {
                                              // Save your data here
                                              self.presentationMode.wrappedValue.dismiss()

                                          }) {
                                              Text("Cancel")
                                                  .foregroundColor(.white)
                                          }
                                          
                                      }
                                  }
                              }
                          
                          
                      }
                  }
              }}
      }




 #Preview {
     CarWash()
 }
