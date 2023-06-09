//
//  TabBarController.swift
//  ReEd_iOS
//
//  Created by 김건우 on 2023/05/06.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let attendanceViewController = AttendanceViewController()
        let scheduleViewController = ScheduleViewController()
        let gradeViewController = GradeViewController()
        let settingViewController = SettingViewController()
        let noticeViewController = NoticeViewController()

        // 탭 바 아이템 설정
        noticeViewController.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(systemName: "house"),
            tag: 0
        )

        scheduleViewController.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(systemName: "magnifyingglass"),
            tag: 1
        )

        gradeViewController.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(systemName: "bell"),
            tag: 2
        )

        settingViewController.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(systemName: "person"),
            tag: 3
        )

        // 탭 바 컨트롤러에 뷰 컨트롤러 추가
        viewControllers = [
            noticeViewController,
            scheduleViewController,
            gradeViewController,
            settingViewController
        ]
        selectedIndex = 0

    }
}
