//
//  RandomWorldView.swift
//  WordsSwiftUI
//
//  Created by Владимир Ширяев on 25.03.2023.
//

import SwiftUI
import RealmSwift

struct RandomWordView: View {
    @State var isShow = false
    @ObservedResults(WordItem.self) var wordItem
    @State var word = WordItem()
    @State var offsetX: CGFloat = 0
    @State var opacity: CGFloat = 1
    
    var body: some View {
        VStack(alignment: .center){
            Spacer()
            VStack(alignment: .leading){
                Text(word.mainWord)
                    .font(.system(size: 36, weight: .bold))
                    .padding(.bottom, 1)
                VStack(alignment: .leading){
                    ZStack(alignment: .leading){
                        Text(word.wordTranslate)
                            .font(.system(size: 36, weight: .light))
                            .padding(.bottom, 1)
                            .opacity(isShow ? 1:0 )
                        Button {
                            withAnimation {
                                isShow.toggle()
                            }
                            
                        } label: {
                            HStack{
                                Text("Show tranclate")
                                    .foregroundColor(.white)
                            }
                        }
                        .padding(.horizontal,30)
                        .padding(.vertical)
                        .background(.green)
                        .cornerRadius(15)
                        .opacity(isShow ? 0:1 )
                    }
                }
            }
            .opacity(opacity)
            .offset(x: offsetX)
            Spacer()
            Button {
                withAnimation {
                    offsetX =  -50
                    opacity = 0
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4){
                    getRand()
                    offsetX  = 50
                    isShow = false
                    
                    withAnimation {
                        offsetX =  0
                        opacity = 1
                    }
                }
            } label: {
                HStack{
                    Text("Next")
                    Image(systemName: "chevron.right")
                }
                .foregroundColor(.green)
            }
            .padding(.horizontal,30)
            .padding(.vertical)
            .cornerRadius(15)
            .onAppear{
                getRand ()
            }
            Spacer(minLength: 20)
        }
    }
    func getRand () {
        let rand = Int.random(in: 0...wordItem.count-1)
        self.word = wordItem[rand]
    }
}

struct RandomWordView_Previews: PreviewProvider {
    static var previews: some View {
        //RandomWorldView()
        ContentView()
    }
}
