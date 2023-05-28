import UIKit
import SnapKit
import Then

class ScheduleViewController: UIViewController {

    private let scrollView = UIScrollView()

    private let bottomRightButton = UIButton().then {
        $0.backgroundColor = .cyan
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
            ("수학 학원", "대구광역시 00로 00길", "10:00", "12:00"),
            ("영어 학원", "서울특별시 00로 00길", "09:30", "11:30"),
            ("과학 학원", "울산광역시 00로 00길", "14:00", "13:00"),
            ("코딩 학원", "부산광역시 00로 00길", "15:00", "16:00"),
            ("게임 학원", "대전광역시 00로 00길", "15:00", "18:00"),
            ("사회 학원", "광주광역시 00로 00길", "21:00", "24:00"),
            // 추가적인 학원 데이터를 이곳에 추가
        ]

        var academyViews: [UIView] = []

        for (name, location, startTime, endTime) in academyData {
            let academyView = UIView().then {
                $0.backgroundColor = .cyan
                $0.layer.cornerRadius = 8
            }

            let nameLabel = UILabel().then {
                $0.text = name
                $0.textColor = .black
                $0.font = UIFont.boldSystemFont(ofSize: 20)
                $0.textAlignment = .left
            }

            let locationLabel = UILabel().then {
                $0.text = location
                $0.textColor = .black
                $0.textAlignment = .left
            }

            let timeLabel = UILabel().then {
                $0.text = "\(startTime)~\(endTime)"
                $0.textColor = .black
                $0.textAlignment = .left
            }

            contentView.addSubview(academyView)
            academyView.addSubview(nameLabel)
            academyView.addSubview(locationLabel)
            academyView.addSubview(timeLabel)

            academyView.snp.makeConstraints { make in
                make.leading.equalToSuperview().offset(16)
                make.trailing.equalToSuperview().offset(-16)
                make.height.equalTo(120)
            }

            nameLabel.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(16)
                make.leading.equalToSuperview().offset(16)
            }

            locationLabel.snp.makeConstraints { make in
                make.top.equalTo(nameLabel.snp.bottom).offset(8)
                make.leading.equalToSuperview().offset(16)
            }

            timeLabel.snp.makeConstraints { make in
                make.top.equalTo(locationLabel.snp.bottom).offset(8)
                make.leading.equalToSuperview().offset(16)
            }

            academyViews.append(academyView)
        }

        let sortedAcademyViews = academyViews.sorted { (view1, view2) -> Bool in
            guard let index1 = academyViews.firstIndex(of: view1),
                  let index2 = academyViews.firstIndex(of: view2) else {
                return false
            }

            let startTime1 = academyData[index1].2
            let startTime2 = academyData[index2].2

            let hour1 = Int(startTime1.prefix(2)) ?? 0
            let hour2 = Int(startTime2.prefix(2)) ?? 0

            if hour1 == hour2 {
                let minute1 = Int(startTime1.suffix(2)) ?? 0
                let minute2 = Int(startTime2.suffix(2)) ?? 0
                return minute1 < minute2
            } else {
                return hour1 < hour2
            }
        }

        var previousView: UIView?

        for academyView in sortedAcademyViews {
            contentView.addSubview(academyView)

            academyView.snp.makeConstraints { make in
                if let previousView = previousView {
                    make.top.equalTo(previousView.snp.bottom).offset(16)
                } else {
                    make.top.equalToSuperview().offset(16)
                }

                make.leading.equalToSuperview().offset(16)
                make.trailing.equalToSuperview().offset(-16)
                make.height.equalTo(120)
            }

            previousView = academyView
        }

        contentView.snp.makeConstraints { make in
            make.bottom.equalTo(previousView?.snp.bottom ?? contentView.snp.bottom).offset(16)
        }
    }
}
