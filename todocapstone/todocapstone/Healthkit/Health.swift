////
////  Health.swift
////  todocapstone
////
////  Created by hufsaim on 2023/05/16.
////
//
//import SwiftUI
//import HealthKit
//
//struct Health: View {
//    let healthStore = HKHealthStore()
//    @ObservedObject var item = WorkoutItems()
//    var workouts : [Workout] = []
//    @State var stepCount : Int = 0
////    @State var workoutActivityName : String =
//    let workouttype  = HKObjectType.workoutType()
//    @State var workoutDuration : String = ""
//    @State var workoutCalories : Int = 0
//    @State var workoutDistance : Int = 0
//    var body: some View {
//        
//        VStack{
//            Text("Step :  \(stepCount)")
//            List(item.workoutItems){workout in
//                WorkoutCCell(workout: workout)
//                
//            }
//        }.onAppear{
//            self.requestAuth()
//            self.fetchStepCount()
////            self.readWorkouts()
//        }
//        .padding()
//    }
//    func requestAuth(){
//     
//        let stepCount = HKQuantityType.quantityType(forIdentifier: .stepCount)
//        let shareType = Set([ HKObjectType.workoutType(),HKObjectType.quantityType(forIdentifier: .stepCount)!])
//        let readType = Set([HKObjectType.workoutType(),HKObjectType.quantityType(forIdentifier: .stepCount)!])
//        
//        healthStore.requestAuthorization(toShare: shareType, read: readType){
//            (success, error) in
//            if error != nil {
//                print("Not Authorized to use HealthKit")
//            }
//            else if success {
//                print("Request Granted")
//            }
//        }
//        
//    }
//    func fetchStepCount(){
//        guard let stepCount = HKQuantityType.quantityType(forIdentifier: .stepCount) else { return  }
//        let calender = Calendar.current
//        let now = Date()
//        let startOfDay = calender.startOfDay(for: now)
//        let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: now, options:  .strictStartDate)
//        let query = HKStatisticsQuery(quantityType: stepCount, quantitySamplePredicate: predicate, options: .cumulativeSum){
//            (query, result, error) in
//            if let error = error {
//                print("Error fatching records for step \(error.localizedDescription)")
//                return
//            }
//            guard let result = result else {
//                print("No steop count data")
//                return
//            }
//            if let sum = result.sumQuantity(){
//                let steps = Int(sum.doubleValue(for: HKUnit.count()))
//                self.stepCount = steps
//            }else {
//                self.stepCount = 0
//            }
//        
//        }
//        healthStore.execute(query)
//    }
//    func readWorkouts(){
//        let predicate = HKQuery.predicateForWorkouts(with: .greaterThan, duration: 1)
//        healthStore.execute(HKSampleQuery(sampleType: .workoutType(), predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: [.init(keyPath: \HKSample.startDate,ascending: false)], resultsHandler: { query, samples, error in
//            if let hasError = error{
//                return
//            }
//            guard let samples = samples else{
//                fatalError("Invalid state : This fails if there is an error")
//            }
//            guard let workouts = samples as? [HKWorkout] else {
//                return
//            }
//            var id = 0
//            for activity in workouts {
//                if let value = activity.totalEnergyBurned {
//                    workoutCalories = Int(value.doubleValue(for: HKUnit.kilocalorie()))
//                }
//
//                if let value = activity.totalDistance {
//                    workoutDistance = Int(value.doubleValue(for: HKUnit.mile()))
//                }
//                workoutDuration = activity.duration.asString(style: .short)
//                let w = Workout(id: id, name: workouttype, imageName: workouttype, duration: workoutDuration, distance: workoutDistance, calories: workoutCalories)
//                id = id+1
//                item.workoutItems.append(w)
//            }
//        }))
//    }
//}
//
//struct Health_Previews: PreviewProvider {
//    static var previews: some View {
//        Health()
//    }
//}
////extension Double{
////    func asString(style : DateComponentsFormatter.UnitsStyle) -> String {
////        let formatter = DateComponentsFormatter()
////        formatter.allowedUnits = [.hour, .minute, .second, .nanoseconds]
////        formatter.unitStyle = style
////        return formatter.string(from : self) ?? ""
////    }
////}
