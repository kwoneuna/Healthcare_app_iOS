//
//  FitnessStepsGraphView.swift
//  todocapstone
//
//  Created by hufsaim on 2023/05/06.
//

import SwiftUI

struct FitnessStepsGraphView: View {
    var body: some View {
        VStack(spacing:15){
            Text("Steps by Hours")
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity,alignment: .leading)
            //bar graph
            //see my analytics app ui for bar graph implementation
            //link in description
        BarGraph(steps: steps)
           
        }
        .padding(.horizontal,20)
        .padding(.vertical,25)
        .background{
            RoundedRectangle(cornerRadius:25, style: .continuous).fill(.ultraThinMaterial)
        }
    }
}
//bar graph
struct BarGraph: View{
    var steps: [Step]
    var body: some View{
        //Graph View
        GraphView()
            .padding(.top)
    }
    @ViewBuilder
    func GraphView() -> some View{
        GeometryReader{proxy in
            ZStack{
                VStack(spacing: 0){
                    ForEach(getGraphLines(), id: \.self){line in
                        HStack(spacing: 8){
                            Text("\(Int(line))")
                                .font(.caption)
                                .foregroundColor(.gray)
                                .frame(height: 20)
                            Rectangle()
                                .fill(Color.gray.opacity(0.2))
                                .frame(height: 1)
                        }
                        .frame(maxHeight: .infinity, alignment: .bottom)
                        //remove the text size
                        .offset(y: -15)
                    }
                }
                HStack{

                    ForEach(steps){
                        step in
                        VStack(spacing:0){
                            VStack(spacing:5){
                                RoundedRectangle(cornerRadius: 5,style: .continuous)
                                    .fill(step.color)
                                
                            }
                            .padding(.horizontal,5)
                            .frame(height: getBarHeight(point: step.value, size: proxy.size))
                            Text(step.key
                                .replacingOccurrences(of: " AM", with: "")
                                .replacingOccurrences(of: " PM", with: "")
                               
                            
                            )
                                .font(.caption2.bold())
                                .frame(height:25, alignment: .bottom)
                            
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                        
                        
                    }
                    
                }.padding(.leading,30)

                
            }
            .frame(width: .infinity, height: .infinity, alignment: .center
            )
        }
        //FIxed hieght
        .frame(height: 190)
    }
    func getBarHeight(point: CGFloat,size: CGSize)->CGFloat{
        let max = getMax()
        //25text height
        //5 spacing..
        let height = (point / max) * (size.height - 30)
        return height
    }
    
    //getting sample graphe lines based on max value..
    func getGraphLines()->[CGFloat]{
        let max = getMax()
        
        var lines: [CGFloat] = []
        lines.append(max)
        
        for index in 1...4{
            let progress = max/4
            lines.append(max-(progress * CGFloat(index)))
        }
        return lines
    }
    //getting max
    func getMax() -> CGFloat{
        let max = steps.max {first, scnd in
            return scnd.value > first.value
        }?.value ?? 0
        return max
    }
}



struct FitnessStepsGraphView_Previews: PreviewProvider {
    static var previews: some View {
        exercise_view()
    }
}
