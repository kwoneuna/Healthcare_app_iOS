//
//  sleep_healthkit.swift
//  todocapstone
//
//  Created by hufsaim on 2023/05/23.
//

//import SwiftUI
//import HealthKit
//
//struct sleep_healthkit: View {
//    let healthStore = HKHealthStore()
//    
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//    func requestSleepAuthorization(){
//        if let sleeptype = HKObjectType.categoryType(forIdentifier: .sleepAnalysis){
//            let setType = Set<HKSampleType>(arrayLiteral: sleeptype)
//            healthStore.requestAuthorization(toShare: sleeptype!, read: sleeptype!) {
//                (success, error) in
//                if !success || error != nil{
//                    print("Not authorized to use Healthkit")
//                } else if success {
//                    print("Request Granted")
//                }
//                            
//                            
//            }
//        }
//    }
//}
//
//struct sleep_healthkit_Previews: PreviewProvider {
//    static var previews: some View {
//        sleep_healthkit()
//    }
//}
