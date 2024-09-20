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
class view: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    let folder = UIButton() // forder의 값은 UIButton이고 명칭은 플더문장을 보여줍니다.
    let search = UISearchBar() // search의 값은 UISearchBar이고 검색창을 보여줍니다.
    let cell = UITableView() // cell의 값은 UITableView이고 ios의 화면에 사각형 유아이테이블뷰가 있습니다.
    let create = UIButton() // create의 값은 UIButton이고 명칭은 작성하기를 보여줍니다.
    let cdm = CoreDataManager() // cdm의 값은 CoreDataManager이고 불러옵니다.
    var memorist = [Entity]() // memorist의 값은 배열의 Entity 객체입니다.
    
    var filteredItems: [Entity] = [] // 메모의 검색된 결과값을 저장합니다.[역할]
    var isFiltering = false // 검생중의 확인역할입니다.
    
    
    func reloadData() { // 함수의 이름은 reloadData의 memorist 값 cdm의 loadMemo를 불러옵니다.
        memorist = cdm.loadMemo()
        cell.reloadData() // cell의 reloadData 함수를 호출합니다.
    }
    
    
    
    // 메모리스트 변수를 만들고 할당값은 Entity배열을 만듭니다.
    // tutor : 저장한 메모들이 보여지는 화면입니다.
    // 저장한 데이터는 코어데이터를 통해서 가져오기 때문에 CoreDataManager 객체를 상수로 갖고 있으면 좋을거 같아요.
    // 상수를 만들어서 CoreDataManager 객체를 할당해주세요!
    
    //dataSource 각 셀에 대한 행 수와 데이터를 제공합니다.
    //delegate 사용자가 행을 선택할 때 일어나는 일을 처리합니다.
    
    override func viewDidLoad() { // 함수의 이름은 뷰디드로드이고 파라미터의 반환타입은 없습니다.
        super.viewDidLoad()
        cell.delegate = self // 셀의 행을 선택할 떄 일어나는 일을 처리하고 값은 셀프입니다.
        cell.dataSource = self // 셀의 행 수와 데이터를 제공하고 값은 셀프입니다.
        search.delegate = self // search의 클릭할 떄 일어나는 일을 처리하고 값은 셀프입니다.
        // 하위 뷰,상위 뷰 위에 렌더링된다.
        // 'addSubview' 를 호출하면, 다른 뷰를 매개 변수로 전달합니다. = 매개를 모르겠어요.
        // 이 매개 변수는 자식 뷰(하위 뷰)가 되고, `addSubview`를 호출한 뷰는 부모 뷰(슈퍼뷰)가 됩니다.
        // addSubview(_:)뷰의 계층 구조에 하위 뷰를 추가하는 iOS 프레임워크의 방법입니다. 이 방법은 부모 보기(수퍼뷰)에서 호출되어 다른 보기(하위보기)를 자식으로 삽입하여 하위 보기를 부모 보기 레이아웃의 일부로 표시하고 상호 작용할 수 있도록 합니다.
        // 목적: 현재 보기에 자식 보기(UIView)를 추가하여 화면에 표시할 수 있도록 합니다.
        // 선언:func addSubview(_ view: UIView)
        // 매개 변수: view: 그UIView서브뷰로 추가될 인스턴스.
        // 핵심 포인트:
        // 서브뷰 배치: 하위 뷰는 상위 뷰의 하위 뷰 스택 상단에 삽입되며, 이는 이전에 추가된 다른 하위 뷰 위에 렌더링된다는 것을 의미합니다.
        // 시각 및 상호 작용 계층: 서브뷰는 터치와 사용자 상호작용을 받을 수 있다. 그들은 또한 부모 보기에서 변환 및 애니메이션과 같은 속성을 상속받습니다.
        // 사용법: 일반적으로 화면에 버튼, 라벨 또는 사용자 지정 보기를 추가하는 것과 같이 프로그래밍 방식으로 레이아웃을 설정할 때 사용됩니다.
        view.addSubview(folder)
        view.addSubview(search)
        view.addSubview(cell)
        view.addSubview(create)
        
        folder.setTitle("폴더", for: .normal) // folder의 폴더단어를 보여줍니다.
        folder.setTitleColor(UIColor.black, for: .normal) // folder의 단어색상은 검정색 입니다.
        folder.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10) // folder의 단어굵기를 10으로 조정합니다.
        
        folder.snp.makeConstraints{ make in
            make.top.equalToSuperview().inset(50)
            make.leading.equalToSuperview().inset(25)
        }
        
        search.placeholder = "검색어 입력해주세요." // placeholder 값은 검색어 입력해주세요 입니다.
        search.searchBarStyle = .default // search스타일은 default입니다.
        search.tintColor = UIColor.gray // 단어의 색상은 그레이 입니다.
        
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
        
        create.setTitle("작성하기", for: .normal) // create의 단어 작성하기가 보입니다.
        create.setTitleColor(UIColor.black, for: .normal) // create의 단어색상은 검정색 입니다.
        create.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10) // create의 글자 사이즈 굵기는 10입니다.
        create.addTarget(self, action: #selector(createTapped), for: .touchUpInside) // create의 버튼을 클릭합니다.
        
        create.snp.makeConstraints{ make in
            make.top.equalTo(cell.snp.bottom).inset(-50)
            make.trailing.equalToSuperview().inset(25)
            make.bottom.equalToSuperview().inset(50)
            
        }
    }
    
    // viewWillAppear(_:)뷰 컨트롤러의 수명 주기 메서드로, 뷰가 사용자에게 표시되기 직전에 호출됩니다. 뷰가 화면에 표시될 때마다 발생해야 하는 작업을 수행할 수 있는 기회를 제공합니다.
    // 이 예에서, 테이블 뷰 데이터는 뷰가 화면에 나타나려고 할 때마다 다시 호출됩니다. 이것은 표시된 데이터가 최신 상태임을 보장합니다.
    // ViewWillAppear(_:): 이 방법은 의 일부입니다UIViewController수명 주기. 뷰 컨트롤러의 뷰가 뷰 계층에 추가되고 화면에 표시되기 직전에 호출됩니다. 데이터 새로 고침이나 UI 업데이트와 같이 뷰가 나타날 때마다 코드를 실행하기 위해 이 방법을 재정의할 수 있습니다.
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 코드가 
        // 셀프의 memorist 값은 cdm의 loadMemo를 호출합니다.
        // 여기에 셀프 호출값이 들어가면 어떤 역할이 있나요?
        self.memorist = cdm.loadMemo()
        
        
    }
    // items,filteredItems,isFiltering
    // 이 함수는 tableView의 보여줄 개수를 리턴해야 합니다.
    // 만약에 검색중인 상태라면 검색된 결과의 개수를 보여주고 검색중이 아니라면 전체메모 개수를 보여줍니다.
    // 조건문의
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            // 검색 중인 상태이므로 검색된 결과 개수를 리턴
            return filteredItems.count
        } else {
            // 검색 중이 아닌 경우 전체 메모 개수를 리턴
            return memorist.count
        }
    }
    // IndexPath테이블 뷰가 쿼리하는 섹션과 행을 지정하는 데 사용됩니다. 그것은 두 가지 주요 속성을 가지고 있다
    // cellForRowAt: 이 방법은 주어진 행에 대한 정확한 데이터가 표시되도록 합니다.
    // dequeueReusableCell(withIdentifier:)이다. UITableView테이블 뷰 셀 재사용을 위해. 이는 메모리 사용과 성능을 개선하기 위한 iOS 최적화 프로세스의 일부입니다.
    // `dequeueReusableCell`은 테이블 또는 컬렉션 뷰에 데이터를 표시하기 위한 셀을 만들 때 성능과 메모리 사용을 최적화하기 위해 `UITableView` 및 `UICollectionView`에서 사용되는 방법입니다.
    // row 는 테이블 데이터에서 특정 항목의 인덱스 또는 위치를 나타냅니다.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 뷰에 데이터를 표시하고 뷰의 셀을 섹션과 행을 지정합니다.
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        // 테이블뷰의 셀 제목은 현재 모른다. 제목 셀행의 선택이 가능하다.
        if isFiltering {
            cell.textLabel?.text = "\(filteredItems[indexPath.row].name!)"
        }else{
            cell.textLabel?.text = "\(memorist[indexPath.row].name!)"

        }
        
        return cell
    }
    
    // UISearchBarDelegate 함수: 검색 텍스트 변경 시 호출
    // textDidChange 메서드는 텍스트가 변경된 후에 호출되므로, 변경된 텍스트를 사용합니다.
    // isEmpty는 Swift의 여러 타입에서 사용되는 속성으로, 주로 문자열이나 컬렉션(예: 배열, 딕셔너리 등)에서 사용됩니다. 이 속성은 해당 객체가 비어 있는지(즉, 요소가 없는지) 확인하는 데 사용됩니다.
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty { // 조건문 searchText의 isEmpty는 객체가 비어 있는지 없는지 확인 합니다.
            isFiltering = false  // 검색어가 없을 경우 필터링 합니다.
        } else {
            isFiltering = true   // 검색어가 있을 경우 필터링 합니다.
//            filteredItems = memorist.filter { $0.lowercased().contains(searchText.lowercased()) }
            
            // 1. filteredItmes을 빈 배열로 만듭니다.
            // 2. memorist 배열을 반복문을 사용해서 name이 searchText가 포함되어 있다면 filteredItems에 추가합니다.
            
            // 힌트
            // - 포함되어 있다면은 contains 함수를 사용하면 됩니다.
            // - filteredItems 배열에 추가하려면 append 함수를 사용하면 됩니다.
            filteredItems = []
            for memo in memorist  { // memorist의 타입은 빈배열에 Entity입니다. 그리고 memo의 타입은 Entity 입니다.
                if memo.name!.contains(searchText.lowercased()) {
                    filteredItems.append(memo)
                   
                }
            }
            
            
            
            
        }
        cell.reloadData()  // 테이블 뷰 갱신
    }
    
    // UISearchBarDelegate 함수: 검색 버튼(키보드의 "Search")을 눌렀을 때 호출v
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()  // 키보드 내리기
    }
    
    // UISearchBarDelegate 함수: 취소 버튼 클릭 시 호출
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        isFiltering = false
        cell.reloadData()
        searchBar.resignFirstResponder()  // 키보드 내리기
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


