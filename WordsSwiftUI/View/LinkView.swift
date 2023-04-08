//
//  LinkView.swift
//  WordsSwiftUI
//
//  Created by Владимир Ширяев on 26.03.2023.
//

import SwiftUI
import RealmSwift

struct LinkView: View {
    @EnvironmentObject var linkViewModel:LinkViewModel
    @ObservedResults (LinkModel.self) var linkItems
    
    var body: some View {
        NavigationView {
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)){
                ScrollView(.vertical, showsIndicators: false){
                    VStack(alignment: .leading){
                        ForEach(linkItems, id: \.id) { link in
                            LinkItem(link:link){ isDelete in
                                $linkItems.remove (link)
                            }
                        }
                    }
                }
                Button{
                    linkViewModel.isShowAddLinkView.toggle()
                } label: {
                    HStack{
                        Spacer()
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
                .padding(15)
            }
            .navigationTitle("Links")
            .padding(15)
        }
    }
}
struct LinkItem : View {
    
    @EnvironmentObject var linkViewModel:LinkViewModel
    var link: LinkModel
    var onDelete: (Bool) -> ()
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 15) {
                Image(systemName: "link")
                    .resizable()
                    .frame(width: 20, height: 20)
                Text(link.linkName)
                    .font(.system(size: 20))
                Spacer()
                Button {
                    onDelete(true)
                } label: {
                    Image(systemName: "xmark")
                }
               
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(20)
            .background(.secondary.opacity(0.2))
            .cornerRadius(15)
            .onTapGesture {
                linkViewModel.isShowLinkContent.toggle()
                linkViewModel.openUrl = link.link
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
