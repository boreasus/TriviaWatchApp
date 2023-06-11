//
//  TypePage.swift
//  Trivia Watch App
//
//  Created by safa uslu on 10.06.2023.
//

import SwiftUI

struct TypePage: View {
    @EnvironmentObject var vm:ViewModel
    @State private var selectedModel:String = "Multiple"
    private var Modes = ["Multiple","True/False"]
    
    var body: some View {
        
        GeometryReader { proxy in
            let screenWidth = proxy.size.width
            let screenHeight = proxy.size.height
                
            VStack(alignment: .leading, spacing:10){
                Text("Choose the answer type")
                    .font(.system(size: 14))
                    .bold()
                
                Picker("Answer Type is", selection: $selectedModel) {
                    ForEach(Modes, id: \.self) { index in
                        //selection hold the index
                        Text(index)
                        }
                }
                .pickerStyle(.navigationLink)
                .frame(maxHeight: screenHeight/1.9)
                
                NavigationLink(destination: QuestionManager()) {
                    Text("Continue")
                }
                .frame(width: screenWidth,height: 34)
                .background(Color.orange)
                .cornerRadius(20)
                .buttonStyle(PlainButtonStyle())
                .simultaneousGesture(TapGesture().onEnded{
                    switch selectedModel {
                    case "Multiple":
                        vm.type = .multiple
                    case "True/False":
                        vm.type = .tf
                    default:
                        vm.difficulty = difficulties.easy
                    }

                })
            }
            
        }
    }
}

struct TypePage_Previews: PreviewProvider {
    static var previews: some View {
        TypePage()
    }
}
