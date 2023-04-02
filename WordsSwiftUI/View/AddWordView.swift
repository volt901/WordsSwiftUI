//
//  AddWorldView.swift
//  WordsSwiftUI
//
//  Created by Владимир Ширяев on 26.03.2023.
//

import SwiftUI
import RealmSwift

struct AddWordView: View {
    
    @State var addWord = ""
    @State var addTranslation = ""
    @State var addComment = ""
    
    @State var showAlert = false
    @ObservedResults(WordItem.self) var wordItem
    
    @EnvironmentObject var listViewModel:ListViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                Text("New word")
                    .font(.system(size: 20, weight: .bold))
                Spacer()
               
                Button{
                    listViewModel.isShowAddView.toggle()
                }label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 15, height: 15)
                        .foregroundColor(.black)
                    
                }
            }
            .padding(.leading,20)
            
            VStack(alignment: .leading)  {
                TextField("Word", text: $addWord)
                    .padding()
                    .background(.gray.opacity(0.4))
                    .cornerRadius(15)
            }
            
            VStack(alignment: .leading)  {

                TextField("Translation", text: $addTranslation)
                    .padding()
                    .background(.gray.opacity(0.4))
                    .cornerRadius(15)
            }
            
            VStack(alignment: .leading)  {
                Text("Comment")
                    .font(.system(size: 15, weight: .semibold))
                TextEditor(text: $addComment)
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(Color.black)
                    .cornerRadius(15)
                    .frame(height: 150)
                    .colorMultiply(.gray.opacity(0.4))
            }
            
            Spacer()
            
            Button{
                if addWord.count == 0,
                   addTranslation.count == 0{
                    showAlert.toggle()
                } else {
                    let word = WordItem()
                    word.mainWord = addWord
                    word.wordDescription = addComment
                    word.wordTranslate = addTranslation
                    
                    $wordItem.append(word)
                    withAnimation {
                        listViewModel.isShowAddView.toggle()
                    }
                }
            } label: {
                Text("SAVE")
                    .foregroundColor(.white)
            }
            .padding(.horizontal,30)
            .padding(.vertical)
            .frame(maxWidth: .infinity)
            .background(.green)
            .cornerRadius(15)
            .alert(Text("Empty fields"), isPresented: $showAlert) {
                //
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding(.vertical,30)
        .padding()
        .ignoresSafeArea(.all)
        .background(.white)
    }
}

struct AddWorldView_Previews: PreviewProvider {
    static var previews: some View {
        AddWordView()
    }
}
