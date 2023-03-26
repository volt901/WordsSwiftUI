//
//  RandomWorldView.swift
//  WordsSwiftUI
//
//  Created by Владимир Ширяев on 25.03.2023.
//

import SwiftUI

struct RandomWordView: View {
    @State var isShow = false
    var body: some View {
        VStack(alignment: .center){
            Spacer()
            VStack(alignment: .leading){
                Text("Car")
                    .font(.system(size: 36, weight: .bold))
                    .padding(.bottom, 1)
                VStack(alignment: .leading){
                    ZStack(alignment: .leading){
                        Text("Машина")
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
            
            Spacer()
            Button {
                
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
            Spacer(minLength: 20)
        }
    }
}

struct RandomWordView_Previews: PreviewProvider {
    static var previews: some View {
        //RandomWorldView()
        ContentView()
    }
}
