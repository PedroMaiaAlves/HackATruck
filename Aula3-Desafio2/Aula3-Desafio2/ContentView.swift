//
//  ContentView.swift
//  Aula3-Desafio2
//
//  Created by Turma01-23 on 21/03/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isSheetVisible = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.azul
                    .ignoresSafeArea()

                VStack {
                    Image("logo-hacka")
                        .resizable()
                        .scaledToFit()
                    Spacer()

                    VStack {
                        ZStack {
                            Rectangle()
                                .frame(width: 200, height: 60)
                                .foregroundStyle(.pink)

                            NavigationLink(destination: Modo1UIView()) {
                                Text("Modo 1")
                                    .foregroundStyle(.white)
                                    .frame(width: 200, height: 60)
                            }
                        }

                        ZStack {
                            Rectangle()
                                .frame(width: 200, height: 60)
                                .foregroundStyle(.pink)

                            NavigationLink(destination: Modo2UIView()) {
                                Text("Modo 2")
                                    .foregroundStyle(.white)
                                    .frame(width: 200, height: 60)
                            }
                            .buttonStyle(DefaultButtonStyle())
                        }

                        ZStack {
                            Rectangle()
                                .frame(width: 200, height: 60)
                                .foregroundStyle(.pink)
                            Button("Modo 3") {
                                isSheetVisible = true
                            }
                            .sheet(isPresented: $isSheetVisible){
                                novaView()
                            }
                            .foregroundStyle(.white)
                        }
                    }
                    Spacer()
                }
            }
        }
    }
}

struct novaView : View {
    var body: some View {
        ZStack{
            Color.azul
                .ignoresSafeArea()
            Spacer()
            ZStack{
                VStack{
                    Text("Modo 3").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).foregroundStyle(.white)
                    Spacer()
                }
                Spacer()
                Rectangle()
                    .frame(width: 250, height: 150)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .foregroundStyle(.black)
            }
            VStack{
                Text("Nome: Pedro").foregroundStyle(.white)
                Text("Sobrenome: Maia").foregroundStyle(.white)
            }
        }
    }
}

#Preview {
    ContentView()
}
