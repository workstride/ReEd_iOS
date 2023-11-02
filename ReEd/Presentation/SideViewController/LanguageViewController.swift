//
//  LanguageViewController.swift
//  ReEd
//
//  Created by 김건우 on 11/2/23.
//

import UIKit
import SnapKit

class LanguageViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    // 언어 목록
    let languages = ["한국어", "영어", "일본어", "중국어"]

    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "언어 설정"

        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")

        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }

    // 테이블 뷰 데이터 소스 메서드
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languages.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = languages[indexPath.row]
        return cell
    }

    // 테이블 뷰 델리게이트 메서드
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 선택한 언어 처리 로직을 추가합니다.
        let selectedLanguage = languages[indexPath.row]
        print("선택한 언어: \(selectedLanguage)")
    }
}
