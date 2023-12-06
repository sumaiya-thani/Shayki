//
//  Dialog.swift
//  Shayki
//
//  Created by sumaiya on 01/12/2566 BE.
//


import SwiftUI

struct Dialog: View {
    @EnvironmentObject var VM : CarViewModel

    @State private var progressValue: Double = 0.0 // Set your initial value here
       let maxValue: Double = 7000 // Set your maximum value here
       let minTimeInterval: TimeInterval = 0.5 // Minimum time interval between updates
       let maxTimeInterval: TimeInterval = 5.0 // Maximum time interval between updates

//
//    @State private var odometerReading:Int = 5000
//    @State private var oilName:String = ("\(VM.carInfo.oilTypeBrand)")
      
    var body: some View {
    
        
        VStack{
            
            Text("\(VM.carInfo.oilTypeBrand)")
                .font(.system(size: 14))
                .fontWeight(.bold)
                .padding(/*@START_MENU_TOKEN@*/EdgeInsets()/*@END_MENU_TOKEN@*/)
                .padding(.bottom, 6.0)
            
            //dialog
          
            VStack {
                        ZStack {
                            Circle()
                                .stroke(Color.white.opacity(0.2), style: StrokeStyle(lineWidth: 6))
                                .frame(width: 35, height: 35)

                            Circle()
                                .trim(from: 0, to: CGFloat(Double(VM.carInfo.odometerReading) / maxValue))
                                .stroke(
                                    AngularGradient(
                                        gradient: Gradient(colors: [.white, .white]),
                                        center: .center
                                    ),
                                    style: StrokeStyle(lineWidth: 6, lineCap: .round, lineJoin: .round)
                                )
                                .rotationEffect(Angle(degrees: -90))
                                
                                .frame(width: 35, height: 35)

                        }
                    }
                    .onAppear {
                        
                        NotificationManager.instance.schedualeNotification()
                        
                    }
              
            
            HStack{
                Text("\(VM.carInfo.odometerReading)")
                    .padding(.top, 3.0)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(Color.gray)
                
                Text("/ 7,000")
                    .padding(.top, 3.0)
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundColor(Color.gray)
                
            }
            
            
        } .frame(width: 164, height: 132)
            .foregroundColor(.white)
            .background(Color("Color"))
            .clipShape(RoundedRectangle(cornerRadius: 16.0))
            .padding(.all, 8.0)
            .shadow(radius: 10)
        
        
        
        
        
            
        }
    private func startTimer() {
           Timer.scheduledTimer(withTimeInterval: calculateTimeInterval(), repeats: true) { timer in
               withAnimation {
                   // Adjust the step value based on your needs
                   let stepValue = (maxValue / 7500) * 100
                   self.progressValue += stepValue
                   if self.progressValue >= self.maxValue {
                       self.progressValue = self.maxValue
                       timer.invalidate()
                   }
               }
           }
       }


        private func calculateTimeInterval() -> TimeInterval {
            // Adjust this calculation based on your needs
            let progressPercentage = progressValue / maxValue
            return minTimeInterval + (maxTimeInterval - minTimeInterval) * (1.0 - progressPercentage)
        }
    }
//prograss par


#Preview {
    Dialog()
}
