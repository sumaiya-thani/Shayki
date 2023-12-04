//
//  SelectButton1.swift
//  Shayki
//
//  Created by SHUAA on 03-12-2023.
//

import Foundation
import SwiftUI
struct SelectButton1: View {
    @Binding var isSelected : Bool
    @State  var text1 : String
    @State var color :Color

    var body: some View {
        
        ZStack{
            Rectangle()
                .frame(width: 115,height: 40)
                .foregroundColor(isSelected ? color : Color("ColorCard"))
                .cornerRadius(10)
            
               
            
            Text(text1)
                .foregroundColor(.white)
        }
    }
    }

    struct SelectButton1_Previews : PreviewProvider {
    static var previews : some View {

        SelectButton1(isSelected:.constant(false),
                     text1: "option ",color : .white)
        
    }
    }
