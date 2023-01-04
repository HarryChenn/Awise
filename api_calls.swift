//
//  api_calls.swift
//  Awise
//
//  Created by LinXuanYang on 11/23/22.
//

import Foundation
import SwiftUI
import UIKit


func initData(uid: Int, email:String, password:Int) {

  guard let url = URL(string: "https://awise.herokuapp.com/api/survey/create-basic-info")  else {
        return
    }
  var request = URLRequest(url: url)
  request.setValue("application/json", forHTTPHeaderField: "Content-Type")
  request.httpMethod = "POST"
  
  let body: [String: AnyHashable] = [
    "user_id": uid,
    "user_name": -1,
    "email": email,
    "password": password,
    "gender": -1,
    "profile_picture": -1,
    "school_year": -1,
    "rent": -1,
    "move_in_date": -1,
    "number_of_room": -1,
    "location": -1
  ]
  request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)

  // Make the request
  let task = URLSession.shared.dataTask(with: request){ data, _, error in
          guard let data, error == nil else {
              return
          }
          
          do {
              let response = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
              print(response)
           
          } catch {
              // print(error)
              print("initData doesn't succeed.")
          }
      
  }
    task.resume()
}


func initData2(uid: Int) {

  guard let url = URL(string: "https://awise.herokuapp.com/api/survey/create-survey") else {
        return
    }
  var request = URLRequest(url: url)
  request.setValue("application/json", forHTTPHeaderField: "Content-Type")
  request.httpMethod = "POST"
  
  let body: [String: AnyHashable] = [
    "user_id": uid,
    "getup_time": -1,
    "getup_time_w": -1,
    "bed_time": -1,
    "bed_time_w": -1,
    "social": -1,
    "social_w": -1,
    "academic": -1,
    "academic_w": -1,
    "bring_people": -1,
    "bring_people_w": -1,
    "animal": -1,
    "animal_w": -1,
    "instrument": -1,
    "instrument_w": -1,
    "cleaning": -1,
    "cleaning_w": -1,
    "cook": -1,
    "cook_w": -1,
    "share": -1,
    "share_w": -1,
    "smoke": -1,
    "smoke_w": -1,
    "alcohol": -1,
    "alcohol_w": -1
  ]
  request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)

  // Make the request
  let task = URLSession.shared.dataTask(with: request){ data, _, error in
          guard let data, error == nil else {
              return
          }
          
          do {
              let response = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
              print(response)
           
          } catch {
              print("initData2 doesn't succeed.")
          }
      
      
  }
    task.resume()
}



func setQ1(q1ans:String, uid: Int) {
    
  print(uid)
  
  let urlString = "https://awise.herokuapp.com/api/survey/update-basic-info-user-name/\(uid)"
  guard let url = URL(string: urlString) else {
        return
    }
    
  var request = URLRequest(url: url)
  request.setValue("application/json", forHTTPHeaderField: "Content-Type")
  request.httpMethod = "PUT"
  
  let body: [String: AnyHashable] = [
    "user_name": q1ans
  ]
  request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)

  // Make the request
  let task = URLSession.shared.dataTask(with: request){ data, _, error in
          guard let data, error == nil else {
              return
          }
          do {
              let response = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
              print(response)
          
          } catch {
              print(error)
          }
          
      
  }
    task.resume()
}




func setAnsGeneric(question: String, question2:String, answer: String, uid: Int) {
  
  let urlString = "https://awise.herokuapp.com/api/survey/update-basic-info-\(question)/\(uid)"
  guard let url = URL(string: urlString) else {
        return
    }
    
  var request = URLRequest(url: url)
  request.setValue("application/json", forHTTPHeaderField: "Content-Type")
  request.httpMethod = "PUT"
  
  let body: [String: AnyHashable] = [
    question2: answer
  ]
  request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)

  // Make the request
  let task = URLSession.shared.dataTask(with: request){ data, _, error in
          guard let data, error == nil else {
              return
          }
          do {
              let response = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
              print(response)
          
          } catch {
              print(error)
          }
          
      
  }
    task.resume()
}


// api for basic info table
func setIntAnsGeneric(question: String, question2:String, answer: Int, uid: Int) {
  
  let urlString = "https://awise.herokuapp.com/api/survey/update-basic-info-\(question)/\(uid)"
  guard let url = URL(string: urlString) else {
        return
    }
    
  var request = URLRequest(url: url)
  request.setValue("application/json", forHTTPHeaderField: "Content-Type")
  request.httpMethod = "PUT"
  
  let body: [String: AnyHashable] = [
    question2: answer
  ]
  request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)

  // Make the request
  let task = URLSession.shared.dataTask(with: request){ data, _, error in
          guard let data, error == nil else {
              return
          }
          do {
              let response = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
              print(response)
          
          } catch {
              print(error)
          }
          
      
  }
    task.resume()
}


// api for survey table
func setIntAnsGeneric2(question: String, question2:String, answer: Int, uid: Int) {
  
  let urlString = "https://awise.herokuapp.com/api/survey/update-survey-\(question)/\(uid)"
  guard let url = URL(string: urlString) else {
        return
    }
    
  var request = URLRequest(url: url)
  request.setValue("application/json", forHTTPHeaderField: "Content-Type")
  request.httpMethod = "PUT"
  
  let body: [String: AnyHashable] = [
    question2: answer
  ]
  request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)

  // Make the request
  let task = URLSession.shared.dataTask(with: request){ data, _, error in
          guard let data, error == nil else {
              return
          }
          do {
              let response = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
              print(response)
          
          } catch {
              print(error)
          }
          
      
  }
    task.resume()
}


 
 


