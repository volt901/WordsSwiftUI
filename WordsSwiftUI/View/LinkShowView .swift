//
//  LinkShowView .swift
//  WordsSwiftUI
//
//  Created by Владимир Ширяев on 02.04.2023.
//

import SwiftUI

struct LinkShowView: View {
    @EnvironmentObject var linkViewModel:LinkViewModel
   
    @Binding var url: String 
    @State var isLoaded = false
    @State var title = ""
    
    var body: some View {
        ZStack {
            VStack{
                HStack{
                    Circle()
                        .frame(width: 30)
                        .foregroundColor(isLoaded ? .green : .black)
                    Spacer()
                    Text(title)
                        .fontWeight(.bold)
                    Spacer()
                    Button {
                        linkViewModel.isShowLinkContent.toggle()
                    }label:{
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                    }
                }
              //  .padding(.horizontal)
                //.padding(.bottom,10)
                .background(.secondary)
                WebView(url: $url) { isLoad in
                    self.isLoaded = isLoad
                }
            }

            .onAppear{
                if let url = URL(string: url){
                    self.title = url.host ?? ""
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
