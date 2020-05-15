//
//  FriendViewController.swift
//  SOPT_Assignment
//
//  Created by hjyoo on 2020/05/15.
//  Copyright © 2020 hjyoo. All rights reserved.
//

import UIKit

class FriendViewController: UIViewController {
    
    @IBOutlet weak var friendTableview: UITableView!
    
    var friendInformations: [Friends] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tableviewcell의 구분선 없애기
        friendTableview.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        setfriendInformations()
        friendTableview.dataSource = self
        friendTableview.delegate = self
    }
    
    //설정버튼 눌렀을 때 Actionsheet 나오게 하기
    @IBAction func settingBtnAction(_ sender: Any) {
         let optionMenu = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
             
         let manageAction = UIAlertAction(title: "친구 관리", style: .default)
         let settingAction = UIAlertAction(title: "전체 설정", style: .default)
       
         let cancelAction = UIAlertAction(title: "취소", style: .cancel)

         optionMenu.addAction(manageAction)
         optionMenu.addAction(settingAction)
         optionMenu.addAction(cancelAction)
             
         self.present(optionMenu, animated: true, completion: nil)
    }
    
    private func setfriendInformations() {
        
        let friend1 = Friends(profileImg: "profile10Img", friendName: "천유정", stateMessage: "  ٩(ˊᗜˋ*)و ")
        let friend2 = Friends(profileImg: "profile2Img", friendName: "이주혁", stateMessage: " ᘳ ˘ꀾ˘ ᘰ ")
        let friend3 = Friends(profileImg: "profile3Img", friendName: "김현지", stateMessage: " ฅ^•.ᴥ•^ฅ ")
        let friend4 = Friends(profileImg: "profile4Img", friendName: "박주연", stateMessage: "  ◡‿◡✿  ")
        let friend5 = Friends(profileImg: "profile5Img", friendName: "황인준", stateMessage: " ˵ ͠° (oo) °͠ ˵ ")
        let friend6 = Friends(profileImg: "profile6Img", friendName: "이승호", stateMessage: " (⁰ ꀾ ⁰し) ")
        let friend7 = Friends(profileImg: "profile7Img", friendName: "윤동민", stateMessage: " (*•̀ᴗ•́*)و ̑̑ ")
        let friend8 = Friends(profileImg: "profile8Img", friendName: "김남수", stateMessage: " ミಠ ϖ ಠミწ ")
        let friend9 = Friends(profileImg: "profile9Img", friendName: "황수빈", stateMessage: " ξ(｡◕ˇ◊ˇ◕｡)ξ ")
        let friend10 = Friends(profileImg: "profile10Img", friendName: "이승수", stateMessage: " ʕ·͡ᴥ·ʔﾉ ")
        
        friendInformations = [friend1, friend2, friend3, friend4, friend5, friend6, friend7, friend8, friend9, friend10]
    }
}

extension FriendViewController: UITableViewDelegate {
    
}

extension FriendViewController: UITableViewDataSource {

    //cell header customize
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        //몇번째 section의 header를 custom 할 것인지 정하기
        if section == 2 {
            let friendCountLabel = UILabel()
            friendCountLabel.text = "친구 \(self.friendInformations.count)"
            friendCountLabel.textColor = UIColor(red: 129/255, green: 129/255, blue: 129/255, alpha: 1.0)
            friendCountLabel.frame = CGRect.init(x: 16, y: 8, width: 35, height: 17)
            friendCountLabel.font = UIFont.systemFont(ofSize: 11)
            headerView.addSubview(friendCountLabel)
        }
        return headerView
    }
    //custom한 cell을 제외한 다른 cell 없애는 법
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        else if section == 1 {
            return 0
        }
        else if section == 2 {
            return 35
        }
        return tableView.sectionHeaderHeight
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        default:
            return self.friendInformations.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TopViewCell.identifier, for:
            indexPath) as? TopViewCell else { return UITableViewCell() }
            
            return cell
        case 1:
            guard let myCell = tableView.dequeueReusableCell(withIdentifier: MyProfileCell.identifier, for:
            indexPath) as? MyProfileCell else { return UITableViewCell() }
            
            myCell.profileImg.image = UIImage(named: "profile1Img")
            myCell.nameLabel.text = "유현지"
            
            return myCell
        default:
            guard let friendCell = tableView.dequeueReusableCell(withIdentifier: FriendProfileCell.identifier, for:
            indexPath) as? FriendProfileCell else { return UITableViewCell() }
            
            friendCell.profileImg.image = UIImage(named: friendInformations[indexPath.row].profileImg)
            friendCell.nameLabel.text = friendInformations[indexPath.row].friendName
            friendCell.stateMessageLabel.text = friendInformations[indexPath.row].stateMessage
            
            return friendCell
        }
        return UITableViewCell()
    }
    
    //cell을 swipe하여 삭제하기
     func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        if indexPath.section == 2 {
            let deleteAction = UIContextualAction(style: .destructive, title:  "삭제", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
                            success(true)
                self.friendInformations.remove(at: indexPath.row)
                self.friendTableview.reloadData()
                        })
            return UISwipeActionsConfiguration(actions: [deleteAction])
        }
        else {
            return UISwipeActionsConfiguration()
        }
    }
}
