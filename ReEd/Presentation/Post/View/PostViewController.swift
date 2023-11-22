//
//  PostViewController.swift
//  ReEd
//
//  Created by 김건우 on 11/5/23.
//

import UIKit
import SnapKit
import Alamofire

//FIXME: 게시판 뷰 수정하기
class PostViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    let tableView = UITableView()
    let refreshControl = UIRefreshControl()
    let activityIndicator = UIActivityIndicatorView(style: .large)
    var postViewModels: [PostViewModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // 테이블 뷰 설정
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.refreshControl = refreshControl

        // 새로고침 액션 설정
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)

        // 프로그레스 바 설정
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = .gray

        // 글쓰기 버튼 추가
        let addButton = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(addPost))
        self.navigationItem.rightBarButtonItem = addButton

        // 레이아웃 설정 및 추가
        view.addSubview(tableView)
        view.addSubview(activityIndicator)

        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }

        activityIndicator.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // 초기 데이터 로드
        refreshData()
    }

    @objc func refreshData() {
        // 데이터를 가져오는 중에 프로그레스 바 표시
        activityIndicator.startAnimating()

        // 서버에서 데이터 가져오는 비동기 작업을 수행
        fetchDataFromServer { [weak self] postViewModels in
            // 데이터를 가져온 후, UI 업데이트 및 프로그레스 바 숨김
            self?.refreshControl.endRefreshing()
            self?.activityIndicator.stopAnimating()

            if let postViewModels = postViewModels {
                self?.postViewModels = postViewModels
                self?.tableView.reloadData()
            }
        }
    }

    @objc func addPost() {
        // 글쓰기 버튼을 누르면 글쓰기 화면을 표시하도록 구현하세요.
        // 글쓰기 화면을 표시하는 코드를 추가하세요.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postViewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let post = postViewModels[indexPath.row]
        cell.textLabel?.text = post.title
        // 다른 셀 내용 설정
        return cell
    }

    func fetchDataFromServer(completion: @escaping ([PostViewModel]?) -> Void) {
        let url = "YOUR_API_URL"
        let headers: HTTPHeaders = [
            "Authorization": "Bearer YOUR_TOKEN"
        ]
        
        let parameters: [String: Any] = [
            "page": 0,
            "size": 0,
            "type": "string",
            "keyword": "string",
            "academyId": 0
        ]
        
        AF.request(url, method: .get, parameters: parameters, headers: headers).responseJSON { response in
            switch response.result {
            case .success(let data):
                if let posts = try? JSONDecoder().decode([Post].self, from: data as! Data) {
                    let postViewModels = posts.map { PostViewModel(post: $0) }
                    completion(postViewModels)
                } else {
                    completion(nil)
                }
            case .failure(let error):
                print("Error: \(error)")
                completion(nil)
            }
        }
    }
}

