//
//  SelectButton3.swift
//  Shayki
//
//  Created by SHUAA on 03-12-2023.
//

import Foundation
import SwiftUI
struct SelectButton3: View {
    @Binding var isSelected : Bool
    @State  var text3 : String
    @State var color :Color

    var body: some View {
        
        ZStack{
            Rectangle()
                .frame(width: 115,height: 40)
                .foregroundColor(isSelected ? color : .white)
                .cornerRadius(16)
               
            
            Text(text3)
                .foregroundColor(.black)
        }
    }
    }

    struct SelectButton3_Previews : PreviewProvider {
    static var previews : some View {

        SelectButton3(isSelected:.constant(false),
                     text3: "option ",color : .white)
        
    }
    }
