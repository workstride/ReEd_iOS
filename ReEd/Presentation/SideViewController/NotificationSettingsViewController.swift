//
//  NotificationSettingsViewController.swift
//  ReEd
//
//  Created by 김건우 on 11/5/23.
//

import UIKit
import SnapKit

class NotificationSettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // 테이블 뷰 및 데이터 모델
    let tableView = UITableView()
    var notificationsEnabled = false
    var nightModeEnabled = false

    override func viewDidLoad() {
        super.viewDidLoad()

        // 테이블 뷰 설정
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isScrollEnabled = false // 스크롤 비활성화
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)

        // SnapKit을 사용하여 레이아웃 설정
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }

    // 테이블 뷰 데이터 소스 메서드
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2 // 알림 및 야간 알림 두 개의 행
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = indexPath.row == 0 ? "알림 수신" : "야간 알림 수신"

        // 토글 스위치 추가
        let toggleSwitch = UISwitch()
        toggleSwitch.addTarget(self, action: #selector(toggleSwitchChanged(sender:)), for: .valueChanged)
        cell.accessoryView = toggleSwitch

        // 야간 알림 스위치의 상태 설정

        return cell
    }

    // 토글 스위치 상태 변경 처리
    @objc func toggleSwitchChanged(sender: UISwitch) {
      
    }
}
