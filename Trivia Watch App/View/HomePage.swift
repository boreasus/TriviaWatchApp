//
//  HomePage.swift
//  Trivia Watch App
//
//  Created by safa uslu on 10.06.2023.
//

import SwiftUI

struct HomePage: View {
    @EnvironmentObject var vm:ViewModel
    @State private var amount:Int = 1

    var body: some View {
        
        
        GeometryReader { proxy in
            let screenWidth = proxy.size.width
            let screehHeight = proxy.size.height
                
            VStack(alignment: .leading, spacing:10){
                Text("How many questions you want to answer?")
                    .font(.system(size: 14))
                    .bold()
                
                Picker("Use the wheel", selection: $amount) {
                    ForEach(1...10, id: \.self) { index in
                        Text("\(index)")
                        }
                }
                .frame(maxHeight: screehHeight/1.9)
                
                NavigationLink(destination: CategoriesPage()) {
                    Text("Continue")
                }
                .frame(width: screenWidth,height: 34)
                .background(Color.orange)
                .cornerRadius(20)
                .buttonStyle(PlainButtonStyle())
                .simultaneousGesture(TapGesture().onEnded{
                    vm.amount = amount

                })
            }
            
        }.navigationBarBackButtonHidden(true)

    }
        
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomePage()
        }    }
}
