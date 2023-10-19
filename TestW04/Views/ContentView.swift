//
//  ContentView.swift
//  TestW04
//
//  Created by Christian on 06/10/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    @State private var showingView = false
    @State private var asean = ["Indonesia", "Singapore", "Malaysia", "Laos", "Philipines", "Cambodia", "Myanmar", "Thailand", "Brunei", "Vietnam"]
    @State private var content = " "
    @State private var result = GlobalVariable.negara.checkWin(GlobalVariable.negara.checkpoint, GlobalVariable.negara.poin)
    
    
    var body: some View {
        ZStack{
            Color.mint
                .ignoresSafeArea()
            VStack{
                Text("Pilih Bendera dari Negara : ")
                    .foregroundStyle(.black)
                Text(asean[GlobalVariable.negara.randomnumber])
                    .foregroundStyle(.black)
            }
            
        }
        
        HStack{
            Spacer()
            VStack{
                ForEach(0..<5) { number in
                    Button {
                        if (GlobalVariable.negara.getAseanCountry().isEmpty){
                            GlobalVariable.negara.addAseanCountry(asean[GlobalVariable.negara.randomnumber])
                            
                        }
                        
                        print(GlobalVariable.negara.getAseanCountry())
                        
                        GlobalVariable.negara.checkpoint = GlobalVariable.negara.checkpoint + 1
                        
                        if (asean[GlobalVariable.negara.randomnumber]==asean[number])
                        {
                            GlobalVariable.negara.poin = GlobalVariable.negara.poin + 1
                            
                            if (GlobalVariable.negara.checkpoint < 10){
                                checkExist(asean)}
                            print("poin:" , GlobalVariable.negara.poin)
                            print("checkpoin:" ,GlobalVariable.negara.checkpoint)
                            print("jumlah:" , GlobalVariable.negara.aseanName.count)
                            if (GlobalVariable.negara.checkpoint == 10 && GlobalVariable.negara.aseanName.count == 10){
                                result = GlobalVariable.negara.checkWin(GlobalVariable.negara.checkpoint, GlobalVariable.negara.poin)
                                content = result.condition
                                print("benar")
                            }else{
                                content = "Your Poin is: \(GlobalVariable.negara.poin)"
                            }
                            showingAlert = true
                            
                            print("benar")
                            print(GlobalVariable.negara.poin)
                            
                        }else{
                            print(GlobalVariable.negara.poin)
                            print("salah")
                            if (GlobalVariable.negara.checkpoint < 10){
                                checkExist(asean)}
                            if (GlobalVariable.negara.checkpoint == 10){
                                
                                
                                content = result.condition
                            }else if (GlobalVariable.negara.checkpoint < 10){
                                
                                content = "You are wrong !! Your Poin is: \(GlobalVariable.negara.poin)"
                            }
                            showingAlert = true
                            
                            
                        }
                        
                        
                        
                    } label: {
                        
                        Image(asean[number])
                            .resizable()
                            .frame(width:105,height: 65)
                    }.alert(isPresented:$showingAlert) {
                        Alert(
                            title: Text(content),
                            message: Text("Are you sure want to continue?"),
                            primaryButton: .destructive(Text("Next")) {
                                showingView = result.showingAlert
                            },
                            secondaryButton: .cancel()
                        )
                    }.navigationDestination(
                        isPresented: $showingView) {
                            StartScreenView()
                            Text("Continue?")
                                .hidden()
                        }
                }
            }
            Spacer()
            VStack{
                ForEach(5..<10) { number in
                    Button {
                        if (GlobalVariable.negara.getAseanCountry().isEmpty){
                            GlobalVariable.negara.addAseanCountry(asean[GlobalVariable.negara.randomnumber])
                            
                        }
                        
                        print(GlobalVariable.negara.getAseanCountry())
                        
                        GlobalVariable.negara.checkpoint = GlobalVariable.negara.checkpoint + 1
                        
                        if (asean[GlobalVariable.negara.randomnumber]==asean[number])
                        {
                            GlobalVariable.negara.poin = GlobalVariable.negara.poin + 1
                            
                            if (GlobalVariable.negara.checkpoint < 10){
                                checkExist(asean)}
                            print("poin:" , GlobalVariable.negara.poin)
                            print("checkpoin:" ,GlobalVariable.negara.checkpoint)
                            print("jumlah:" , GlobalVariable.negara.aseanName.count)
                            //
                            if (GlobalVariable.negara.checkpoint == 10 && GlobalVariable.negara.aseanName.count == 10){
                                result = GlobalVariable.negara.checkWin(GlobalVariable.negara.checkpoint, GlobalVariable.negara.poin)
                                content = result.condition
                                print("benar")
                                
                            }else {
                                content = "Your Poin is: \(GlobalVariable.negara.poin)"
                                
                            }
                            showingAlert = true
                            print("benar")
                            
                            print(GlobalVariable.negara.poin)
                        }else{
                            print(GlobalVariable.negara.poin)
                            if (GlobalVariable.negara.checkpoint < 10){
                                checkExist(asean)}
                            if (GlobalVariable.negara.checkpoint == 10){
                                
                                content = result.condition
                            }else if (GlobalVariable.negara.checkpoint < 10){
                                
                                content = "You are wrong !! Your Poin is: \(GlobalVariable.negara.poin)"
                            }
                            showingAlert = true
                            
                        }
                        
                        
                        
                    } label: {
                        Image(asean[number])
                            .resizable()
                            .frame(width:105,height: 65)
                    }.alert(isPresented:$showingAlert) {
                        Alert(
                            title: Text(content),
                            message: Text("Are you sure want to continue?"),
                            primaryButton: .destructive(Text("Next")) {
                                
                                showingView = result.showingAlert
                            },
                            secondaryButton: .cancel()
                        )
                    }.navigationDestination(
                        isPresented: $showingView) {
                            StartScreenView()
                            Text("Continue?").hidden()
                        }
                }
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

func checkExist(_ asean: [String]) {
    GlobalVariable.negara.randomnumber = Int.random(in: 0...9)
    while GlobalVariable.negara.checkAppearance(asean[GlobalVariable.negara.randomnumber]) {
        GlobalVariable.negara.randomnumber = Int.random(in: 0...9)
    }
    GlobalVariable.negara.addAseanCountry(asean[GlobalVariable.negara.randomnumber])
}



