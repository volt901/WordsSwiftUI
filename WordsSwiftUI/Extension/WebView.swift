//
//  WebView.swift
//  WordsSwiftUI
//
//  Created by Владимир Ширяев on 02.04.2023.
//

import SwiftUI
import Foundation
import WebKit

struct WebView: UIViewRepresentable {
    
    @Binding var url: String
    var isLoad: (Bool) -> ()
    
    func makeUIView(context: Context) ->some UIView {
        let webView = WKWebView()
        
        webView.navigationDelegate = context.coordinator
        
        if let openUrl = URL(string: url){
            let urlComponent = URLComponents(url: openUrl, resolvingAgainstBaseURL: true)
            
            let request = URLRequest(url: urlComponent?.url ?? openUrl)
            webView.load(request)
        }
        
        
        
        
        
        return webView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}

    func makeCoordinator() -> WebViewCoorginator {
        WebViewCoorginator {isLoad in
            self.isLoad(isLoad)
        }
    }
}

class WebViewCoorginator: NSObject, WKNavigationDelegate{
    let isLoad: (Bool) -> ()
    init(isLoad: @escaping (Bool) -> ()){
        self.isLoad = isLoad
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        isLoad(true)
    }
}




