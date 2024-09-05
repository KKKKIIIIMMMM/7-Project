//
//  view.swift
//  7 Project
//
//  Created by 김동준 on 9/5/24.
//

import UIKit
import SnapKit

class view: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    let folder = UIButton()
    let search = UISearchBar()
    let cell = UITableView()
    let create = UIButton()
    
override func viewDidLoad() {
    super.viewDidLoad()
    
    view.addSubview(folder)
    view.addSubview(search)
    view.addSubview(cell)
    view.addSubview(create)
    
    folder.setTitle("폴더", for: .normal)
    folder.setTitleColor(UIColor.black, for: .normal)
    folder.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
    
    folder.snp.makeConstraints{ make in
        make.top.equalToSuperview().inset(50)
        make.leading.equalToSuperview().inset(25)
    }
    
    search.placeholder = "검색어 입력해주세요."
    search.searchBarStyle = .default
    search.tintColor = UIColor.gray
    
    search.snp.makeConstraints{ make in
        make.top.equalTo(folder.snp.bottom).inset(-10)
        make.leading.equalToSuperview().inset(25)
        make.trailing.equalToSuperview().inset(25)
    }
    
    cell.rowHeight = 50 // 테이블 뷰의 각 행(셀) 높이를 설정합니다. 모든 셀이 동일한 높이를 가지도록 설정할 떄 사용됩니다.
                        // 셀의 rowHeight 할당값은 50 입니다.
    cell.estimatedRowHeight = 0 // 각 셀의 예상 높이를 설정합니다. 셀 높이가 동적으로 변경되는 경우, 성능 최적화를 위해 예상 높이를 설정할 수 있습니다.
                                 // 셀의 estimatedRowHeight 할당값은 50 입니다.
    cell.sectionFooterHeight = 0 // 섹션 푸터의 높이를 설정합니다.
                                  // 셀의 sectionFooterHeight 할당값은 50 입니다.
    cell.separatorColor = UIColor.black // 셀 사이의 구분선 색상을 설정합니다.
                                            // 셀의 separatorColor 할당값은 UIColor의 라이트그레이 입니다.
    cell.allowsSelection = true // 셀이 선택 가능한지 여부를 설정합니다. false로 설정하면 셀이 선택되지 않습니다.
                                // 셀의 allowsSelection 할당값은 참입니다.
    cell.register(UITableViewCell.self, forCellReuseIdentifier: "cell") // 테이블 뷰에서 사용할 셀의 클래스 또는 Nib 파일을 등록합니다.
                                                                        // 셀의 register 의 함수를 호출합니다.
    cell.backgroundColor = .white // 셀의 백그라운드 할당값은 흰색 입니다.
    
    cell.dataSource = self // 테이블 뷰에서 데이터를 관리하는 객체로, 데이터 소스가 제공하는 데이터로 테이블 뷰의 셀을 구성합니다. 일반적으로 UITbleViewDataSource 프로토콜을 준수하는 뷰 컨트롤러에 할당됩니다.
                           // 셀의 dataSource 할당값은 셀프입니다.
    
    
    cell.snp.makeConstraints{ make in
        make.top.equalTo(search.snp.bottom).inset(-15)
        make.leading.equalToSuperview().inset(25)
        make.trailing.equalToSuperview().inset(25)
        make.bottom.equalToSuperview().inset(125)
    }
    
    create.setTitle("작성하기", for: .normal)
    create.setTitleColor(UIColor.black, for: .normal)
    create.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
    
    create.snp.makeConstraints{ make in
        make.top.equalTo(cell.snp.bottom).inset(50)
        make.trailing.equalToSuperview().inset(25)
        make.bottom.equalToSuperview().inset(-100)
        
    }
}
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Row \(indexPath.row)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected row at \(indexPath.row)")
    }
}


    




































//class View: UIViewController, UITableViewDataSource, UITableViewDelegate {
//
//    let tableView = UITableView()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        tableView.frame = self.view.bounds
//        tableView.dataSource = self
//        tableView.delegate = self
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//        tableView.rowHeight = 60
//        
//        self.view.addSubview(tableView)
//    }
//
//    // UITableViewDataSource 메서드
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 10
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = "Row \(indexPath.row)"
//        return cell
//    }
//
//    // UITableViewDelegate 메서드
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("Selected row at \(indexPath.row)")
//    }
//}
