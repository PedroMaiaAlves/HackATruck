//
//  ContentView.swift
//  Aula2
//
//  Created by Turma01-23 on 20/03/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var distancia: Double = 0
    @State private var tempo: Double = 0
    @State private var resultado: Double = 0
    @State private var cor = Color.gray;
    @State private var img: String = "interrogacao"
    
    func calcular(){
        if(distancia != 0 || tempo != 0){
            resultado = distancia/tempo
        }
    }
    
    func mudarCorEImg(){
        if(resultado >= 0.01 && resultado <= 9.9){
            cor = Color.verde
            img = "tartaruga"
        } else if(resultado >= 10 && resultado <= 29.9 ){
            cor = Color.azul
            img = "elefante"
        }else if(resultado >= 30 && resultado <= 69.9){
            cor = Color.laranja
            img = "avestrurz"
        }else if(resultado >= 70 && resultado <= 89.9){
            cor = Color.amarelo
            img = "leao"
        }else if(resultado >= 90 && resultado <= 130){
            cor = Color.vermelho
            img = "guepardo"
        } else if(resultado == 0 || resultado == 1/0 ){
            cor = Color.gray
            img = "interrogacao"
        }
    }
    
    var body: some View {
        ZStack{
            cor
                .ignoresSafeArea()
            VStack{
                Text("Digite a distância em (km)")
                TextField(" ", value: $distancia, format: .number)
                    .frame(width: 200.0)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                    .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                VStack{
                    Text("Digite o tempo (h)")
                    TextField(" ", value: $tempo, format: .number)
                        .frame(width: 200.0)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                        .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
                Button("Calcular", action:{
                    calcular()
                    mudarCorEImg()
                })
                .frame(width: 100.0, height: 25.0)
                .foregroundColor(.orange)
                    .background(.black)
                    .clipShape(Capsule())
                
                Text("\(resultado, specifier: "%.2f") Km/h")
                Spacer()
            }
            VStack{
                Spacer()
                Image(img).resizable()
                    .scaledToFit()
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .frame(width: 230,height: 230)
                Spacer()
            }
            VStack{
                Spacer()
                ZStack{
                    Rectangle().frame(width: 300, height: 150)
                    HStack{
                        VStack{
                            Text("TARTARUGA (0 - 9.9km/h)").foregroundStyle(.white)
                            Text("ELEFANTE (10 - 29.9km/h)").foregroundStyle(.white)
                            Text("AVESTRUZ (30 - 69.9km/h)").foregroundStyle(.white)
                            Text("LEAO (70 - 89.9km/h)").foregroundStyle(.white)
                            Text("GUEPARDO (90 - 130km/h)").foregroundStyle(.white)
                        }
                        VStack{
                            Circle().frame(width:10 , height: 10)
                                .foregroundStyle(.verde)
                                .padding(2)
                            Circle().frame(width:10 , height: 10)
                                .foregroundStyle(.azul)
                                .padding(2)
                            Circle().frame(width:10 , height: 10)
                                .foregroundStyle(.laranja)
                                .padding(2)
                            Circle().frame(width:10 , height: 10)
                                .foregroundStyle(.amarelo)
                                .padding(2)
                            Circle().frame(width:10 , height: 10)
                                .foregroundStyle(.vermelho)
                                .padding(2)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
