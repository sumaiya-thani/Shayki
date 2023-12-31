//
//  SelectButton.swift
//  Shayki
//
//  Created by SHUAA on 03-12-2023.
//
import Foundation
import SwiftUI
struct SelectButton: View {
    @Binding var isSelected : Bool
    @State  var text : String
    @State var color :Color

    var body: some View {
        
        ZStack{
            Rectangle()
                .frame(width: 150,height: 40)
                .foregroundColor(isSelected ? color : Color("ColorCard"))
                .cornerRadius(10)
            
            
            Text(text)
                .foregroundColor(.white)
        }

    }
    }

    struct SelectButton_Previews : PreviewProvider {
    static var previews : some View {

        SelectButton(isSelected:.constant(false),
                     text: "option ",color : .white)
        
    }
    }
