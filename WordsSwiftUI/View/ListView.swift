//
//  ListView.swift
//  WordsSwiftUI
//
//  Created by Владимир Ширяев on 25.03.2023.
//

import SwiftUI

struct ListView: View {
    @State var search = ""
    @EnvironmentObject var listViewModel:ListViewModel
    
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
                    ScrollView(.vertical,showsIndicators: false){
                        VStack (alignment: .leading) {
                            VStack{
                                CardItem()
                                CardItem()
                                CardItem()
                            }
                        }
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
                .padding(15)
            }
            .padding(15)
        }
    }
}



struct CardItem : View {
    var body: some View {
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
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        //ListView()
        ContentView()
    }
}
