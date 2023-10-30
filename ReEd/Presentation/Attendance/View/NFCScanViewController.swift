//
//  NFCScanViewController.swift
//  ReEd
//
//  Created by 김건우 on 10/27/23.
//

import UIKit
import CoreNFC
import SnapKit

class NFCScanViewController: UIViewController, NFCNDEFReaderSessionDelegate {
    let nfcValueLabel: UILabel = {
        let label = UILabel()
        label.text = "NFC Value: "
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(nfcValueLabel)

        nfcValueLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }

        // 자동으로 NFC 세션을 시작
        startNFCReading()
    }

    @objc func startNFCReading() {
        guard NFCNDEFReaderSession.readingAvailable else {
            return
        }

        let session = NFCNDEFReaderSession(delegate: self, queue: nil, invalidateAfterFirstRead: false)
        session.begin()
    }

    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        if let firstMessage = messages.first, let firstRecord = firstMessage.records.first {
            let payloadData = firstRecord.payload
            if let nfcValue = String(data: payloadData, encoding: .utf8) {
                DispatchQueue.main.async {
                    self.nfcValueLabel.text = "NFC Value: " + nfcValue
                }
            }
        }
    }

    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
        print("NFC session invalidated with error: \(error.localizedDescription)")
    }
}
