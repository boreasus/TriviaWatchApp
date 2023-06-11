//
//  QuestionManager.swift
//  Trivia Watch App
//
//  Created by safa uslu on 10.06.2023.
//

import SwiftUI

struct QuestionManager: View {
    @EnvironmentObject var vm:ViewModel
    @State var currentQuestion: Int = 0

    var body: some View {
        
    
        ZStack{
           
            NavigationLink(destination:
                            ResultPage(questionCount: vm.questions?.results?.count ?? 0,trueQuestionCount: vm.trueAnswerCount), isActive: $vm.areAllQuestionsAnswered) {
                EmptyView()
            }.buttonStyle(PlainButtonStyle())
            
            
            if(vm.networkSituation == .loading){
                ZStack{
                    ProgressView()
                }
            }
            else if vm.networkSituation == .success {
                TabView(selection: $currentQuestion) {
                    
    
                    if let counter = vm.questions?.results?.count{
                        ForEach(0 ..< counter) { index in
                            let tempArr: [String?] = [vm.questions?.results?[index].correctAnswer,vm.questions?.results?[index].incorrectAnswers?[0],vm.questions?.results?[index].incorrectAnswers?[1],vm.questions?.results?[index].incorrectAnswers?[2]]
                            
                            
                            QuestionPage(
                                questionCount: vm.questions?.results?.count,
                                question: vm.questions?.results?[index].question,
                                answers: tempArr,
                                trueAnswer: vm.questions?.results?[index].correctAnswer,
                                currentQuestion: $currentQuestion
                            )
                            .transition(.move(edge: .leading))
                            .tag(index)
                                .contentShape(Rectangle())
                                .simultaneousGesture(DragGesture())
                                
                        }

                    }
                    
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
            }
            else if vm.networkSituation == .failure{
                Text("Something went wrong")
            }
        }.task {
            vm.fetchData()
                
            }
        
       
        
    }
}

struct QuestionManager_Previews: PreviewProvider {
    static var previews: some View {
        QuestionManager().environmentObject(ViewModel())
    }
}
