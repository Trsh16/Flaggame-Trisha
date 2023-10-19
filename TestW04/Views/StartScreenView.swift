//
//  StartScreen.swift
//  TestW04
//
//  Created by MacBook Pro on 18/10/23.
//

import SwiftUI

struct StartScreenView: View {
    @State private var showingView = false
    var body: some View {
        NavigationStack{
            VStack{
                ZStack(alignment: .center){
                    Image("Thailand").resizable().frame(height: 800)
                    VStack(alignment:.center){
                        Text("The Flag Game").padding().font(.system(size: 60,weight: .heavy, design: .rounded)).foregroundColor(.mint).shadow(radius: 20) .multilineTextAlignment(.center)
                        Button("Start"){
                            GlobalVariable.newGame()
                            showingView = true
                        }
                        .buttonStyle(.bordered).foregroundColor(.mint).font(.system(size: 30, weight: .medium, design: .rounded)).navigationDestination(
                            isPresented: $showingView) {
                                ContentView()
                                Text("Continue?")
                                    .hidden()
                            }.navigationBarBackButtonHidden(true)
                        
                    }
                }
                
            }
            
        }
        
    }
}

struct StartScreenView_Previews: PreviewProvider {
    static var previews: some View {
        StartScreenView()
    }
}
