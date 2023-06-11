//
//  QuestionPage.swift
//  Trivia Watch App
//
//  Created by safa uslu on 10.06.2023.
//

import SwiftUI

enum QuestionStatue{
    case unAnswered
    case trueAnswere
    case falseAnswere
}


struct QuestionPage: View {
    @EnvironmentObject var vm:ViewModel
    @State var questionCount:Int?
    @State var question:String?
    @State var answers:[String?]?
    @State var trueAnswer:String?
    @State var choosenAnswer:String?
    @State var questionStatue: QuestionStatue = QuestionStatue.unAnswered
    
    @State var isAnsweredA = false
    @State var isAnsweredB = false
    @State var isAnsweredC = false
    @State var isAnsweredD = false
    
    @Binding var currentQuestion:Int
    
    

    private func isAnswerTrue() {
        if(choosenAnswer == trueAnswer){
            questionStatue = .trueAnswere
            vm.trueAnswerCount += 1
        }
        else {
            questionStatue = .falseAnswere
        }
    }
    
    var body: some View {
     
        GeometryReader { proxy in
            
            ScrollView {
                VStack(alignment: .leading, spacing:10){
                    Text("Question \(currentQuestion + 1)/\(questionCount ?? 0)").bold()
                    
                    Text(question ?? "")
                    
                    HStack{
                        Button {
                            choosenAnswer = answers?[0]
                            isAnsweredA = true
                            isAnswerTrue()
                            DispatchQueue.main.asyncAfter(deadline: .now()+1){
                                if(currentQuestion + 1 != questionCount){
                                    withAnimation {
                                        currentQuestion += 1
                                    }
                                }
                                else{
                                    vm.areAllQuestionsAnswered = true

                                }
                            }
                        } label: {
                            Text(answers?[0] ?? "").font(.system(size: 10))
                        }
                        .overlay(
                            questionStatue == .trueAnswere && isAnsweredA ?
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.green, lineWidth: 2) :
                                questionStatue == .unAnswered && isAnsweredA ?
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.green, lineWidth: 2) :
                            questionStatue == .falseAnswere && isAnsweredA ?
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.red, lineWidth: 2) :
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.red, lineWidth: 0)
                        )
                        
                        Button {
                            choosenAnswer = answers?[1]
                            isAnsweredB = true
                            isAnswerTrue()
                            DispatchQueue.main.asyncAfter(deadline: .now()+1){
                                if(currentQuestion + 1 != questionCount){
                                    withAnimation {
                                        currentQuestion += 1
                                    }                                }
                                else{
                                    vm.areAllQuestionsAnswered = true
                                }                            }
                        } label: {
                            Text(answers?[1] ?? "").font(.system(size: 10))
                        }
                        .overlay(
                            questionStatue == .trueAnswere && isAnsweredB ?
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.green, lineWidth: 2) :
                                questionStatue == .unAnswered && isAnsweredB ?
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.green, lineWidth: 2) :
                            questionStatue == .falseAnswere && isAnsweredB ?
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.red, lineWidth: 2) :
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.red, lineWidth: 0)
                        )
                    }
                    
                    HStack{
                        Button {
                            choosenAnswer = answers?[2]
                            isAnsweredC = true
                            isAnswerTrue()
                            DispatchQueue.main.asyncAfter(deadline: .now()+1){
                                if(currentQuestion + 1 != questionCount){
                                    withAnimation {
                                        currentQuestion += 1
                                    }                                }
                                else{
                                    vm.areAllQuestionsAnswered = true
                                }                            }
                        } label: {
                            Text(answers?[2] ?? "").font(.system(size: 10))
                        }
                        .overlay(
                            questionStatue == .trueAnswere && isAnsweredC ?
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.green, lineWidth: 2) :
                                questionStatue == .unAnswered && isAnsweredC ?
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.green, lineWidth: 2) :
                            questionStatue == .falseAnswere && isAnsweredC ?
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.red, lineWidth: 2) :
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.red, lineWidth: 0)
                        )
                        
                        Button {
                            choosenAnswer = answers?[3]
                            isAnsweredD = true
                            isAnswerTrue()
                            DispatchQueue.main.asyncAfter(deadline: .now()+1){
                                if(currentQuestion + 1 != questionCount){
                                    withAnimation {
                                        currentQuestion += 1
                                    }                                }
                                else{
                                    vm.areAllQuestionsAnswered = true
                                }                            }
                        } label: {
                            Text(answers?[3] ?? "").font(.system(size: 10))
                        }
                        .overlay(
                            questionStatue == .trueAnswere && isAnsweredD ?
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.green, lineWidth: 2) :
                                questionStatue == .unAnswered && isAnsweredD ?
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.green, lineWidth: 2) :
                            questionStatue == .falseAnswere && isAnsweredD ?
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.red, lineWidth: 2) :
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.red, lineWidth: 0)
                        )
                    }

                }
            }
            
        }.navigationBarBackButtonHidden(true)

    }
}

struct QuestionPage_Previews: PreviewProvider {
    static var previews: some View {
       EmptyView()
    }
}
