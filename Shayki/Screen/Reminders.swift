//
//  Reminders.swift
//  Shayki
//
//  Created by sumaiya on 02/12/2566 BE.
//

import SwiftUI

struct Reminders: View {
    var body: some View {
        
        ZStack{
        
            Color(Color("Color"))
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
          
       
           
            VStack(alignment: .leading){
               
                Text("Sunday, October 23 ") .padding(.bottom, 20.0)
                    .foregroundColor(Color("DisableText"))
                HStack{
                    Text("✅")
                       
                    Text("Oil Change")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                    
                }.padding(.bottom, 3.0)
                Text("great move on scheduling that oil change!")
                    .foregroundColor(Color.white)
                    .padding(.bottom, 10.0)
                HStack{
                    Text("✅")
                       
                    Text("License expiration")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                    
                }.padding(.bottom, 3.0)
                Text("Smart move! \nYou've got your license renewal scheduled ")
              
                    .foregroundColor(Color.white)
                    .padding(.bottom, 10.0)
                
                HStack{
                    Text("☑️")
                       
                    Text("Vehicle"+" "+"Insurance")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                    
                }.padding(.bottom, 3.0)
                Text("Rescheduling your vehicle ")
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 10.0)
                
               
            }
            .padding(
                .top, -300.0)
            .padding(
                .leading, -14.0)
            
            
            
        }.background(Color("Color"))
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                       
                        Text("Reminders").font(.headline).foregroundColor(Color.white)
                    }
                }
                
            }
        
    }
}
#Preview {
    Reminders()
}
