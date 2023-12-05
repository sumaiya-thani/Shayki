//
//  VehicleInfo.swift
//  GifView_SwiftUI
//
//  Created by SHUAA on 30-11-2023.
//

import SwiftUI


struct VehicleInfo: View {
    @EnvironmentObject var VM : CarViewModel
       @State var modelNum : String = ""
       @State var isMainScreenPresented = false
       @State private var isSelected1 = false
       @State private var isSelected2 = false
       @State private var isSelected3 = false
       @State var text1 : String = ""
       @State var text2 : String = ""
       @State var text3 : String = ""
       @State private var selection : String?
       @State private var selectedOption: String = ""
       private let options = ["1999","2000","2001","2002","2003","2004","2005","2006","2007","2008","2009","2010","2011","2012","2013","2014","2015","2016","2017","2018","2019","2020","2021","2022","2023","2024","2025","2026","2027","2028","2029","2030"]
       @State var selectedDate = Date()
       @Environment(\.presentationMode) var presentationMod
       var body: some View {
           NavigationView {
               VStack{
                   
                   ZStack {
                       Color ("ColorRec 1") .edgesIgnoringSafeArea(.all)
                       VStack{
                           Text(" Number of cylinders in your car's engine?")
                               .foregroundColor(Color.white)
                               .fontWeight(.regular)
                               .fontWeight(/*@START_MENU_TOKEN@*/.regular/*@END_MENU_TOKEN@*/)
                               .foregroundColor(Color.white)
                               .padding(.bottom)
                               .padding(.trailing,80)
                               .accessibilityIdentifier(/*@START_MENU_TOKEN@*/"Identifier"/*@END_MENU_TOKEN@*/)
                           
                           ScrollView(.horizontal){
                               HStack{

                                   SelectButton(isSelected: $isSelected1, text: "4- cylinder engine", color: Color("ColorRec"))
                                       .onTapGesture {
                                           isSelected1.toggle()
                                           if  isSelected1{
                                               isSelected2=false
                                               isSelected3=false
                                           }
                                       }


                                   SelectButton(isSelected: $isSelected2, text: "6- cylinder engine", color: Color("ColorRec"))
                                       .onTapGesture {
                                           isSelected2.toggle()
                                           if  isSelected2{
                                               isSelected1=false
                                               isSelected3=false
                                           }
                                       }

                                   SelectButton(isSelected: $isSelected3, text: "8- cylinder engine", color: Color("ColorRec"))
                                       .onTapGesture {
                                           isSelected3.toggle()
                                           if  isSelected3{
                                               isSelected1=false
                                               isSelected2=false
                                           }
                                       }

                                       
                               }
                           } .padding(.leading)
                             //0  .padding(.bottom,40)
                           
                           
                           Text("Model")
                               .font(.title2)
                               .foregroundColor(Color.white)
                               .padding(.trailing,260)
                               .padding(.top)
                                                   
                           Picker("", selection: $selectedOption) {
                               ForEach(options, id: \.self) { option in
                                   Text(option)
                                   
                               }
                               
                           } .frame(width: 110,height: 40)
                               .background(Color(.colorCard))
                               .accentColor(Color.white)
                               .cornerRadius(10)
                               .padding(.trailing,240)
                               .opacity(0.9)
                               .environment(\.colorScheme, .dark)
                               


                           
                           
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
                       .navigationBarTitle("Vechicle Info")
                       
                       .navigationBarTitleDisplayMode(.inline)
                       .toolbar {
                           ToolbarItem(placement: .cancellationAction) {
                               Button(action: {
                                   self.presentationMod
                                       .wrappedValue
                                       .dismiss()
                               }) {
                                   
                                   HStack{
                                       Image(systemName: "arrow.backward")
                                           .foregroundColor(.black)
                                       Text("Back")
                                           .foregroundColor(.black)
                                   }
                               }
                           }
                           ToolbarItem(placement: .confirmationAction) {
                               Button(action: {
                                   
                                   // Save your data here
                                   isMainScreenPresented.toggle()
   //                              let carIfo =  CarInfo( odometerReading: text1, dailyKilometersDriven:  text2, oilTypeBrand: text3)
                                   
   //                                VM.CarInfo.dailyKilometersDriven = text2
   //
   //                                VM.CarInfo.oilTypeBrand = text3
   //
   //                                VM.CarInfo.odometerReading = text1
                                   
                                   VM.setValues(carmodel: selectedOption,str1:  text1, str2: text2, str3: text3)}) {
                                   HStack{
                                       Text("Save")
                                           .foregroundColor(.black)
                                   }
                               }
                               //                            .background(
                               //                                NavigationLink(
                               //                                    destination: MainScreen(dateNo: $selectedOption.wrappedValue)
                               //                                        .navigationBarBackButtonHidden(true), // Hide back button
                               //                                    isActive: $isMainScreenPresented
                               //                                ) {
                               //                                    EmptyView()
                               //                                }.ignoresSafeArea(.all)
                               //                                .hidden())
                           }
                       }
                       
                   }
               }
           }.navigationBarBackButtonHidden(true)
       }
   }
    #Preview {
    VehicleInfo()
    }

