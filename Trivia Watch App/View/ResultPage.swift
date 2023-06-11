//
//  ResultPage.swift
//  Trivia Watch App
//
//  Created by safa uslu on 11.06.2023.
//

import SwiftUI

struct ResultPage: View {
    @State var questionCount:Int = 0
    @State var trueQuestionCount:Int = 0
    @State var rootIsActive:Bool? = false
    
    @EnvironmentObject var vm:ViewModel
    
    @Environment(\.presentationMode) var presentation

    var body: some View {
        VStack(alignment: .center){
            Text("\(trueQuestionCount)/\(questionCount)")
                .bold()
                .font(.system(size:32))
                .padding(.vertical)
            Text("You have answered\n") + Text("\(trueQuestionCount)").foregroundColor(Color.green) +
            Text(" true question!")
            Button {
                vm.resetViewModel()
                self.presentation.wrappedValue.dismiss()
             
                
            } label: {
                Label("Play Again", systemImage: "return").bold()
            }.background(Color.orange)
                .cornerRadius(20)
                .padding(.vertical)
               

        }.navigationBarBackButtonHidden(true)

    }
}

struct ResultPage_Previews: PreviewProvider {
    static var previews: some View {
        ResultPage()
    }
}
