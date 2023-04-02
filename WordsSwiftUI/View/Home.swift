//
//  Home.swift
//  WordsSwiftUI
//
//  Created by Владимир Ширяев on 25.03.2023.
//

import SwiftUI

struct Home: View {
    @State var selection = 1
    @ObservedObject var listViewModel = ListViewModel()
   
    @ObservedObject var linkViewModel = LinkViewModel()
    
    init() {
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().backgroundColor = UIColor.white
    }
    
    var body: some View {
        ZStack {
            TabView (selection: $selection){
                ListView()
                    .environmentObject(listViewModel)
                    .tag(1)
                    .tabItem {
                        VStack {
                            Image(systemName: "list.dash")
                            Text("list")
                        }
                    }
                RandomWordView()
                    .tag(2)
                    .tabItem {
                        VStack {
                            Image(systemName: "textformat.abc")
                            Text("words")
                        }
                    }
                LinkView()
                    .environmentObject(linkViewModel)
                    .tag(3)
                    .tabItem {
                        VStack {
                            Image(systemName: "link")
                            Text("link")
                        }
                    }
            }
            
            if listViewModel.isShowAddView {
                AddWordView()
                    .environmentObject(listViewModel)
            }
            
            if linkViewModel.isShowAddLinkView {
                AddLinkView()
                    .environmentObject(linkViewModel)
            }
            
            if linkViewModel.isShowLinkContent{
                LinkShowView(url: $linkViewModel.openUrl)
                    .environmentObject(linkViewModel)
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
