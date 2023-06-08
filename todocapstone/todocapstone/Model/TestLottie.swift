//
//  Lottie.swift
//  todocapstone
//
//  Created by hufsaim on 2023/05/10.
//

import SwiftUI

import Foundation
import Lottie
// SwiftUI에서 사용하기 위헤 UIKit을 import해주세요
import UIKit

// 로티 애니메이션 뷰
struct TestLottie: UIViewRepresentable {
    typealias UIViewType = UIView
    var name : String
    var loopMode: LottieLoopMode
    
    // 간단하게 View로 JSON 파일 이름으로 애니메이션을 실행합니다.
    init(jsonName: String = "loading_anim", loopMode : LottieLoopMode = .loop){
        self.name = jsonName
        self.loopMode = loopMode
    }
    
    func makeUIView(context: UIViewRepresentableContext<TestLottie>) -> UIView {
        let view = UIView(frame: .zero)

        let animationView = LottieAnimationView()
        let animation = LottieAnimation.named(name)
        animationView.animation = animation
        // AspectFit으로 적절한 크기의 에니매이션을 불러옵니다.
        animationView.contentMode = .scaleAspectFit
        // 애니메이션은 기본으로 Loop합니다.
        animationView.loopMode = loopMode
        // 애니메이션을 재생합니다
        animationView.play()
        // 백그라운드에서 재생이 멈추는 오류를 잡습니다
        animationView.backgroundBehavior = .pauseAndRestore

  //컨테이너의 너비와 높이를 자동으로 지정할 수 있도록합니다. 로티는 컨테이너 위에 작성됩니다.
  
  
      animationView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(animationView)
        
        
        //자동완성 기능
        NSLayoutConstraint.activate([
            //레이아웃 높이와 넓이 제약
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])

        return view
    }
    //view update
    func updateUIView(_ uiView: UIViewType, context: UIViewRepresentableContext<TestLottie>) {    }
}

struct Lottie_Previews: PreviewProvider {
    static var previews: some View {
        TestLottie()
    }
}
