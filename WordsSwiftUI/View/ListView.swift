//
//  ListView.swift
//  WordsSwiftUI
//
//  Created by Владимир Ширяев on 25.03.2023.
//

import SwiftUI
import RealmSwift

struct ListView: View {
    @State var search = ""
    @EnvironmentObject var listViewModel:ListViewModel
    
    @ObservedResults(WordItem.self) var wordItem
    
    var body: some View {
        VStack{
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)){
                VStack (alignment: .leading) {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .frame(width: 20,height: 20)
                        TextField("search", text: $search)
                    }
                    .padding()
                    .background(.gray.opacity(0.4))
                    .cornerRadius(15)
                    .padding(.horizontal,15)
                    ScrollView(.vertical,showsIndicators: false){
                        VStack (alignment: .leading) {
                            VStack{
                                ForEach(wordItem, id: \.id){ item in
                                    CardItem {
                                        //
                                    }
                                }
                            }
                        }
                        .padding(.horizontal,15)
                    }
                }
                Button{
                    listViewModel.isShowAddView.toggle()
                } label: {
                    ZStack{
                        Circle()
                            .frame(width: 60, height: 60)
                            .foregroundColor(.green)
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                    }
                }
            }
            //.padding(15)
        }
    }
}



struct CardItem : View {
    
    @State var offsetX: CGFloat = 0
    
    var onDelete: () -> ()
    var body: some View {
        ZStack(alignment: .trailing){
            removeImage()
            VStack(alignment: .leading) {
                VStack(alignment: .leading){
                    Text("Car")
                        .font(.system(size: 18, weight: .bold))
                        .padding(.bottom, 1)
                    Text("Машина")
                        .font(.system(size: 18, weight: .light))
                }
                Divider()
                VStack(alignment: .leading){
                    Text("Примечание ")
                        .font(.system(size: 18, weight: .bold))
                        .padding(.bottom, 1)
                    Text("У меня есть автомобиль, я его выйграл в лотерею")
                        .font(.system(size: 18, weight: .light))
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(20)
            .background(.secondary.opacity(0.2))
            .cornerRadius(15)
            .offset(x: offsetX)
            .gesture(DragGesture()
                .onChanged { value in
                    if value.translation.width < 0 {
                        offsetX = value.translation.width
                    }
                }
                .onEnded { value in
                    withAnimation {
                        if screenSize().width * 0.7 < -value.translation.width {
                            offsetX = -screenSize().width
                            onDelete()
                        } else {
                            offsetX = .zero
                        }
                    }
                }
            )
        }
    }
    @ViewBuilder
    func removeImage () -> some View {
        Image(systemName: "xmark")
            .resizable()
            .frame(width: 10, height: 10)
            .offset(x: 30)
            .offset(x: offsetX * 0.5)
            .scaleEffect(CGSize(width: 0.1 * -offsetX * 0.08, height: 0.1 * -offsetX * 0.08))
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        //ListView()
        ContentView()
    }
}


extension View {
    func screenSize() -> CGSize {
        guard let window = UIApplication.shared.connectedScenes.first as?
            UIWindowScene else {
            return .zero
        }
        return window.screen.bounds.size
    }
}
