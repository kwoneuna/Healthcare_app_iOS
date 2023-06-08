//
//  HealthKitManager.swift
//  todocapstone
//
//  Created by hufsaim on 2023/05/13.
//

import Foundation
import HealthKit
class HealthKitManger {
    func setUpHealthRequest(healthStore: HKHealthStore, readSteps: @escaping () -> Void) {
        //isHealDataAvailable : 이 디바이스에서 헬스데이터 활용가능한지
        if HKHealthStore.isHealthDataAvailable(), let stepCount = HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount) {
            healthStore.requestAuthorization(toShare: [stepCount], read: [stepCount]) { success, error in
                if success {
                    readSteps()
                } else if error != nil {
                    // handle your error here
                }
            }
        }
        
    }

    func readStepCount(forToday: Date, healthStore: HKHealthStore, completion: @escaping (Double)->Void){
        //stepquantitytype : healthkit에서 데이터 읽어오기
        guard let stepQuantityType = HKQuantityType.quantityType(forIdentifier: .stepCount) else {return}
        let now = Date()
        let startOfDay = Calendar.current.startOfDay(for: now)
        //.stictstartDate : 특정 시간내에서만 읽은 데이터 확정
        let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: now, options: .strictStartDate)
        //.cumlativesum : 하루동안의 모든 스텝 합해서 총 스텝 구하기
        let query = HKStatisticsQuery(quantityType: stepQuantityType, quantitySamplePredicate: predicate, options: .cumulativeSum) { _, result, error in
            guard let result = result, let sum = result.sumQuantity() else{
                completion(0.0)
                return
            }
            completion(sum.doubleValue(for: HKUnit.count()))
        }
        healthStore.execute(query)
    }
}

