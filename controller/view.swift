//
//  view.swift
//  7 Project
//
//  Created by 김동준 on 9/5/24.
//

import UIKit
import SnapKit
/**
 */
// 클래스의 이름은 view이고 타입은 UIViewController,UITableViewDelegate,UITableViewDataSource 스트링입니다.
class view: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let folder = UIButton() // 상수의 이름은 folder 할당값은 유아이버튼 객체 입니다.
    let search = UISearchBar() // 상수의 이름은 search 할당값은 유아이서치바 객체 입니다.
    let cell = UITableView() // 상수의 이름은 cell 할당값은 유아이테이블뷰 객체 입니다.
    let create = UIButton() // 상수의 이름은 create 할당값은 유아이버튼 객체 입니다.
    let cdm = CoreDataManager() // 상수의 이름은 cdm이고 할당값은 CoreDataManager에 객체입니다.
    var memorist = [Entity]()
    
    
    
    func reloadData() {
        memorist = cdm.loadMemo()
        cell.reloadData()
    }
    
    // 메모리스트 변수를 만들고 할당값은 Entity배열을 만듭니다.
    // tutor : 저장한 메모들이 보여지는 화면입니다.
    // 저장한 데이터는 코어데이터를 통해서 가져오기 때문에 CoreDataManager 객체를 상수로 갖고 있으면 좋을거 같아요.
    // 상수를 만들어서 CoreDataManager 객체를 할당해주세요!
    
    override func viewDidLoad() { // 함수의 이름은 뷰디드로드이고 파라미터의 반환타입은 없습니다.
        super.viewDidLoad()
        cell.delegate = self
        cell.dataSource = self
        view.addSubview(folder) // 뷰의 에디디서브뷰함수를 파라미터의 folder를 호출합니다.
        view.addSubview(search) // 뷰의 에디디서브뷰함수를 파라미터의 search를 호출합니다.
        view.addSubview(cell)   // 뷰의 에디디서브뷰함수를 파라미터의 cell를 호출합니다.
        view.addSubview(create) // 뷰의 에디디서브뷰함수를 파라미터의 create를 호출합니다.
        
        folder.setTitle("폴더", for: .normal) // 폴더의 setTitle 함수를 호출합니다.
        folder.setTitleColor(UIColor.black, for: .normal) // 폴더의 setTitleColor 함수를 호출합니다.
        folder.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10) // 폴더는 타이틀레이블옵셔널의 폰트 할당값은 유아이폰트의 볼드시스템폰트에 파라미터사이즈타입은 10입니다.
        
        folder.snp.makeConstraints{ make in
            make.top.equalToSuperview().inset(50)
            make.leading.equalToSuperview().inset(25)
        }
        
        search.placeholder = "검색어 입력해주세요." // 서치의 placeholder 할당값은 스트링 검색어 입력해주세요 입니다.
        search.searchBarStyle = .default // 서치의 searchBarStyle 할당값은 default 입니다.
        search.tintColor = UIColor.gray // 서치의 tintColor 할당값은 유아이색깔의 그레이입니다.
        
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
        cell.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        //        cell.tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapHeader))
        //        addGestureRecognizer(tapGesture)
        
        cell.snp.makeConstraints{ make in
            make.top.equalTo(search.snp.bottom).inset(-15)
            make.leading.equalToSuperview().inset(25)
            make.trailing.equalToSuperview().inset(25)
            make.bottom.equalToSuperview().inset(125)
        }
        
        create.setTitle("작성하기", for: .normal)
        create.setTitleColor(UIColor.black, for: .normal)
        create.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
        create.addTarget(self, action: #selector(createTapped), for: .touchUpInside)
        
        create.snp.makeConstraints{ make in
            make.top.equalTo(cell.snp.bottom).inset(-50)
            make.trailing.equalToSuperview().inset(25)
            make.bottom.equalToSuperview().inset(50)
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // tutor : 화면에 보여지기 전에 호출되는 함수 viewWillAppear 입니다.
        //         화면에 보여지기 전에 메모정보를 가져오면 최신의 데이터를 보여줄 수 있을거 같아요!
        //         메모정보를 가져오는 함수를 호출해보세요.
        
        // 방금만든 메모리스트 변수의 cdm에 로드메모 결과값을 할당합니다.
        self.memorist = cdm.loadMemo()
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memorist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(memorist[indexPath.row].name!)"
        
        return cell
    }
    
    // 셀을 클릭했을떄 데이터에 저장된 값이 불러옵니다.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedRow = indexPath.row
        print("Selected row at \(selectedRow)")
        print("Selected row at \(indexPath.row)")
        
        tableView.deselectRow(at: indexPath, animated: true)
        let viewcontroller = ViewController() // 상수의 이름은 viewcontroller의 할당값은 ViewController 객체입니다.

        viewcontroller.onDismiss = {
            self.reloadData()
        }
        
        // 09.12 저녁 : 여기 공부해 보세요.
        viewcontroller.ischange = true
        viewcontroller.entity = memorist[selectedRow] // memorist 배열의 selectedRow번째의 값을 viewController의 entity 에 할당한다.
        
        self.present(viewcontroller, animated: true)
    }
}

extension view {
    @objc func createTapped() { // 함수의 이름은 createTapped이고 빈파라미터 데이터타입은 없습니다.
        let viewcontroller = ViewController() // 상수의 이름은 viewcontroller의 할당값은 ViewController 객체입니다.
        viewcontroller.onDismiss = {
            self.reloadData()
        }
        self.present(viewcontroller, animated: true) // 셀프 present의 함수호출입니다.    }
    }
}


