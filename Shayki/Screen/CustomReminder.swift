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
           @State var selectedDate2 = Date()
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
                       
                       Text("Reminder timing")
                           .fontWeight(/*@START_MENU_TOKEN@*/.regular/*@END_MENU_TOKEN@*/)
                           .foregroundColor(Color.white)
                           .multilineTextAlignment(.leading)
                           .padding(.trailing, 227.0)
                           .padding(.top)
                       
                       
                       DatePicker("" , selection:$selectedDate2,
                                  displayedComponents: [.date])
                      
                       .padding(.trailing,250)
                       .accentColor(Color.blue)
                       .colorMultiply(.black)
                       .datePickerStyle(CompactDatePickerStyle())
                       
                       
                       .padding()

                       Text(" Select when you'd like to receive reminders")
                           .fontWeight(/*@START_MENU_TOKEN@*/.regular/*@END_MENU_TOKEN@*/)
                           .foregroundColor(Color.white)
                           .padding(.bottom, 10)
                           .padding(.trailing)
                           .accessibilityIdentifier(/*@START_MENU_TOKEN@*/"Identifier"/*@END_MENU_TOKEN@*/)
                           .padding(.trailing,40)
           

                       ScrollView(.horizontal){
                           HStack{
                               SelectButton1(isSelected: $isSelected1, text1: "Month before", color:Color("ColorRec") )
                                   .onTapGesture {
                                       isSelected1.toggle()
                                       if  isSelected1{
                                           isSelected2=false
                                           isSelected3=false
                                       }
                                   }
                                   .padding(.bottom, 150)

                               
                               SelectButton1(isSelected: $isSelected2, text1: "Week before", color: Color("ColorRec"))
                                   .onTapGesture {
                                       isSelected2.toggle()
                                       if  isSelected2{
                                           isSelected1=false
                                           isSelected3=false
                                       }
                                   }
                                   .padding(.bottom, 150)
                               SelectButton1(isSelected: $isSelected3, text1: "3 Days before", color: Color("ColorRec"))
                                   .onTapGesture {
                                       isSelected3.toggle()
                                       if  isSelected3{
                                           isSelected1=false
                                           isSelected2=false
                                       }
                                   }
                           .padding(.bottom, 150)
                           }}
                           .padding(.leading)


                       }

                                       
                   VStack{
                       
                   
                       Toggle(isOn: $toggle)
                       {
                           Text("Send confirmation after reminder ")
                               .foregroundColor(.white)
                             

                       }
                      .padding(.top, 390)
                      .padding(.leading)
                   }.toggleStyle(SwitchToggleStyle(tint: .green))
                   .padding()

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
