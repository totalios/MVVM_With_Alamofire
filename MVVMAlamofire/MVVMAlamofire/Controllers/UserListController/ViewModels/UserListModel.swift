
import UIKit
import Alamofire

class UserListModel {
    weak var customerViewController: UserLIstViewController?
    private var userSection = [String]()
    private var userDictionary = [String:[UserList]]()

    var arrUsers = [UserList]()
    
    func getAllUserData() {
        AF.request("https://jsonplaceholder.typicode.com/todos/").response { (response) in
            if let data = response.data {
                do {
                    let userResponse = try JSONDecoder().decode([UserList].self, from: data)
                    self.arrUsers.append(contentsOf: userResponse)
                    self.sortUser()
                    self.customerViewController?.tblUserList.reloadData()
                } catch let error {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    private func sortUser() {
        for user in arrUsers {
            let key = "\(user.title![user.title!.startIndex])".uppercased()
            if var userValue = self.userDictionary[key] {
                userValue.append(user)
            } else {
                self.userDictionary[key] = [user]
            }
            self.userSection = [String](self.userDictionary.keys).sorted()
        }
    }
    
    public var userSections: [String] {
        return userSection
    }
    
    public var userDictionaries: [String:[UserList]] {
        return userDictionary
    }
}
