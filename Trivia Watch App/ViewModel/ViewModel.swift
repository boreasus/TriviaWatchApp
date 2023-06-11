//
//  ViewModel.swift
//  Trivia Watch App
//
//  Created by safa uslu on 10.06.2023.
//

import SwiftUI

@MainActor
class ViewModel: ObservableObject{
    private let url = "https://opentdb.com/api.php?"
    private var modifiedUrl = ""
    
    @Published var category: Int?
    @Published var amount: Int?
    @Published var difficulty: difficulties?
    @Published var type: type?
    
    
    
    //Categories Data
    @Published var categories: [trivia_categories] = [
        trivia_categories(id: 9, name: "General Knowledge"),
        trivia_categories(id: 10, name: "Books"),
        trivia_categories(id: 11, name: "Film"),
        trivia_categories(id: 12, name: "Music"),
        trivia_categories(id: 13, name: "Musicals & Theatres"),
        trivia_categories(id: 14, name: "Television"),
        trivia_categories(id: 15, name: "Video Games"),
        trivia_categories(id: 16, name: "Board Games"),
        trivia_categories(id: 17, name: "Science & Nature"),
        trivia_categories(id: 18, name: "Computers"),
        trivia_categories(id: 19, name: "Mathematics"),
        trivia_categories(id: 20, name: "Mythology"),
        trivia_categories(id: 21, name: "Sports"),
        trivia_categories(id: 22, name: "Geography"),
        trivia_categories(id: 23, name: "History"),
        trivia_categories(id: 24, name: "Politics"),
        trivia_categories(id: 25, name: "Art"),
        trivia_categories(id: 26, name: "Celebrities"),
        trivia_categories(id: 27, name: "Animals"),
        trivia_categories(id: 28, name: "Vehicles"),
        trivia_categories(id: 29, name: "Gadgets"),
        trivia_categories(id: 30, name: "Japanese Anime & Manga"),
        trivia_categories(id: 31, name: "Cartoon & Animations"),

    ]
    
    @Published var questions: ResponseModel?
    
    @Published var networkSituation: NetworkSituation = NetworkSituation.loading
    
    @Published var areAllQuestionsAnswered:Bool = false
    
    @Published var trueAnswerCount:Int = 0
    
    
    func resetViewModel(){
        category = nil
        amount = nil
        difficulty = nil
        type = nil
        questions = nil
        networkSituation = .loading
        areAllQuestionsAnswered = false
        trueAnswerCount = 0
    }
    
    func setUrl(){
        modifiedUrl = url
        
        if let amount = amount{
            modifiedUrl.append("amount=\(amount)&")
        }
        
        if let category = category{
            modifiedUrl.append("category=\(category)&")
        }
        
        if let difficulty = difficulty{
            switch difficulty{
            case .easy: modifiedUrl.append("difficulty=easy&")
            case .normal: modifiedUrl.append("difficulty=normal&")
            case .hard: modifiedUrl.append("difficulty=hard&")
            }
        }
        
        if let type = type{
            switch type{
            case .multiple: modifiedUrl.append("type=multiple")
            case .tf: modifiedUrl.append("difficulty=boolean&")
            }
        }
        
        print(modifiedUrl)
        
    }
    
    func fetchData(){
        

            self.setUrl()
            
            if let url = URL(string: "\(self.modifiedUrl)") {
                NetworkLayer.sendRequest(to: url, decodingType: ResponseModel.self) { [weak self](result) in
                    switch result {
                    case .success(let response):
                        // Handle the decoded response object
                        DispatchQueue.main.async {
                            self?.questions = response
                            self?.networkSituation = .success
                        }
                        
                    case .failure(let error):
                        // Handle the error
                        print("Error: \(error)")
                        DispatchQueue.main.async {
                            self?.networkSituation = .failure
                        }
                    }
                }
            }
        }
    
    
    }
    

