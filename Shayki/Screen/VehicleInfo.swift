//
//  VehicleInfo.swift
//  GifView_SwiftUI
//
//  Created by SHUAA on 30-11-2023.
//

import SwiftUI

struct VehicleInfo: View {
    @State private var isSelected1 = false
       @State private var isSelected2 = false
       @State private var isSelected3 = false
       @State var text1 : String = ""
       @State var text2 : String = ""
       @State var text3 : String = ""
       @State private var selection : String?
       @State private var selectedOption: String = ""
       private let options = ["1999","2000","2001","2002","2003","2004","2005","2006","2007","2008","2009","2010","2011","2012","2003"]
       var body: some View {
       ZStack{
           Color ("ColorRec 1") .edgesIgnoringSafeArea(.all)
       VStack {
                   Text("Vehicle Info")
                       .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                       .padding(.trailing,220)
                   ScrollView(.horizontal){
                       HStack{
                           SelectButton(isSelected: $isSelected1, text: "4- cylinder engine", color: .accentColor)
                               .onTapGesture {
                                   isSelected1.toggle()
                                   if  isSelected1{
                                       isSelected2=false
                                       isSelected3=false
                                   }
                               }
                           
                           SelectButton(isSelected: $isSelected2, text: "6- cylinder engine", color: .accentColor)
                               .onTapGesture {
                                   isSelected2.toggle()
                                   if  isSelected2{
                                       isSelected1=false
                                       isSelected3=false
                                   }
                               }
                           SelectButton(isSelected: $isSelected3, text: "8- cylinder engine", color: .accentColor)
                               .onTapGesture {
                                   isSelected3.toggle()
                                   if  isSelected3{
                                       isSelected1=false
                                       isSelected2=false
                                   }
                               }
                       }}.padding(.leading)
                   Text("Model")
                       .padding(.trailing,260)
                       .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                   
                   
                 
                   Picker("", selection: $selectedOption) {
                           ForEach(options, id: \.self) { option in
                               Text(option)
                          
                           }
                         
                       } .frame(width: 100,height: 50)
                         .background(Color.white)
                         .cornerRadius(45)
                         .padding(.trailing,260)
                               
                       
                     
                 
                   
                   
                   
                   TextField(" Odometer Reading ", text: $text1)
                       .padding()
                       .foregroundColor(.white)
                       .background(Color.white.opacity(0.2).cornerRadius(15))
                       .font(.headline)
                   
                       .padding()
                   TextField(" Enter your daily kilometers driven ", text: $text2)
                       .padding()
                   
                       .foregroundColor(.white)
                       .background(Color.white.opacity(0.2).cornerRadius(15))
                       .font(.headline)
                   
                       .padding()
                   TextField(" Oil Type/Brand ", text: $text3 )
                       .padding()
                       .foregroundColor(.white)
                       .background(Color.white.opacity(0.2).cornerRadius(15))
                       .font(.headline)
                       .padding()
                   
               }
           }
       }
       }

    #Preview {
    VehicleInfo()
    }

