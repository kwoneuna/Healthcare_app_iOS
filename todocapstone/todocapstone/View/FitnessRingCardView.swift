//
//  FitnessRingCardView.swift
//  todocapstone
//
//  Created by hufsaim on 2023/05/05.
//

import SwiftUI

struct FitnessRingCardView: View {
    var body: some View {
        VStack(spacing:15){
            Text("Progress")
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity,alignment: .leading)
            HStack(spacing: 20) {
                //progress Ring
                ZStack{
                    ForEach(ring.indices,id: \.self){index in
                        ZStack{
                            Circle()
                                .stroke(.gray.opacity(0.3),lineWidth: 10)
                            Circle()
                                .trim(from: 0, to: ring[index].progress / 100)
                                .stroke(ring[index].KeyColor, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                                .rotationEffect(.init(degrees: -90))
                        }
                        .padding(CGFloat(index) * 16)
                    }
                }
                .frame(width: 130, height: 130)
                
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(ring){ring in
                        Label {
                            HStack(alignment: .bottom, spacing: 6) {
                                Text("\(Int(ring.progress))%")
                                    .font(.title3.bold())
                                Text(ring.value)
                                    .font(.caption)
                            }
                        } icon: {
                            Group{
                                //isText -> is test라 해야 나온다
                                if ring.isTest{
                                    Text(ring.keyIcon)
                                        .font(.title2)
                                }
                                else{
                                    Image(systemName: ring.keyIcon)
                                        .font(.title2)
                                }
                            }
                        }
                    }
                }
                .padding(.leading,10)
            }.padding(.top,20)
        }
        .padding(.horizontal,20)
        .padding(.vertical,25)
        .background{
            RoundedRectangle(cornerRadius:25, style: .continuous).fill(.ultraThinMaterial)
        }
    }
}

struct FitnessRingCardView_Previews: PreviewProvider {
    static var previews: some View {
        exercise_view()
    }
}
