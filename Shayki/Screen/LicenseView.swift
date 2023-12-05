//
//  LicenseView.swift
//  GifView_SwiftUI
//
//  Created by SHUAA on 29-11-2023.
//

import SwiftUI

struct LicenseView: View {   
    @State var toggle = false
      @State private var isSelected1 = false
      @State private var isSelected2 = false
      @State private var isSelected3 = false
      @State private var isSelected4 = false
      @State private var isSelected5 = false
      @State private var isSelected6 = false
      @State var selectedDate = Date()
      @Environment(\.presentationMode) var presentationMode
    
      var body: some View {
      
          VStack {
              NavigationView {
                  ZStack{
                      Color("ColorRec 1")
                          .ignoresSafeArea(.all)
                    VStack{
                          
                          Text("Chosse the date when your license will expire")
                            
                             .fontWeight(/*@START_MENU_TOKEN@*/.regular/*@END_MENU_TOKEN@*/)
                             .foregroundColor(Color.white)
                             .multilineTextAlignment(.leading)
                             .padding(.trailing,40)
                             .padding(.top, 83.0)
                         
                         
                         DatePicker("" , selection:$selectedDate,
                                    displayedComponents: [.date])
                        
                         .padding(.trailing,250)
                         .accentColor(Color.blue)
                         .colorMultiply(.black)
                         .datePickerStyle(CompactDatePickerStyle())
                         .padding(.vertical, 21.0)
                         
                         Text("  Select when you'd like to receive reminders")
                             .fontWeight(.regular)
                             .foregroundColor(Color.white)
                             .multilineTextAlignment(.leading)
                             .padding(.top, 42.0)
                        .padding([.trailing],60.0)
                         
                         
                         
                         
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
                                 SelectButton2(isSelected: $isSelected6, text2: "3 Days before", color:Color("ColorRec"))
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
                          .navigationBarTitle("Linense Expiraation ")
                          
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
      LicenseView()
  }
