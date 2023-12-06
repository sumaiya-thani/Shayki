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
    @State private var selectedEngine: String?
       @State var text1 : String = ""
       @State var text2 : String = ""
       @State var text3 : String = ""
       @State private var selection : String?
       @State private var selectedOption: String = ""
       private let options = ["1999","2000","2001","2002","2003","2004","2005","2006","2007","2008","2009","2010","2011","2012","2013","2014","2015","2016","2017","2018","2019","2020","2021","2022","2023","2024","2025","2026","2027","2028","2029","2030"]
       @State var selectedDate = Date()
       @Environment(\.presentationMode) var presentationMod
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack{
            Color(Color("Color"))
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            ScrollView{
            VStack(alignment: .center){
                Spacer()
                //                Text(" Number of cylinders in your car's engine? ").padding(.leading,-36.0)
                //                    .foregroundColor( .white )
                ScrollView(.horizontal,showsIndicators: false) {
                    Spacer()
                    Spacer()
                    Spacer()
                    Text(" Number of cylinders in your car's engine? ")
                        .padding(.leading,-250)
                        .foregroundColor( .white )
                    HStack {
                        Button(action: {
                            selectedEngine = "4-cylinder engine"
                        }) {
                            Text("4-cylinder engine")
                                .font(.body)
                                .fontWeight(.light)
                                .foregroundColor( .white )
                                .padding()
                                .frame(width: 190,height: 40)
                                .background(selectedEngine == "4-cylinder engine" ? Color("sheetBg") : .gray)
                                .cornerRadius(10)
                        }
                        
                        Button(action: {
                            selectedEngine = "6-cylinder engine"
                        }) {
                            Text("6-cylinder engine")
                            
                                .foregroundColor( .white )
                                .padding()
                                .frame(width: 190,height: 40)
                                .background(selectedEngine == "6-cylinder engine" ? Color("sheetBg") : .gray)
                                .cornerRadius(10)
                        }
                        
                        Button(action: {
                            selectedEngine = "8-cylinder engine"
                        }) {
                            Text("8-cylinder engine")
                                .font(.body)
                            
                                .foregroundColor( .white )
                                .padding()
                                .frame(width: 190,height: 40)
                                .background(selectedEngine == "8-cylinder engine" ? Color("sheetBg") : .gray)
                                .cornerRadius(10)
                        }
                        
                        
                    }
                    .padding()
                    
                }
                VStack(alignment: .leading){
                    
                    Text(" Model ")
                    
                        .padding(.leading, -14.0)
                        .foregroundColor( .white )
                    Picker("Select Year", selection: $selectedOption) {
                        ForEach(options, id: \.self) { option in
                            Text(option)
                            
                        }
                        
                        
                        
                    }
                    
                    .background(Color(.colorCard))
                    .accentColor(Color.white)
                    .cornerRadius(10)
                    
                    .opacity(0.9)
                    .environment(\.colorScheme, .dark)
                    
                }.padding(.leading, -163.0)
                    .padding(.vertical, 15.0)
                TextField("Odometer Reading", text: $text1)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.white.opacity(0.2).cornerRadius(15))
                    .font(.headline)
                    .keyboardType(.decimalPad)
                
                
                
                    .padding(.horizontal)
                TextField(" Enter your daily kilometers driven ", text: $text2    )
                    .padding()
                
                    .foregroundColor(.white)
                    .background(Color.white.opacity(0.2).cornerRadius(15))
                    .font(.headline)
                    .keyboardType(.decimalPad)
                
                    .padding(.horizontal)
                TextField(" Oil Type/Brand ", text: $text3 )
                    .padding()
                    .foregroundColor(.black)
                    .background(Color.white.opacity(0.2).cornerRadius(15))
                    .font(.headline)
                    .padding(.horizontal)
                Spacer()
                
                
            }
        }
                .ignoresSafeArea(.keyboard, edges: .bottom)
        }.background(Color("Color"))
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                       
                        Text("Vehicle Info").font(.headline).foregroundColor(Color.white)
                    }
                    
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: MainScreen()) {
                        Button(action: {
                            // Save your data here
                            isMainScreenPresented.toggle()
                            VM.setValues(carmodel: selectedOption,str1: Int(text1) ?? 0, str2: Int(text2) ?? 0, str3: text3)
                            self.presentationMode.wrappedValue.dismiss()
                        }
                        ) {
                            HStack{
                                Text("Save")
                                    .foregroundColor(.white)
                                    .symbolRenderingMode(.palette)
                            }
                        }
                    }
                }
                
            }
        
       
    }
}

    #Preview {
    VehicleInfo()
    }

//Button(action: {
//    // Save your data here
//    isMainScreenPresented.toggle()
//    VM.setValues(carmodel: selectedOption,str1:  text1, str2: text2, str3: text3)
//}
//) {
//    HStack{
//        Text("Save")
//            .foregroundColor(.white)
//            .symbolRenderingMode(.palette)
//    }
//}
