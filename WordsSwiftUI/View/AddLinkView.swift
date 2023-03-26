//
//  AddLinkView.swift
//  WordsSwiftUI
//
//  Created by Владимир Ширяев on 26.03.2023.
//

import SwiftUI

struct AddLinkView: View {
    @State var addLink = ""
    @State var addLesson = ""
    
    @EnvironmentObject var linkViewModel:LinkViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                Text("New link")
                    .font(.system(size: 20, weight: .bold))
                Spacer()
               
                Button{
                    linkViewModel.isShowAddLinkView.toggle()
                }label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 15, height: 15)
                        .foregroundColor(.black)
                    
                }
            }
            .padding(.leading,20)
            
            VStack(alignment: .leading)  {
                TextField("Link", text: $addLink)
                    .padding()
                    .background(.gray.opacity(0.4))
                    .cornerRadius(15)
            }
            
            VStack(alignment: .leading)  {

                TextField("Name lesson ", text: $addLesson)
                    .padding()
                    .background(.gray.opacity(0.4))
                    .cornerRadius(15)
            }
            
            
            Spacer()
            
            Button{
                
            } label: {
                Text("SAVE")
                    .foregroundColor(.white)
            }
            .padding(.horizontal,30)
            .padding(.vertical)
            .frame(maxWidth: .infinity)
            .background(.green)
            .cornerRadius(15)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding(.vertical,30)
        .padding()
        .ignoresSafeArea(.all)
        .background(.white)
    }
}

struct AddLinkView_Previews: PreviewProvider {
    static var previews: some View {
        AddLinkView()
    }
}
