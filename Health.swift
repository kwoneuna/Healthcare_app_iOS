//
//  Health.swift
//  todocapstone
//
//  Created by hufsaim on 2023/05/16.
//

import SwiftUI
import HealthKit

struct Health: View {
    let healthStore = HKHealthStore()
    @State var stepCount : Int = 0
    
    var body: some View {
        
        VStack{
            Text("Step :  \(stepCount)")
        }.onAppear{
            self.requestAuth()
            self.fetchStepCount()
        }
        .padding()
    }
    func requestAuth(){
        let stepCount = HKQuantityType.quantityType(forIdentifier: .stepCount)
        let shareType = Set([HKObjectType.workoutType(),HKObjectType.quantityType(forIdentifier: .stepCount)!])
        let readType = Set([HKObjectType.workoutType(),HKObjectType.quantityType(forIdentifier: .stepCount)!])
        
        healthStore.requestAuthorization(toShare: shareType, read: readType){
            (success, error) in
            if error != nil {
                print("Not Authorized to use HealthKit")
            }
            else if success {
                print("Request Granted")
            }
        }
        
    }
    func fetchStepCount(){
        guard let stepCount = HKQuantityType.quantityType(forIdentifier: .stepCount) else { return  }
        let calender = Calendar.current
        let now = Date()
        let startOfDay = calender.startOfDay(for: now)
        let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: now, options:  .strictStartDate)
        let query = HKStatisticsQuery(quantityType: stepCount, quantitySamplePredicate: predicate, options: .cumulativeSum){
            (query, result, error) in
            if let error = error {
                print("Error fatching records for step \(error.localizedDescription)")
                return
            }
            guard let result = result else {
                print("No steop count data")
                return
            }
            if let sum = result.sumQuantity(){
                let steps = Int(sum.doubleValue(for: HKUnit.count()))
                self.stepCount = steps
            }else {
                self.stepCount = 0
            }
        
        }
        healthStore.execute(query)
    }
}

struct Health_Previews: PreviewProvider {
    static var previews: some View {
        Health()
    }
}
