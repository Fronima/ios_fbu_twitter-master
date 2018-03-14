//
//  ProfileViewController.swift
//  twitter_alamofire_demo
//
//  Created by ARG Lab on 3/11/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var tweetsLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    @IBOutlet weak var followerLabel: UILabel!
    @IBOutlet weak var tweetTable: UITableView!
    @IBOutlet weak var followingTable: UITableView!
    @IBOutlet weak var followersTable: UITableView!
    
    var user = User.current
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImage.af_setImage(withURL: (user?.profileImageUrl!)!)
        // Do any additional setup after loading the view.
    }

    @IBAction func viewPicker(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            //tweets
            tweetTable.isHidden = false
            followingTable.isHidden = true
            followersTable.isHidden = true
        case 1:
            //following
            tweetTable.isHidden = true
            followingTable.isHidden = false
            followersTable.isHidden = true
        default:
            //followers
            tweetTable.isHidden = true
            followingTable.isHidden = true
            followersTable.isHidden = false
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
