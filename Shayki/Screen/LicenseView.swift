//
//  LicenseView.swift
//  GifView_SwiftUI
//
//  Created by SHUAA on 29-11-2023.
//

import SwiftUI

struct LicenseView: View {    @State var toggle = false
    @State var selectedDate = Date()
    @State private var isSelected1 = false
    @State private var isSelected2 = false
    @State private var isSelected3 = false
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
              VStack {
                  NavigationView {
                      ZStack{
                          Color("ColorRec")
                              .ignoresSafeArea(.all)
                          
                          Text(" Choose the date when your license will expire")
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
                                  
                                  SelectButton1(isSelected: $isSelected2, text1: "Week before", color: .green)
                                      .onTapGesture {
                                          isSelected2.toggle()
                                          if  isSelected2{
                                              isSelected1=false
                                              isSelected3=false
                                          }
                                      }
                                  SelectButton1(isSelected: $isSelected3, text1: "3 Days before", color: .green)
                                      .onTapGesture {
                                          isSelected3.toggle()
                                          if  isSelected3{
                                              isSelected1=false
                                              isSelected2=false
                                          }
                                      }
                              }}.padding(.leading,35)
                          VStack{
                              
                          
                              Toggle(isOn: $toggle)
                              {
                                  Text("Send confirmation after reminder ")
                                      .foregroundColor(.white)
                                     
                                      
                      
                              }
                             .padding(.top, 200)
                             .padding(.leading,20)
                             
                          }
                          .padding()
                          
                          

                              .navigationBarTitle("License Expiration   ")
                          
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
    LicenseView()
}
