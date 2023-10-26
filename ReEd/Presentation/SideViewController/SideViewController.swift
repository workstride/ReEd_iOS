//
//  SideViewController.swift
//  ReEd
//
//  Created by 김건우 on 10/13/23.
//

import UIKit
import SideMenu

class SideViewController: UITableViewController {
    let menuOptions = ["공지사항", "로그아웃"]

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuOptions.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuCell") ?? UITableViewCell(style: .default, reuseIdentifier: "SideMenuCell")
        cell.textLabel?.text = menuOptions[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        // 사이드 메뉴 옵션을 처리합니다.
        if indexPath.row == 0 {
            // 공지사항 선택 시 처리
            // 여기에 공지사항 관련 코드 추가
        } else if indexPath.row == 1 {
            // 로그아웃 선택 시 처리
            // 여기에 로그아웃 관련 코드 추가
        }

        // 사이드 메뉴를 닫습니다.
        dismiss(animated: true, completion: nil)
    }
}
