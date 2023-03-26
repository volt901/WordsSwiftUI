//
//  LinkView.swift
//  WordsSwiftUI
//
//  Created by Владимир Ширяев on 26.03.2023.
//

import SwiftUI

struct LinkView: View {
    @EnvironmentObject var linkViewModel:LinkViewModel
    
    var body: some View {
        ZStack {
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)){
                ScrollView(.vertical, showsIndicators: false){
                    VStack{
                        LinkItem()
                        LinkItem()
                    }
                }
                Button{
                    linkViewModel.isShowAddLinkView.toggle()
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
struct LinkItem : View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 15) {
                Image(systemName: "link")
                    .resizable()
                    .frame(width: 20, height: 20)
                Text("link")
                    .font(.system(size: 20))
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: "xmark")
                }
               
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(20)
            .background(.secondary.opacity(0.2))
            .cornerRadius(15)
            .onTapGesture {
                print(1)
            }
        }
    }
}




struct LinkView_Previews: PreviewProvider {
    static var previews: some View {
        //LinkView()
        ContentView()
    }
}
