//
//  ScheduleViewController.swift
//  ReEd_iOS
//
//  Created by 김건우 on 2023/05/06.
//

import UIKit
import SnapKit
import Then

class ScheduleViewController: UIViewController {

    private let scrollView = UIScrollView()

    private let bottomRightButton = UIButton().then {
            $0.backgroundColor = .blue
            $0.layer.cornerRadius = 25
            $0.setTitle("+", for: .normal)
            $0.setTitleColor(.black, for: .normal)
        }

        private let contentView = UIView()

        override func viewDidLoad() {
            super.viewDidLoad()

            view.backgroundColor = .white

            view.addSubview(scrollView)
            view.addSubview(bottomRightButton)

            scrollView.addSubview(contentView)
            setupConstraints()
            createAcademyViews()
        }

        private func setupConstraints() {
            scrollView.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(100)
                make.leading.trailing.equalToSuperview()
                make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-100)
            }

            contentView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
                make.width.equalToSuperview()
            }

            bottomRightButton.snp.makeConstraints { make in
                make.bottom.trailing.equalTo(view.safeAreaLayoutGuide).offset(-16)
                make.width.height.equalTo(50)
            }

        }

        private func createAcademyViews() {
            let academyData = [
                ("학원 A", "위치 A", "시간 A"),
                ("학원 B", "위치 B", "시간 B"),
                ("학원 C", "위치 C", "시간 C"),
                // 추가적인 학원 데이터를 이곳에 추가
            ]

            var previousView: UIView?

            for (name, location, time) in academyData {
                let academyView = UIView().then {
                    $0.backgroundColor = .blue
                    $0.layer.cornerRadius = 8
                }

                let nameLabel = UILabel().then {
                    $0.text = name
                    $0.textColor = .white
                    $0.textAlignment = .center
                }

                let locationLabel = UILabel().then {
                    $0.text = location
                    $0.textColor = .white
                    $0.textAlignment = .center
                }

                let timeLabel = UILabel().then {
                    $0.text = time
                    $0.textColor = .white
                    $0.textAlignment = .center
                }

                contentView.addSubview(academyView)
                academyView.addSubview(nameLabel)
                academyView.addSubview(locationLabel)
                academyView.addSubview(timeLabel)

                academyView.snp.makeConstraints { make in
                    make.top.equalTo(previousView?.snp.bottom ?? contentView.snp.top).offset(16)
                    make.leading.equalToSuperview().offset(16)
                    make.trailing.equalToSuperview().offset(-16)
                    make.height.equalTo(120)
                }

                nameLabel.snp.makeConstraints { make in
                    make.centerX.equalToSuperview()
                    make.top.equalToSuperview().offset(16)
                }

                locationLabel.snp.makeConstraints { make in
                    make.centerX.equalToSuperview()
                    make.centerY.equalToSuperview()
                }

                timeLabel.snp.makeConstraints { make in
                    make.centerX.equalToSuperview()
                    make.bottom.equalToSuperview().offset(-16)
                }

                previousView = academyView
            }

            contentView.snp.makeConstraints { make in
                make.bottom.equalTo(previousView?.snp.bottom ?? contentView.snp.bottom).offset(16)
            }
        }
}

// MARK: 선생 - 학생 일정관리 
