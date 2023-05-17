//
//  NoticeViewController.swift
//  ReEd_iOS
//
//  Created by 김건우 on 2023/05/09.
//

import UIKit
import SnapKit

class NoticeViewController: UIViewController {

    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    func configureUI() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        tableView.dataSource = self
        tableView.register(NoticeCell.self, forCellReuseIdentifier: "NoticeCell")
    }
}

extension NoticeViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell =
                tableView.dequeueReusableCell(withIdentifier: "NoticeCell", for: indexPath) as? NoticeCell else {
            fatalError("Unable to dequeue NoticeCell")
        }
        cell.configure(title: "제목 \(indexPath.row)", date: "2023.05.09")
        return cell
    }
}

class NoticeCell: UITableViewCell {

    let titleLabel = UILabel()
    let dateLabel = UILabel()

    func configure(title: String, date: String) {
        contentView.addSubview(titleLabel)
        contentView.addSubview(dateLabel)

        titleLabel.text = title
        dateLabel.text = date

        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(16)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.trailing.bottom.equalToSuperview().inset(20)
        }
    }
    // MARK: 공통 - 알림장
}
