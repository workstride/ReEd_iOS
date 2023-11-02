//
//  SideViewController.swift
//  ReEd
//
//  Created by 김건우 on 10/13/23.
//

import UIKit
import SideMenu

class SideViewController: UITableViewController {
    let menuOptions = [
        ["알림 설정"],
        ["학원 관리", "내 정보 관리"],
        ["언어 설정", "다크모드", "버전", "로그아웃", "탈퇴하기"]
    ]
    
    let sectionTitles = ["알림", "관리", "설정"]
    
    let userLogout = KeychainManager.shared.deleteLoginInfo()
    
    override func viewDidLoad() {
        self.tableView.isScrollEnabled = false
        self.tableView.backgroundColor = .white
        self.overrideUserInterfaceStyle = .light
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuOptions[section].count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuCell") ?? UITableViewCell(style: .default, reuseIdentifier: "SideMenuCell")
        
        tableView.backgroundColor = .white
        cell.textLabel?.text = menuOptions[indexPath.section][indexPath.row]
        cell.backgroundColor = .white
        cell.textLabel?.textColor = .black
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.section == 0 && indexPath.row == 0 {
            print("1")
        }
        else if indexPath.section == 1 && indexPath.row == 0 {
            print("학원 관리")
        }
        else if indexPath.section ==  1 && indexPath.row == 1 {
            print("내 정보 관리")
        } 
        else if indexPath.section == 2 && indexPath.row == 1 {
            showAlert(message: "미 구현된 기능입니다")
        }
        else if indexPath.section == 2 && indexPath.row == 3 {
            userLogout
            if (KeychainManager.shared.getLoginInfo().token == nil) {
                self.showAlert(message: "로그아웃이 완료되었습니다")
            } else {
                self.showAlert(message: "로그아웃이 실패하였습니다")
            }
        }
    }
    
    func showAlert(message: String) {
        let alertController = UIAlertController(title: "", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    // 섹션 헤더의 높이 설정
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40.0 // 원하는 높이로 조정
    }
    
    // 섹션 푸터의 높이 설정
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10.0 // 원하는 높이로 조정
    }
}
