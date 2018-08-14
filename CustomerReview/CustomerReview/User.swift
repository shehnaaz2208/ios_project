//
//  User.swift
//  CustomerReview
//
//  Created by MacStudent on 2018-08-11.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import Foundation
class User{
    var name: String!
    var address: String!
    var contactNumber: String!
    var postalCode: String!
    var city: String!
    var email: String!
    var password: String!
    var gender: String!
    var dob: Date!
    
    static var userList = [String: User]()
    
    init() {
        self.name = ""
        self.address = ""
        self.contactNumber = ""
        self.postalCode = ""
        self.city = ""
        self.email = ""
        self.password = ""
        self.gender = ""
        self.dob = Date()
    }
    
    init(name: String, address: String, contactNumber: String, postalCode: String, city: String, email: String, password: String, gender: String, dob: Date) {
        self.name = name
        self.address = address
        self.contactNumber = contactNumber
        self.postalCode = postalCode
        self.city = city
        self.email = email
        self.password = password
        self.gender = gender
        self.dob = dob
    }
    
    static func addUser(newUser: User) -> Bool{
        if self.userList[newUser.email] == nil{
            self.userList[newUser.email] = newUser
            return true
        }
        
        return false
    }
    
    static func searchUser(email: String) -> User? {
        if self.userList[email] != nil{
            return self.userList[email]
        }
        
        return nil
    }
    
    static func deleteUser(email: String) -> Bool{
        if self.userList[email] != nil{
            self.userList[email] = nil
            return true
        }
        
        return false
    }
}
