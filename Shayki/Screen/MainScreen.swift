//
//  MainScreen.swift
//  Shayki
//
//  Created by sumaiya on 01/12/2566 BE.
//

import SwiftUI
import _AppIntents_SwiftUI
import Intents
import IntentsUI

struct MainScreen: View {

   // let carIfo: CarInfo
    @EnvironmentObject var VM : CarViewModel

    let userIlnput = ["CarViewModel","let userIlnput: [UserInput]"]
    @State var title = ""
    @State var notes = ""
    @State private var showingSheet1 = false
    @State private var showingSheet2 = false
    @State private var showingSheet3 = false
    @State private var showingSheet4 = false
    @State private var showingSheet5 = false
    @State private var vehicleInfo = VehicleInfo()
    // //Info from the user
    //    @State private var cylindersInput: String = ""
    //        @State private var odometerInput: String = ""
    @State private var dailyKilometersInput: String = "100"
    //        @State private var oilTypeBrand: String = ""
    //state for siri
    @State private var isVisible = true
    
    var body: some View {
        NavigationView {
            VStack{
                    ZStack{
                        Color("Color")
                            .ignoresSafeArea()
                        
                        RoundedRectangle(cornerRadius: 35).fill(Color("Color 2"))
                            .padding(.bottom,-170)
                            .frame(width: 400,height: 500)
//                            .offset(x: 0, y: 80)
                        VStack {
                            
                        }  .toolbar {
                            ToolbarItem(placement: .navigationBarLeading) {
                                NavigationLink(destination: Reminders()) {
                                    Image(systemName: "bell.fill")
                                        .foregroundColor(.white)
                                }
                            }
                            ToolbarItem(placement: .navigationBarTrailing) {
                                NavigationLink(destination: VehicleInfo()) {
                                    Image(systemName: "gearshape.fill")
                                        .foregroundColor(.white)
                                        .symbolRenderingMode(.palette)
                                      
                                }
                            }
                        }.background(Color("Color"))
                        
                        HStack{
                            Text("Tesla Model \(VM.carInfo.carModel)").font(.title3)
//                            Text("Tesla Model X").font(.title3)
                                .foregroundColor(.white)
                            Image(systemName: "pencil")
                                .foregroundColor(.white)
//                                .font(.title3)
//                                .fontWeight(.bold)
                            
                        }.padding(.bottom,730)
                        
                        Image("carImg")
//                            
                            .shadow(radius: 20)
                            .padding(.bottom,575)
                        VStack{
                            ScrollView{
                                
                                VStack{
                                    SiriTipView(intent: StartAppIntent(), isVisible: $isVisible).frame(width: 340) .siriTipViewStyle(.automatic).padding(.bottom, 3.0)
                                    HStack(){
                                        
                                        VStack(){
                                            Text("\(VM.carInfo.dailyKilometersDriven)")
                                            
                                                .font(.title)
                                                .fontWeight(.medium)
                                                .padding(.bottom, 2.0)
                                            Text("Km")
                                            
                                                .font(.title3)
                                                .fontWeight(.medium)
                                                .padding(.top, 20.0)
                                            
                                            
                                            
                                        }.padding(.leading, 37.0)
                                        Spacer()
                                        VStack(alignment: .center){
                                            Text("4")
                                                .font(.title)
                                                .fontWeight(.medium)
                                                .padding(.bottom, 2.0)
                                            
                                            Text("Average \nHour")
                                            
                                                .font(.title3)
                                                .fontWeight(.medium)
                                            
                                            
                                        }.padding(.trailing, 30.0)
                                    }.multilineTextAlignment(.center)
                                        .frame(width: 347, height: 132)
                                        .foregroundColor(.white)
                                        .background(Color("Color"))
                                        .cornerRadius(16)
                                        .shadow(radius: 10)
                                    VStack(alignment:.leading){
                                        HStack{
                                            
                                            Button(action: {
                                                showingSheet1.toggle()
                                            }) {
                                                VStack {
                                                    
                                                    Text("Vehicle"+" "+"Insurance")
                                                    
                                                        .font(.system(size: 14))
                                                    
                                                        .fontWeight(.bold)
                                                        .padding(.horizontal, 7.0)
                                                    Text("20")
                                                    
                                                        .font(.title)
                                                        .fontWeight(.bold)
                                                        .padding(.top, 1.0)
                                                    Text("Days Left")
                                                    
                                                        .font(.title3)
                                                        .fontWeight(.medium)
                                                        .padding(.top, -9.0)
                                                        .foregroundColor(Color.gray)
                                                    
                                                    
                                                }
                                                .frame(width: 164, height: 132)
                                                .foregroundColor(.white)
                                                .background(Color("Color"))
                                                .clipShape(RoundedRectangle(cornerRadius: 16.0))
                                                .padding(.all, 8.0)
                                                .shadow(radius: 10)
                                            }
//                                            .sheet(isPresented: $showingSheet1) {
//                                                VehicleInfo()
//                                                
//                                            }
                                            
                                            
                                            Dialog()
                                            
                                            
                                        }
                                            HStack{
                                            Button(action: {
                                                showingSheet2.toggle()
                                            }) {
                                                VStack {
                                                    Text("License"+" "+"Expiration")
                                                        .padding(.bottom,14.0)
                                                        .font(.system(size: 14))
                                                        .fontWeight(.bold)
                                                    
                                                    Image(systemName: "person.text.rectangle")
                                                        .font(.system(size: 48))
                                                }
                                                .frame(width: 164, height: 132)
                                                .foregroundColor(.white)
                                                .background(Color("Color"))
                                                .clipShape(RoundedRectangle(cornerRadius: 16.0))
                                                .padding(.all, 8.0)
                                                .shadow(radius: 10)
                                            }
                                            .sheet(isPresented: $showingSheet2) {
                                                LicenseView()
                                            }                                            
                                            Button(action: {
                                                showingSheet3.toggle()
                                            }) {
                                                VStack {
                                                    Text("Regular Upkeepe")
                                                        .padding()
                                                        .font(.system(size: 14))
                                                        .fontWeight(.bold)
                                                    
                                                    Image(systemName: "gearshape.2")
                                                        .font(.system(size: 48))
                                                }
                                                .frame(width: 164, height: 132)
                                                .foregroundColor(.white)
                                                .background(Color("Color"))
                                                .clipShape(RoundedRectangle(cornerRadius: 16.0))
                                                .padding(.all, 8.0)
                                                .shadow(radius: 10)
                                            }
                                            .sheet(isPresented: $showingSheet3) {
                                                RoutineMaintenance()
                                            }
                                        }
                                        HStack{
                                            Button(action: {
                                                showingSheet4.toggle()
                                            }) {
                                                VStack(alignment: .center) {
                                                    Text("Car Wash")
                                                        .padding()
                                                    
                                                        .font(.system(size: 14))
                                                        .fontWeight(.bold)
                                                    
                                                    Image(systemName: "car.side")
                                                        .font(.system(size: 48))
                                                }
                                                
                                                .frame(width: 164, height: 132)
                                                .foregroundColor(.white)
                                                .background(Color("Color"))
                                                .clipShape(RoundedRectangle(cornerRadius: 16.0))
                                                .padding(.all, 8.0)
                                                .shadow(radius: 10)
                                            }
                                            .sheet(isPresented: $showingSheet4) {
                                                CarWash()
                                            }
                                            Button(action: {
                                                showingSheet5.toggle()
                                            }) {
                                                VStack(alignment: .center) {
                                                    
                                                    Image(systemName: "plus.circle.fill")
                                                        .font(.system(size: 48))
                                                }
                                                
                                                .frame(width: 164, height: 132)
                                                .foregroundColor(.white)
                                                .background(Color("Color"))
                                                .opacity(0.9)
                                                .clipShape(RoundedRectangle(cornerRadius: 16.0))
                                                .padding(.all, 8.0)
                                                .shadow(radius: 10)
                                            }
                                            .sheet(isPresented: $showingSheet5) {
                                                CustomReminder()
                                                
                                            }
                                        }
                                       
                                    }
                                }
                                //                        .offset(x: 0, y: 80)
                                //                        .padding(.bottom,-200.0)
                                
                            }.padding(.top,150.0)
                        }.padding(.top,8)
                    }
                    
//                }
            }.background(Color("Color"))
            
        }
        .tint(.white)
        
    }

}


//#Preview {
//    MainScreen(carIfo: CarInfo())
//}
