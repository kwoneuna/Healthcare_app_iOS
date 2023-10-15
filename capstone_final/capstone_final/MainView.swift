//
//  MainView.swift
//  capstone_final
//
//  Created by 박민정 on 2023/07/22.
//

import Foundation
import SwiftUI
//Color extension
extension Color {
 
    static let peach = Color(hex: "#fbe7ef")
    static let ivory = Color(hex: "f8ede3")
    //#f0ff00
    static let yello = Color(hex: "#ffff9f")
    static let sky = Color(hex: "#89c4f4")
    static let athens = Color(hex: "#efeff0")
    // #을 제거하고 사용해도 됩니다.
}
extension Color {
  init(hex: String) {
    let scanner = Scanner(string: hex)
    _ = scanner.scanString("#")
    
    var rgb: UInt64 = 0
    scanner.scanHexInt64(&rgb)
    
    let r = Double((rgb >> 16) & 0xFF) / 255.0
    let g = Double((rgb >>  8) & 0xFF) / 255.0
    let b = Double((rgb >>  0) & 0xFF) / 255.0
    self.init(red: r, green: g, blue: b)
  }
}

struct MainView: View{
    @FetchRequest(sortDescriptors:[]) var Exercise: FetchedResults<Exercisesave>
    @ObservedObject var userInfo: UserInfo
    
    
    var body: some View {
        
        NavigationView{
            ScrollView{
                VStack(alignment: .leading){
                    Spacer()
                    Text("\(userInfo.name)님").font(.system(size: 20))
                        .fontWeight(.heavy)
                        .foregroundColor(Color.black)
                        .padding(.leading,20)
                        .padding(.bottom,5)
                    Text("일상의 컨디션 케어 함께해요")
                        .font(.system(size: 18))
                        .multilineTextAlignment(.center)
                        .padding(.leading,20).foregroundColor(Color.gray)
                    Spacer()
                    
                    
                    
                    //건강관련기본상식
                    ZStack{
                        Rectangle()
                            .cornerRadius(15)
                            .foregroundColor(.white)
                            .background()
                        
                        ScrollView(.horizontal){
                            HStack{
                                NavigationLink(destination: example()) {
                                    health1()
                                }
                                .padding(.bottom)
                                NavigationLink(destination: example2()) {
                                    health2()
                                }.padding(.bottom)
                                NavigationLink(destination: example3()) {
                                    health3()
                                }
                                .padding(.bottom)
                            }
                            
                            
                            
                            
                            
                        }
                        .padding()
                        
                        
                        
                    }
                    //condition check & enter
                    //운동, 데이터
                    Text("내 컨디션 체크하기")
                        .offset(x:30,y:-30)
                        .font(.system(size:25))
                        .fontWeight(.heavy)
                        .padding(.top,20)
                        .padding(.bottom,10)
                    mentalhealth()//check

                    HStack{

                        NavigationLink(destination: ExerciseView()) {
                            exercise()
                        }.offset(y:-30)
                        NavigationLink {
                            checkview()
                        } label: {
                            check()
                        }.offset(x:-10,y:-30)
                        
                        
                    }
                    .padding(.leading)
                    //스트레스 지수, 면역력
                    
                    
                                    
                                    
                    NavigationLink(destination: ConditionEnterView(userInfo: userInfo)){
                        Enter()
                        
                    }.offset(x:10)
                    }
                
            }
            
            }.offset(x:-5)
    }    }
//건강관련체크
struct mentalhealth : View{
    var body: some View{
        ScrollView(.horizontal){
            HStack{
                ZStack{
                    Rectangle()
                        .frame(width:120,height:150)
                        .cornerRadius(15)
                        .padding(.trailing,5)
                        .foregroundColor(.gray)
                        .opacity(0.1)
                        .shadow(radius:3)
                    VStack{
                        Image("anxious")
                            .resizable()
                            .frame(width: 80, height:80)
                        Text("불안증")
                            .font(.system(size:20))
                            .fontWeight(.heavy)
                    }
                    
                }
                ZStack{
                    Rectangle()
                        .frame(width:120,height:150)
                        .cornerRadius(15)
                        .foregroundColor(.gray)
                        .opacity(0.1)
                        .padding(.trailing,5)
                        .shadow(radius:3)
                    VStack{
                        Image("depressed")
                            .resizable()
                            .frame(width: 80, height:80)
                        Text("우울증")
                            .font(.system(size:20))
                            .fontWeight(.heavy)
                    }
                }
               
                ZStack{
                    Rectangle()
                        .frame(width:120,height:150)
                        .cornerRadius(15)
                        .foregroundColor(.gray)
                        .opacity(0.1)
                        .shadow(radius:3)
                    VStack{
                        Image("공황장애")
                            .resizable()
                            .frame(width: 80, height:80)
                        Text("공황장애")
                            .font(.system(size:20))
                            .fontWeight(.heavy)
                    }
                }

            }
        }
                
                .padding(.top,20)
                .padding(.horizontal,20)
                .offset(x:10,y:-50)

                    
    }

}

//데이터 입력 뷰
struct Enter: View{
    var body: some View{
        ZStack{
            Rectangle()
                .frame(width: 345, height: 70)
//                .offset(x:10)
                .cornerRadius(15)
                .foregroundColor(.blue)
                .shadow(radius: 10)
                .padding([.leading,.bottom])
                Text("Enter Sleep & Stress")
                    .bold()
                    .font(.system(size:25,design: .rounded))
                    .foregroundColor(.white)
                    .offset(y:-10)
                        
                
                
            
        }.offset(y:-20)
    }
}

//데이터 모음집 뷰
struct check: View{
    var body: some View{
        ZStack{
            Rectangle()
//                .scaledToFit()
                .cornerRadius(15)
                .foregroundColor(.white)
                .shadow(radius: 10)
                .padding([.leading, .bottom, .trailing])

            VStack{
                HStack{
                    Text("데이터")
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 20))
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                        .offset(x: -25)
                
                    Image(systemName: "person")
                        .padding(.top, -1.0)
                        .foregroundColor(.black)
                        .frame(width: 20, height:5)
                        .offset(x: 20)

                }.padding()
                Image("면역력")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.bottom, 30)
                    .frame(width: 110)
                Spacer()
            }
        }
    }
}

struct exercise: View{
    var body: some View{
        ZStack{
            Rectangle()
                .cornerRadius(15)
                .foregroundColor(.white)
                .shadow(radius: 10)
                .padding([.leading,.bottom,.trailing])
            VStack{
                HStack{
                    Text("운동")
                        .multilineTextAlignment(.leading)
                        .padding(.top, -1.0)
                        .font(.system(size: 20))
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                        .offset(x: -30)

                    Image(systemName: "figure.run")
                        .padding(.top, -1.0)
                        .foregroundColor(.black)
                        .offset(x: 30)

                }.padding()
                Image("Run")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.bottom, 30)
                    .frame(width: 100)
                Spacer()
            
                Spacer()
            }
            
        }
    }
}






//건강 체크

struct MainView_Preview : PreviewProvider {
    static var previews: some View {
        MainView(userInfo: UserInfo())
    }
}
