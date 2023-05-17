import UIKit
import SnapKit

class SettingViewController: UIViewController {

    private let tableView = UITableView()
    private let sectionTitles = ["알림 설정", "사용자 설정", "기타"]
    private let texts = [["알림 설정", "방해금지모드"], ["계정 관리","학원설정"], ["버전"]]
    private var switchStates = [[Bool]](repeating: [Bool](repeating: false, count: 3), count: 3)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension SettingViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return texts[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let label = UILabel()
        label.text = texts[indexPath.section][indexPath.row]
        cell.contentView.addSubview(label)
        label.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
        }

        // MARK: - 알림 스위치 위치 지정
        if indexPath.section == 0 && indexPath.row == 0 {
            let switchView = UISwitch()
            switchView.addTarget(self, action: #selector(switchChanged(_:)), for: .valueChanged)
            switchView.tag = indexPath.row
            cell.contentView.addSubview(switchView)
            switchView.snp.makeConstraints { make in
                make.centerY.equalToSuperview()
                make.trailing.equalToSuperview().offset(-16)
            }
        }

        // MARK: - 방해 금지 모드 버튼 위치 지정
        if indexPath.section == 0 && indexPath.row == 1 {
            let silencebutton = UIButton(type: .system)
            silencebutton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
            silencebutton.addTarget(self, action: #selector(silenceButtonTapped(_:)), for: .touchUpInside)
            silencebutton.tag = indexPath.row
            cell.contentView.addSubview(silencebutton)
            silencebutton.snp.makeConstraints { make in
                make.centerY.equalToSuperview()
                make.trailing.equalToSuperview().offset(-16)
            }
        }
        // MARK: - 계정 관리 버튼 위치 지정
        if indexPath.section == 1 && indexPath.row == 0 {
            let acctMgmtButton = UIButton(type: .system)
            acctMgmtButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
            acctMgmtButton.addTarget(self, action: #selector(acctMgmtButtonTapped(_:)), for: .touchUpInside)
            acctMgmtButton.tag = indexPath.row
            cell.contentView.addSubview(acctMgmtButton)
            acctMgmtButton.snp.makeConstraints { make in
                make.centerY.equalToSuperview()
                make.trailing.equalToSuperview().offset(-16)
            }
        }
        // MARK: - 학원 관리 버튼 위치 지정
        if indexPath.section == 1 && indexPath.row == 1 {
            let acadMgmtButton = UIButton(type: .system)
            acadMgmtButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
            acadMgmtButton.addTarget(self, action: #selector(acadMgmtButtonTapped(_:)), for: .touchUpInside)
            acadMgmtButton.tag = indexPath.row
            cell.contentView.addSubview(acadMgmtButton)
            acadMgmtButton.snp.makeConstraints { make in
                make.centerY.equalToSuperview()
                make.trailing.equalToSuperview().offset(-16)
            }
        }

        if indexPath.section == 2 && indexPath.row == 0 {
            let label = UILabel()
            let versionLabel = UILabel()

            label.text = "버전"
            label.textAlignment = .left
            cell.contentView.addSubview(label)
            label.snp.makeConstraints { make in
                make.centerY.equalToSuperview()
                make.leading.equalToSuperview().offset(16)
            }

            versionLabel.text = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
            versionLabel.textAlignment = .right
            versionLabel.textColor = .orange
            cell.contentView.addSubview(versionLabel)
            versionLabel.snp.makeConstraints { make in
                make.centerY.equalToSuperview()
                make.trailing.equalToSuperview().offset(-16)
            }
        }

        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
}

// MARK: - UITableViewDelegate

extension SettingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == sectionTitles.count - 1 {
            let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 60))

            let logoutButton = UIButton(type: .system)
            logoutButton.setTitle("로그아웃", for: .normal)
            logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
            logoutButton.setTitleColor(.red, for: .normal)
            footerView.addSubview(logoutButton)

            logoutButton.snp.makeConstraints { make in
                make.leading.equalToSuperview().offset(16)
                make.centerY.equalToSuperview()
            }

            return footerView
        }

        return nil
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == sectionTitles.count - 1 {
            return 60
        }

        return CGFloat.leastNormalMagnitude
    }
}

extension SettingViewController {
    @objc private func switchChanged(_ sender: UISwitch) {
        let section = sender.superview?.superview?.tag ?? 0
        let row = sender.tag
        switchStates[section][row] = sender.isOn
        print("스위치 \(section + 1)-\(row + 1): \(switchStates[section][row] ? "켜짐" : "꺼짐")")
    }
    // MARK: - 알림 스위치 on/off상태

    @objc private func logoutButtonTapped() {
        print("로그아웃 버튼이 눌렸습니다.")
        let viewController = ViewController()
        UIApplication.shared.windows.first?.rootViewController = viewController

    }

    // MARK: - 로그아웃 버튼 눌렸을때 -> 현재 그냥 로그인창으로 이동

    @objc private func silenceButtonTapped(_ sender: UIButton) {
        let section = sender.superview?.superview?.tag ?? 0
        let row = sender.tag
        print("이미지 버튼 \(section + 1)-\(row + 1)이 눌렸습니다.")

    }

    // MARK: - 방해 금지 모드 버튼 눌렸을때

    @objc private func acctMgmtButtonTapped(_ sender: UIButton) {
        let section = sender.superview?.superview?.tag ?? 0
        let row = sender.tag
        print("방해금지 버튼이 클릭되었다")
    }

    @objc private func acadMgmtButtonTapped(_ sender: UIButton) {
        let section = sender.superview?.superview?.tag ?? 0
        let row = sender.tag
        print("학원관리 버튼이 클릭되었다")
    }

}
// MARK: - 계정 관리 버튼 눌렸을때
