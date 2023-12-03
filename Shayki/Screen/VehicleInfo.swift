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
    
    @Environment(\.presentationMode) var presentationMode
    private let options = ["1999","2000","2001","2002","2003","2004","2005","2006","2007","2008","2009","2010","2011","2012","2003"]
    var body: some View {
        VStack{
            NavigationView{
                ZStack{
                    
                    VStack {
                        
                        ScrollView(.horizontal){
                            
                            HStack{
                                Button(action: {}) {
                                    Text("4- cylinder engine" )
                                        .font(.callout)
                                        .padding(9)
                                        .foregroundColor(.white)
                                        .background(Color("Color"))
                                        .cornerRadius(16)
                                    //                       .frame(width:150, height:30)
                                    
                                }
                                
                                Button(action: {}) {
                                    Text("6- cylinder engine")
                                        .font(.callout)
                                        .padding(9)
                                        .foregroundColor(.white)
                                        .background(Color("Color"))
                                        .cornerRadius(16)
                                    //                                .frame(width:150, height:30)
                                    
                                    
                                }
                                
                                Button(action: {}) {
                                    Text("8- cylinder engine")
                                        .font(.callout)
                                        .padding(9)
                                        .foregroundColor(.white)
                                        .background(Color("Color"))
                                        .cornerRadius(16)
                                    //               .frame(width:150, height:30)
                                    
                                }
                                
                            }
                            .padding(.vertical, 18.0)
                        }.padding(.leading)
                        Text("Model")
                            .padding(.trailing,260)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        
                        
                        
                        Picker("", selection: $selectedOption) {
                            ForEach(options, id: \.self) { option in
                                Text(option)
                                
                            }
                            
                        } .frame(width: 100,height: 50)
                            .background(Color.gray)
                            .cornerRadius(45)
                            .padding(.trailing,260)
                        
                        
                        
                        
                        
                        
                        
                        TextField(" Odometer Reading ", text: $text1)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.white.opacity(0.3).cornerRadius(15))
                            .font(.headline)
                        
                            .padding()
                        TextField(" Enter your daily kilometers driven ", text: $text2)
                            .padding()
                        
                            .foregroundColor(.white)
                            .background(Color.white.opacity(0.3).cornerRadius(15))
                            .font(.headline)
                        
                            .padding()
                        TextField(" Oil Type/Brand ", text: $text3 )
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.white.opacity(0.3).cornerRadius(15))
                            .font(.headline)
                            .padding()
                        
                    }
                }.background(Color("sheetbg"))
            }
            .navigationBarTitle("Vehicle Info ")
            
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

    #Preview {
    VehicleInfo()
    }

