//
//  Home.swift
//  WordsSwiftUI
//
//  Created by Владимир Ширяев on 25.03.2023.
//

import SwiftUI

struct Home: View {
    @State var selection = 2
    var body: some View {
        TabView (selection: $selection){
            ListView()
                .tag(1)
                .tabItem {
                    VStack {
                        Image(systemName: "list.dash")
                        Text("list")
                    }
                }
           RandomWorldView()
                .tag(2)
                .tabItem {
                    VStack {
                        Image(systemName: "textformat.abc")
                        Text("words")
                    }
                }
            Text ("link")
                .tag(3)
                .tabItem {
                    VStack {
                        Image(systemName: "link")
                        Text("link")
                    }
                }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
