//
//  LinkViewModel.swift
//  WordsSwiftUI
//
//  Created by Владимир Ширяев on 26.03.2023.
//

import Foundation

class LinkViewModel: ObservableObject {
    @Published var isShowAddLinkView = false
    
    @Published var isShowLinkContent = false
    
    @Published var openUrl = ""
}
