//
//  login_api_call.swift
//  Awise
//
//  Created by LinXuanYang on 12/4/22.
//

import Foundation
import SwiftUI
import UIKit

// var email:String = ""

// http://127.0.0.1:8000/

extension URLResponse {
    /// Returns casted `HTTPURLResponse`
    var http: HTTPURLResponse? {
        return self as? HTTPURLResponse
    }
}

extension HTTPURLResponse {
    /// Returns `true` if `statusCode` is in range 200...299.
    /// Otherwise `false`.
    var isSuccessful: Bool {
        return 200 ... 299 ~= statusCode
    }
}


func login(email:String, password:String) {

  guard let url = URL(string: "https://awise.herokuapp.com/api/login/") else {
        return
    }
  var request = URLRequest(url: url)
  request.setValue("application/json", forHTTPHeaderField: "Content-Type")
  request.httpMethod = "POST"
  
  let body: [String: AnyHashable] = [
    
    "username":email,
    "password": password
  ]
  request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
    
    
    
  // Make the request
  let task = URLSession.shared.dataTask(with: request){ data, response, error in
        guard let data, error == nil else {
            return
        }
      
        print(error)
        print(response)
        if let unwrapped_response = response{
            print(unwrapped_response.http?.isSuccessful)
            if unwrapped_response.http?.isSuccessful==true {
                
                print("login successful")
                
            } else {
                uid = -400                          
                print("login unsuccessful; uid: " + String(uid))
            }
        } else {
            print("response missing value")
        }
        
        
    }
  
  task.resume()
    
    
}



struct RegisterRes: Codable {
    var token: String
    var user: User
}

struct User: Codable {
    var id:Int
    var username:String
    var email:String
    // var password:String
}

func register(emailipt:String, password:String) {


    guard let url = URL(string: "https://awise.herokuapp.com/api/register/") else {return}
            
  var request = URLRequest(url: url)
  request.setValue("application/json", forHTTPHeaderField: "Content-Type")
  request.httpMethod = "POST"
  
  let body: [String: AnyHashable] = [
    
    "username":emailipt,
    "email": emailipt,
    "password": password
  ]
  request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
  // print(request)

  // Make the request
    let task = URLSession.shared.dataTask(with: request){ data, response, error in
        guard let data, error == nil else {
            return
        }
        if let unwrapped_response = response{
            print(unwrapped_response.http?.isSuccessful)
            if unwrapped_response.http?.isSuccessful==true {
                
                print("register successful")
                
            } else {
                uid = -401
                print(" register unsuccessful; uid: " + String(uid))
            }
        } else {
            print("register missing value")
        }
        
        
        /*
        do {
            try JSONDecoder().decode(RegisterRes.self, from: data)
            
        } catch {
            print(error)
        }
         */
         
        
         
        
        
        if let response = try? JSONDecoder().decode(RegisterRes.self, from: data){
            
          print("good")
            
        }
        else{
            print(error)
            
        }
       
        
        
    }
  
  task.resume()
  
  
}



// regist and initialize database at the same time

func register_and_init(account:String, password:String, uid2:Int) {
    var local_uid:Int = -1


    guard let url = URL(string: "https://awise.herokuapp.com/api/register/") else {return}
            
  var request = URLRequest(url: url)
  request.setValue("application/json", forHTTPHeaderField: "Content-Type")
  request.httpMethod = "POST"
  
  let body: [String: AnyHashable] = [
    
    "username":account,
    "email": account,
    "password": password
  ]
    
    
  request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
  // print(request)

  // Make the request
    let task = URLSession.shared.dataTask(with: request){ data, response, error in
        guard let data, error == nil else {
            return
        }
        if let unwrapped_response = response{
            print(unwrapped_response.http?.isSuccessful)
            if unwrapped_response.http?.isSuccessful==true {
                
                print("register successful")
                initData(uid: uid2,email:account, password: 1234) // not the real password
                initData2(uid: uid2)
                
            } else {
                uid = -401
                local_uid = -401
                print(" register unsuccessful; uid: " + String(uid))
                return
            }
        } else {
            print("register missing value")
        }
        
         
        
        
        if let response = try? JSONDecoder().decode(RegisterRes.self, from: data){
            
          print("good")
            
        }
        else{
            print(error)
            
        }
        
        
       
        
        
    }
  
  task.resume()
    
    // init data
    /*
    print("local uid: " + String(local_uid))
    print("global uid: " + String(uid))
    if local_uid != -401 {
        
        
        
        
        
        initData(uid: uid2,email:account, password: 1234) // not the real password
        initData2(uid: uid2)
    }*/
  
  
}


func fetchuid(email:String){
    let urlString = "https://awise.herokuapp.com/api/survey/retrieve-basic-info-from-email/\(email)"
    guard let url = URL(string: urlString) else {
          return
      }
    var request = URLRequest(url: url)

    // Make the request
    URLSession.shared.dataTask(with: request) { data, response, error in
                if let data = data {
                    
                    /*
                    do {try JSONDecoder().decode(BasicInfo.self, from: data)}
                    catch {print(error)
                        print(uid)
                    }
                    */
                   
                        
                        if let response = try? JSONDecoder().decode(BasicInfo.self, from: data) {
                            
                            uid = response.user_id
                            print(response.user_id)
                            return
                        } else {
                            print("Decoding error occurs...")
                        }
                    
                }
        
    }.resume()
      
}

