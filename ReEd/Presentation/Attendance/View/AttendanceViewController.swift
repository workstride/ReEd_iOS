//
//  UserAttendanceViewController.swift
//  ReEd
//
//  Created by 김건우 on 10/11/23.
//

import CoreNFC
import RxCocoa
import RxSwift
import SideMenu
import SkeletonView
import SnapKit
import Then
import UIKit

class AttendanceViewController: UIViewController  {
    
    let keychainManager_role = KeychainManager.shared.getLoginInfo().role
    
    let viewModel = NFCScanViewModel()
    
    let UserViewModel = UserProfileViewModel()
    
    var isSideMenuVisible = false
    
    private let attendanceStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 20
        $0.distribution = .fill
    }
    //MARK: - QR코드,NFC 출석 버튼 묶는 스택뷰
    
    private let qrCodeView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
    }
    //MARK: - QR코드
    private let qrCodeLabel = UILabel().then {
        $0.text = "QR코드"
        $0.font = UIFont(name: "NanumGothicBold", size: 20)
        $0.isSkeletonable = true
        $0.textColor = .black
        $0.sizeToFit()
    }
    
    private let qrCodeScanLabel = UILabel().then {
        $0.text = "촬영하기"
        $0.font = UIFont.systemFont(ofSize: 18)
        $0.isSkeletonable = true
        $0.textColor = .black
        $0.sizeToFit()
    }
    
    private let qrCodeIntroduction = UILabel().then {
        $0.text = "수업 전 QR코드를 인식해주세요"
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.isSkeletonable = true
        $0.textColor = .black
        $0.sizeToFit()
    }
    
    private let nfcView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
    }
    
    private let nfcLabel = UILabel().then {
        $0.text = "NFC"
        $0.font = UIFont(name: "NanumGothicBold", size: 20)
        $0.isSkeletonable = true
        $0.textColor = .black
        $0.sizeToFit()
    }
    
    private let nfcScanLabel = UILabel().then {
        $0.text = "태그하기"
        $0.font = UIFont.systemFont(ofSize: 18)
        $0.isSkeletonable = true
        $0.textColor = .black
        $0.sizeToFit()
    }
    
    private let nfcIntroduction = UILabel().then {
        $0.text = "수업 전 NFC영역에 태그하세요."
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.textColor = .black
        $0.isSkeletonable = true
        $0.sizeToFit()
    }
    
    private let userLabel = UILabel().then {
        $0.text = "홍박사님\n안녕하세요"
        $0.font = UIFont(name: "NanumGothic", size: 19)
        $0.textAlignment = .left
        $0.textColor = .black
        $0.numberOfLines = 2
        $0.isSkeletonable = true
    }
    
    private let qrAttendance = UIImageView().then {
        $0.image = UIImage(named: "img_qrcode")
        $0.contentMode = .scaleAspectFit
        $0.isSkeletonable = true
    }
    
    private let nfcAttendance = UIImageView().then {
        $0.image = UIImage(named: "img_nfc")
        $0.contentMode = .scaleAspectFit
        $0.isSkeletonable = true
    }
    
    let burgerButton = UIButton().then {
        $0.setImage(UIImage(named: "MenuBurger"), for: .normal)
    }
    
    private let reed_lisence = UIImageView().then {
        $0.image = UIImage(named: "ReEd_bottom_icon")
        $0.contentMode = .scaleAspectFit
    }
    
    override func viewDidLoad() {
        UserViewModel.getUserInfo()
        
        UserViewModel.userCompletion = { result in
            switch result {
            case .success(let value):
                print("유저 정보 호출 성공!")
                self.userLabel.text = "\(value.name)님\n안녕하세요"
                
            case .failure(let error):
                print("유저 정보 호출 실패!")
                print(error)
            }
        }
        
        if keychainManager_role == "TEACHER" {
            qrCodeScanLabel.text = "QR코드 생성하기"
            qrCodeScanLabel.sizeToFit()
            qrCodeIntroduction.text = "수업전 QR 코드를 생성해주세요"
        }
        
        super.viewDidLoad()
        
        // FIXME: QR이랑 NFC 뷰 클릭 중간에 씹히는거 고치기
        view.backgroundColor = UIColor(hexCode: "#f2f2f2")
        view.addSubview(burgerButton)
        
        setupSubviews()
        setupConstraints()
        setupSideMenu()
    }
    
    private func setupSubviews() {
        
        let qrCodeTapGesture = UITapGestureRecognizer(target: self, action: #selector(qrCodeTapped))
        qrCodeView.addGestureRecognizer(qrCodeTapGesture)
        
        let nfcTapGesture = UITapGestureRecognizer(target: self, action: #selector(nfcTapped))
        nfcView.addGestureRecognizer(nfcTapGesture)
        
        attendanceStackView.addArrangedSubview(qrCodeView)
        attendanceStackView.addArrangedSubview(nfcView)
        
        qrCodeView.addSubview(qrCodeLabel)
        qrCodeView.addSubview(qrCodeScanLabel)
        qrCodeView.addSubview(qrCodeIntroduction)
        
        
        [burgerButton,qrCodeLabel,qrCodeScanLabel,qrCodeIntroduction,nfcLabel,nfcScanLabel,nfcIntroduction,qrAttendance,
         nfcAttendance,reed_lisence,userLabel,attendanceStackView].forEach {
            view.addSubview($0)
        }
    }
    
    private func setupConstraints() {
        
        burgerButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalTo(view.snp.leading).offset(16)
            $0.width.height.equalTo(30)
        }
        
        userLabel.snp.makeConstraints {
            $0.top.equalTo(burgerButton.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-100)
            $0.bottom.equalTo(burgerButton.snp.bottom).offset(80)
        }
        
        attendanceStackView.snp.makeConstraints {
            $0.top.equalTo(userLabel.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(380)
        }
        self.view.sendSubviewToBack(attendanceStackView)
        
        qrCodeLabel.snp.makeConstraints {
            $0.top.equalTo(qrCodeView.snp.top).offset(30)
            $0.leading.equalTo(qrCodeView.snp.leading).offset(30)
            $0.width.equalTo(qrCodeLabel.frame.size.width)
            $0.height.equalTo(40)
        }
        
        qrCodeScanLabel.snp.makeConstraints {
            $0.top.equalTo(qrCodeLabel.snp.bottom).offset(10)
            $0.centerY.equalTo(qrCodeView.snp.centerY)
            $0.leading.equalTo(qrCodeView.snp.leading).offset(30)
            $0.width.equalTo(qrCodeScanLabel.frame.size.width)
            $0.height.equalTo(25)
        }
        
        qrCodeIntroduction.snp.makeConstraints {
            $0.top.equalTo(qrCodeScanLabel.snp.bottom)
            $0.leading.equalTo(qrCodeView.snp.leading).offset(30)
            $0.width.equalTo(qrCodeIntroduction.frame.size.width)
            $0.bottom.equalTo(qrCodeView.snp.bottom).offset(-40)
            $0.height.equalTo(55)
        }
        
        qrAttendance.snp.makeConstraints {
            $0.top.equalTo(qrCodeView.snp.top).offset(50)
            $0.trailing.equalTo(qrCodeView).offset(-20)
            $0.size.equalTo(65)
            $0.bottom.equalTo(qrCodeView.snp.bottom).offset(-68)
        }
        
        nfcLabel.snp.makeConstraints {
            $0.top.equalTo(nfcView.snp.top).offset(30)
            $0.leading.equalTo(nfcView.snp.leading).offset(30)
            $0.width.equalTo(nfcLabel.frame.size.width)
            $0.height.equalTo(40)
        }
        
        nfcScanLabel.snp.makeConstraints {
            $0.top.equalTo(nfcLabel.snp.bottom).offset(10)
            $0.centerY.equalTo(nfcView.snp.centerY)
            $0.leading.equalTo(nfcView.snp.leading).offset(30)
            $0.width.equalTo(nfcScanLabel.frame.size.width)
            $0.height.equalTo(25)
        }
        
        nfcIntroduction.snp.makeConstraints {
            $0.top.equalTo(nfcScanLabel.snp.bottom)
            $0.leading.equalTo(nfcView.snp.leading).offset(30)
            $0.width.equalTo(nfcIntroduction.frame.size.width)
            $0.bottom.equalTo(nfcView.snp.bottom).offset(-40)
            $0.height.equalTo(55)
        }
        
        nfcAttendance.snp.makeConstraints {
            $0.top.equalTo(nfcView.snp.top).offset(50)
            $0.trailing.equalTo(nfcView).offset(-20)
            $0.size.equalTo(65)
            $0.bottom.equalTo(nfcView.snp.bottom).offset(-68)
        }
        
        reed_lisence.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-40)
            $0.leading.trailing.equalToSuperview().inset(50)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-10)
        }
        
        func setLanguage() {
            
            //설정된 언어 코드 가져오기
            let language = UserDefaults.standard.array(forKey: "AppleLanguages")?.first as! String // 초기에 "ko-KR" , "en-KR" 등으로 저장되어있음
            let index = language.index(language.startIndex, offsetBy: 2)
            let languageCode = String(language[..<index]) //"ko" , "en" 등
            
            //설정된 언어 파일 가져오기
            let path = Bundle.main.path(forResource: languageCode, ofType: "lproj")
            let bundle = Bundle(path: path!)
            
            qrCodeIntroduction.text = bundle?.localizedString(forKey: "QRInfo", value: nil, table: nil)
        }
    }
    
    private func setupSideMenu() {
        let sideMenuViewController = SideMenuNavigationController(rootViewController: SideViewController())
        
        sideMenuViewController.presentationStyle = .menuSlideIn
        SideMenuManager.default.leftMenuNavigationController = sideMenuViewController
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
        
        // 버거 버튼을 탭할 때 사이드 메뉴를 토글
        burgerButton.addTarget(self, action: #selector(toggleSideMenu), for: .touchUpInside)
    }
    
    @objc private func toggleSideMenu() {
        if let leftMenuNavigationController = SideMenuManager.default.leftMenuNavigationController {
            
            isSideMenuVisible = true
            present(leftMenuNavigationController, animated: true, completion: nil)
        }
    }
    
    @objc func qrCodeTapped() {
        if keychainManager_role == "TEACHER" {
            navigationController?.pushViewController(QRCodeGenerateViewController(), animated: true)
        }
        
        if keychainManager_role == "STUDENT" {
            self.show(QRCodeScanViewController(), sender: nil)
        }
    }
    
    @objc func nfcTapped() {
        guard NFCNDEFReaderSession.readingAvailable else {
            return
        }
        let session = NFCTagReaderSession(pollingOption:  [.iso14443, .iso15693, .iso18092], delegate: self, queue: nil)
//        let session = NFCTagReaderSession(delegate: self, queue: nil, invalidateAfterFirstRead: false)
        session?.begin()
    }
    
}

extension AttendanceViewController : NFCTagReaderSessionDelegate {
    
    func tagReaderSessionDidBecomeActive(_ session: NFCTagReaderSession) {
        
    }
    
    func tagReaderSession(_ session: NFCTagReaderSession, didInvalidateWithError error: Error) {
        
    }
    
    func tagReaderSession(_ session: NFCTagReaderSession, didDetect tags: [NFCTag]) {
        if case let NFCTag.miFare(tag) = tags.first! {
            session.connect(to: tags.first!) { (error: Error?) in
                let apdu = NFCISO7816APDU(instructionClass: 0, instructionCode: 0xB0, p1Parameter: 0, p2Parameter: 0, data: Data(), expectedResponseLength: 16)
                tag.sendMiFareISO7816Command(apdu) { (apduData, sw1, sw2, error) in
                    let nfcValue = tag.identifier
                        .map { (data) -> String in
                            return String(format: "%X", data)
                        }
                        .joined()
                    print(nfcValue)
                    self.viewModel.sendNFCToServer(code: nfcValue) { result in
                        switch result {
                        case.success():
                            print("nfc 통신 성공!")
                        case .failure(let error):
                            print("nfc 통신 실패!")
                            print(error)
                            print(nfcValue)
                        }
                    }
                }
            }
        }
    }
    
}


