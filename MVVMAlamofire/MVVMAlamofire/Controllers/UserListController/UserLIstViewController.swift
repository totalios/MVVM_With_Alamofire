//
//  UserLIstViewController.swift
//  MVVMAlamofire
//
//  Created by iOS Guru on 26/06/20.
//  Copyright © 2020 iOS Guru. All rights reserved.
//

import UIKit

class UserLIstViewController: UIViewController {
    var userModel = UserListModel()
    @IBOutlet weak var tblUserList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tblUserList.register(UINib(nibName: "UserListCell", bundle: nil), forCellReuseIdentifier: "UserListCell")
        userModel.customerViewController = self
        userModel.getAllUserData()
    }
}

extension UserLIstViewController: UITableViewDataSource {
    //set the number of sections
    public func numberOfSections(in tableView: UITableView) -> Int {
        return userModel.userSections.count
    }
    //set the section index titles
    public func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return userModel.userSections
    }
    //set the section header titles
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return userModel.userSections[section].uppercased()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return userModel.arrUsers.count
        let userKey = userModel.userSections[section]
        if let users = userModel.userDictionaries[userKey] {
            return users.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UserListCell = tableView.dequeueReusableCell(withIdentifier: "UserListCell", for: indexPath) as! UserListCell
        let userKey = userModel.userSections[indexPath.section]
        if let users = userModel.userDictionaries[userKey.uppercased()] {
            cell.userModel = users[indexPath.row]
        }

        
        return cell
    }
}
