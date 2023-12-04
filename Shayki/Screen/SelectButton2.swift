//
//  SelectButton2.swift
//  Shayki
//
//  Created by SHUAA on 03-12-2023.
//

import Foundation
import SwiftUI
struct SelectButton2: View {
    @Binding var isSelected : Bool
    @State  var text2 : String
    @State var color :Color

    var body: some View {
        
        ZStack{
            Rectangle()
                .frame(width: 115,height: 40)
                .foregroundColor(isSelected ? color : Color("ColorCard"))
                .cornerRadius(10)
            
               
            
            Text(text2)
            .foregroundColor(.white)        }
    }
    }

    struct SelectButton2_Previews : PreviewProvider {
    static var previews : some View {

        SelectButton2(isSelected:.constant(false),
                     text2: "option ",color :  Color("ColorCard"))
        
    }
    }

