//
//  main_screen.swift
//  todocapstone
//
//  Created by hufsaim on 2023/04/28.
//

import SwiftUI

struct main_screen: View {
    @ObservedObject var userInfo: UserInfo

    var body: some View {
        
        NavigationView{
            VStack(alignment: .leading){
                Spacer()
                Text("\(userInfo.name)")
                    .font(.system(size: 20))
                    .fontWeight(.heavy)
                    .foregroundColor(Color.black)
                    .padding(.top,3)
                    .padding(.leading,20)
                Text("일상의 컨디션 케어 함께해요")
                    .font(.system(size: 20))
                    .multilineTextAlignment(.center)
                    .padding(.leading,20)
                    .foregroundColor(Color.gray)
                
                Spacer()
                
                
                
                //수면,운동,스트레스지수,면역력 옆에 넣기
                ZStack{
                    
                    ScrollView{
                        Rectangle()
                            .cornerRadius(15)
                            .foregroundColor(.white)
                            .background()
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
                    .padding()
                   
                
                    
                }
                
                HStack{
                    //수면,운동
                    VStack{
                        NavigationLink(destination: conditionView() ) {
                            sleep()
                        }
                        NavigationLink {
                            exercise_view()
                        } label: {
                            exercise()
                        }

                       
                    }.padding(.leading)
                    //스트레스 지수, 면역력
                    VStack{
                        NavigationLink(destination: StressInputView(data:Stress())){
                            stress()
                        }
                        NavigationLink {
                            immunity_view()
                        } label: {
                            immunity()

                        }

                        
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
                    
                    Text("PLUS")
                        .offset(x:5,y: -5)
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    Spacer().frame(width:65)
                    Image(systemName: "person.fill.checkmark")
                        .padding(.top, -1.0)
                        .foregroundColor(.black)
                    
                }.padding()
                Image("Health_check")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.bottom, 20)
                    .offset(y:-8)
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
                    Text("CHECK")
                        .multilineTextAlignment(.leading)
                        .padding(.top, -1.0)
                        .font(.system(size: 20))
                        .fontWeight(.bold)
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
struct health1 : View{
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 15).frame(width: 350,height: 250)
                .padding(.horizontal)
                .foregroundColor(.white)
                .shadow(radius: 10)
            
            VStack{
                Image("wash")
                    .resizable()
                    .frame(width: 350,height: 190)
                    .offset(x:0,y:-10)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .padding(.bottom,-10)
                
                VStack{
                    Text("손씻기로 건강을 지키는 법")
                        .font(.system(size: 20))
                        .font(.title)
                        .bold()
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.black)
                        .padding(.bottom,-3)
                    Text("손씻기가 중요한 이유에 대해 알아봅시다.")
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                }.padding(.bottom)
                
                    

                
                    
            }
        }
        
        
        
    }
}
struct health2 : View{
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 15).frame(width: 350,height: 250)
                .padding(.horizontal)
                .foregroundColor(.white)
                .shadow(radius: 10)
            
            VStack{
                Image("yoga")
                    .resizable()
                    .frame(width: 350,height: 190)
                    .offset(x:0,y:-10)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .padding(.bottom,-10)
                
                VStack{
                    Text("생리 주기에 관하여 알아보기")
                        .font(.system(size: 20))
                        .font(.title)
                        .bold()
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.black)
                        .padding(.bottom,-5)
                    Text("생리 주기를 추적하면 건강상태를 더 자세히 알 수 있습니다")
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                }.padding(.bottom)
                
                    

                
                    
            }
        }
        
        
        
    }
}
struct health3 : View{
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 15).frame(width: 350,height: 250)
                .padding(.horizontal)
                .foregroundColor(.white)
                .shadow(radius: 10)
            
            VStack{
                Image("night")
                    .resizable()
                    .frame(width: 350,height: 190)
                    .offset(x:0,y:-10)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .padding(.bottom,-10)
                
                VStack{
                    Text("충분한 숙면을 취하는 방법")
                        .font(.system(size: 20))
                        .font(.title)
                        .bold()
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.black)
                        .padding(.bottom,-5)
                    Text("수면에 어려움이 있다면 이 팁을 활용해 보세요.")
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                }.padding(.bottom)
                
                    

                
                    
            }
        }
        
        
        
    }
}


struct main_screen_Previews: PreviewProvider {static var previews: some View {
                main_screen(userInfo: UserInfo())
            }
        }
    

