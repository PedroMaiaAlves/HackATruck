//
//  ContentView.swift
//  Aula3-Desafio1
//
//  Created by Turma01-23 on 21/03/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
                TabView{
                    RosaUIView()
                        .tabItem {
                            Label("Rosa", systemImage: "paintbrush")
                        }
                    AzulUIView()
                        .tabItem {
                            Label("Azul", systemImage: "paintbrush.pointed")
                        }
                    CinzaUIView()
                        .tabItem {
                            Label("Cinza", systemImage: "paintpalette")
                        }
                    ListUIView()
                        .tabItem {
                            Label("Lista", systemImage: "list.bullet")
                        }
                }
        }
    }
}

#Preview {
    ContentView()
}
