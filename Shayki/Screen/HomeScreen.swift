//
//  HomeScreen.swift
//  Shayki
//
//  Created by sumaiya on 01/12/2566 BE.
//

import SwiftUI
import _AppIntents_SwiftUI
import Intents
import IntentsUI
struct HomeScreen: View {
    @State var title = ""
    @State var notes = ""
    @State private var showingSheet1 = false
    @State private var showingSheet2 = false
    @State private var showingSheet3 = false
    @State private var showingSheet4 = false
    @State private var showingSheet5 = false
    @State private var isVisible = true

    var body: some View {
        SiriTipView(intent: StartAppIntent(), isVisible: $isVisible)
        
            
    }
}

#Preview {
    HomeScreen()
}
