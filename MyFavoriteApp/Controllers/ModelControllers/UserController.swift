//
//  UserController.swift
//  MyFavoriteApp
//
//  Created by Brooke Kumpunen on 3/20/19.
//  Copyright © 2019 Rund LLC. All rights reserved.
//

import Foundation

class UserController {
    
    //Singleton
    static let shared = UserController()
    private init() {}
    
    //Source of truth
    var users: [User] = []
    
    //Use a baseUrl
    let baseUrl = URL(string: "https://favoriteapp-375c6.firebaseio.com")
    
    //MARK: - CRUD!
    
    //GET request(read)
    func getUsers(completion: @escaping(Bool) -> Void) {
        
        //First, we want to create a dataTask. We'll need to create a url request for that.
        guard var url = baseUrl else {completion(false); return}
        url.appendPathComponent("users")
        url.appendPathExtension("json")
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.httpBody = nil
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                print("\(error.localizedDescription) \(error) in function: \(#function)")
                completion(false)
                return
            }
            guard let data = data else {completion(false); return}
            //If we get to this point, we now have some data from a rest API in JSON.
            do {
                let dictOfUsers = try JSONDecoder().decode([String: User].self, from: data)
                let users = dictOfUsers.compactMap({$0.value})
                    self.users = users
                completion(true)
            }catch {
                print("There was an error in \(#function): \(error) \(error.localizedDescription)")
                completion(false)
                return
            }
        } //Don't forget to resume the task at the end.
        .resume()
    }
    
    //POST request(create)
    
}
