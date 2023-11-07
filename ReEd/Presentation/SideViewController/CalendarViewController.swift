//
//  CalendarViewController.swift
//  ReEd
//
//  Created by 김건우 on 11/6/23.
//

import UIKit
import FSCalendar
import SnapKit

class CalendarViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource {
    
    let calendar: FSCalendar = {
        let calendar = FSCalendar()
        calendar.appearance.headerDateFormat = "yyyy년 MM월"
        return calendar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(calendar)
        
        calendar.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(300)
        }
        
        calendar.delegate = self
        calendar.dataSource = self
    }
    
    // FSCalendarDelegate를 준수하여 날짜를 선택하면 호출됩니다.
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        // 선택된 날짜에 저장된 데이터를 가져옵니다.
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let selectedDateStr = dateFormatter.string(from: date)
        
        let title = UserDefaults.standard.string(forKey: "title_\(selectedDateStr)") ?? ""
        let content = UserDefaults.standard.string(forKey: "content_\(selectedDateStr)") ?? ""
        
        // 선택된 날짜에 저장된 데이터를 보여주는 화면으로 이동합니다.
        let eventViewController = EventViewController(date: selectedDateStr, title: title, content: content)
        navigationController?.pushViewController(eventViewController, animated: true)
    }
}
