//
//  DifficultiesPage.swift
//  Trivia Watch App
//
//  Created by safa uslu on 10.06.2023.
//

import SwiftUI

struct DifficultiesPage: View {
    @EnvironmentObject var vm:ViewModel
    @State private var selectedDiffuculty:String = "Easy"
    private var difTypes = ["Easy", "Normal","Hard"]

    var body: some View {
        
        
        GeometryReader { proxy in
            let screenWidth = proxy.size.width
            let screenHeight = proxy.size.height
                
            VStack(alignment: .leading, spacing:10){
                Text("Choose difficulty level")
                    .font(.system(size: 14))
                    .bold()
                
                Picker("Level", selection: $selectedDiffuculty) {
                    ForEach(difTypes, id: \.self) { index in
                        //selection hold the index
                        Text(index)
                        }
                }
                .pickerStyle(.navigationLink)
                .frame(maxHeight: screenHeight/1.9)
                
                NavigationLink(destination: TypePage()) {
                    Text("Continue")
                }
                .frame(width: screenWidth,height: 34)
                .background(Color.orange)
                .cornerRadius(20)
                .buttonStyle(PlainButtonStyle())
                .simultaneousGesture(TapGesture().onEnded{
                    switch selectedDiffuculty {
                    case "Easy":
                        vm.difficulty = difficulties.easy
                    case "Normal":
                        vm.difficulty = difficulties.normal
                    case "Hard":
                        vm.difficulty = difficulties.hard
                        
                    default:
                        vm.difficulty = difficulties.easy
                    }

                })
            }
            
        }
    }
}

struct DifficultiesPage_Previews: PreviewProvider {
    static var previews: some View {
        DifficultiesPage()
    }
}
