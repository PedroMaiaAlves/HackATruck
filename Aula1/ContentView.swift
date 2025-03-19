//
//  ContentView.swift
//  Aula1
//
//  Created by Turma01-23 on 19/03/25.
//

import SwiftUI

struct ContentView: View {
    
    // Onde é criado as variáveis
    
    var body: some View {
        VStack {
            HStack{
                Rectangle().frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/).frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/).foregroundColor(.red)
                Spacer()
                Rectangle().frame(width: 100).frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/).foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            }
            Spacer()
            HStack{
                Rectangle().frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/).frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/).foregroundColor(.green)
                Spacer()
                Rectangle().frame(width: 100).frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/).foregroundColor(.yellow)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
