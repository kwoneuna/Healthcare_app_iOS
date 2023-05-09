//
//  main_screen.swift
//  todocapstone
//
//  Created by hufsaim on 2023/04/28.
//

import SwiftUI

struct main_screen: View {
    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
                Spacer()
                Text("권은아님").font(.system(size: 20))
                    .fontWeight(.heavy)
                    .foregroundColor(Color.black)
                    .padding(.horizontal)
                Text("일상의 컨디션 케어 함께해요")
                    .font(.system(size: 18))
                    .multilineTextAlignment(.center)
                    .padding(.leading).foregroundColor(Color.gray)
                Spacer()
                
                
                
                //수면,운동,스트레스지수,면역력 옆에 넣기
                ZStack{
                    Rectangle()
                        .cornerRadius(15)
                        .foregroundColor(.white)
                        .background()
                    Text("오늘의 건강 상식")
                        .fontWeight(.bold)
                
                    
                }
                HStack{
                    //수면,운동
                    VStack{
                        NavigationLink(destination: Home() ) {
                            sleep()
                        }
                        NavigationLink {
                            exercise_view()
                        } label: {
                            exercise()
                        }

                       
                    }
                    //스트레스 지수, 면역력
                    VStack{
                        NavigationLink(destination: StressInputView()){
                            stress()
                        }
                        
                        immunity()
                        
                    }
                    Spacer()
                    
                    
                }
               

            }
            
        }
        
       

    }
   
}

struct sleep: View {
    var body: some View{
        
        ZStack{
            
            Rectangle()
                .cornerRadius(15)
                .foregroundColor(.white)
                .shadow(radius: 10)
                .padding([.leading, .bottom, .trailing])
            VStack{
                HStack{
                    
                    Text("수면")
                        .multilineTextAlignment(.leading)
                        .padding(.top, -1.0)
                        .font(.system(size: 20))
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                    Spacer().frame(width:65)
                    Image(systemName: "bed.double.fill")
                        .padding(.top, -1.0)
                        .foregroundColor(.black)
                    
                }.padding()
                Image("수면")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.bottom, 30)
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
                    Spacer().frame(width:65)
                    Image(systemName: "figure.run")
                        .padding(.top, -1.0)
                        .foregroundColor(.black)
                }.padding()
                Image("Run")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.bottom, 30)
                Spacer()
            
                Spacer()
            }
            
        }
    }
}
struct stress: View{
    var body: some View{
        ZStack{
            Rectangle()
                .cornerRadius(15)
                .foregroundColor(.white)
                .shadow(radius: 10)
                .padding([.leading, .bottom, .trailing])
            VStack{
                HStack{
                    Text(" 스트레스")
                        .multilineTextAlignment(.leading)
                        .padding(.top, -1.0)
                        .font(.system(size: 20))
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                    Spacer()
                        .frame(width: 45)
                    Image(systemName: "brain")
                        .padding(.top, -1.0)
                        .foregroundColor(.black)
                    
                }.padding()
                Image("스트레스")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.bottom, 30)
                Spacer()
            }
        }
    }
}
struct immunity: View{
    var body: some View{
        ZStack{
            Rectangle()
                .cornerRadius(15)
                .foregroundColor(.white)
                .shadow(radius: 10)
                .padding([.leading, .bottom, .trailing])
            
            VStack{
                HStack{
                    Text("면역력")
                        .multilineTextAlignment(.leading)
                        .padding(.top, -1.0)
                        .font(.system(size: 20))
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                    Spacer()
                        .frame(width: 65)
                    Image(systemName: "person")
                        .padding(.top, -1.0)
                        .foregroundColor(.black)
                    
                }.padding()
                Image("면역력")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.bottom, 30)
                Spacer()
            }
        }
    }
}
struct main_screen_Previews: PreviewProvider {static var previews: some View {
                main_screen()
            }
        }
    

