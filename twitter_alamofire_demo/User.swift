//
//  User.swift
//  twitter_alamofire_demo
//
//  Created by Charles Hieger on 6/17/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import Foundation

class User {
    
    var name: String
    var profileImageUrl: URL? // profile url
    var screenName: String? //screen name
    private var dictionary: [String: Any]?
    private static var _current: User?
    var backgroundImageUrl: URL?
    var bigBackgroundImageUrl: URL?
    var tweets: Int
    var followers: Int
    var following : Int
    
    
    
    init(dictionary: [String: Any]) {
        self.dictionary = dictionary
        screenName = dictionary["name"] as! String
        let profileImagePath = dictionary["profile_image_url_https"] as! String
        let bigProfileImagePath = dictionary["profile_image_url_https"] as! String
        let backgroundImagePath = dictionary["profile_background_image_url_https"] as! String
        
        name = dictionary["screen_name"] as! String
        profileImageUrl = URL(string: profileImagePath)
        backgroundImageUrl = URL(string: backgroundImagePath)
        bigBackgroundImageUrl = URL(string: bigProfileImagePath.replacingOccurrences(of: "normal", with: "bigger"))
        tweets = dictionary["statuses_count"] as! Int
        followers = dictionary["followers_count"] as! Int
        following = dictionary["friends_count"] as! Int
    }
    
    static var current: User?{
        get{
            if _current == nil{
                let defaults = UserDefaults.standard
                if let userData = defaults.data(forKey: "currentUserData"){
                    let dictionary = try! JSONSerialization.jsonObject(with: userData, options: []) as! [String: Any]
                    _current = User(dictionary: dictionary)
                }
            }
            return _current
        }
        set(user){
            _current = user
            let defaults = UserDefaults.standard
            if let user = user{
                let data = try! JSONSerialization.data(withJSONObject: user.dictionary, options: [])
                defaults.set(data, forKey: "currentUserData")
            }else{
                defaults.removeObject(forKey: "currentUserData")
            }
        }
    }
    
}
