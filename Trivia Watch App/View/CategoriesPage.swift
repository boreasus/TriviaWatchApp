//
//  CategoriesPage.swift
//  Trivia Watch App
//
//  Created by safa uslu on 10.06.2023.
//

import SwiftUI

struct CategoriesPage: View {
    @EnvironmentObject var vm:ViewModel
    @State private var selectedCategory:Int = 0

    var body: some View {
        
        
        GeometryReader { proxy in
            let screenWidth = proxy.size.width
            let screenHeight = proxy.size.height
                
            VStack(alignment: .leading, spacing:10){
                Text("Choose a Category")
                    .font(.system(size: 14))
                    .bold()
                
                Picker("Category is", selection: $selectedCategory) {
                    ForEach(0 ..< vm.categories.count, id: \.self) { index in
                        //selection hold the index
                        Text("\(vm.categories[index].name)")
                        }
                }
                .pickerStyle(.navigationLink)
                .frame(maxHeight: screenHeight/1.9)
                
                NavigationLink(destination: DifficultiesPage()) {
                    Text("Continue")
                }
                .frame(width: screenWidth,height: 34)
                .background(Color.orange)
                .cornerRadius(20)
                .buttonStyle(PlainButtonStyle())
                .simultaneousGesture(TapGesture().onEnded{
                    vm.category = vm.categories[selectedCategory ].id
                })
            }
            
        }
    }
}

struct CategoriesPage_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CategoriesPage()
        }    }
}
