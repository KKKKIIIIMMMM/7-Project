//
//  ViewController.swift
//  7 Project
//
//  Created by 김동준 on 8/22/24.

//
//  ViewController.swift
//  7 Project
//
//  Created by 김동준 on 8/22/24.

import UIKit
import SnapKit
import CoreData

class ViewController: UIViewController {
    
    let colorpicktab = UIColorPickerViewController()
    var color = UIButton()
    let preparation = UIButton()
    let button = UIButton()
    let titlelabel = UILabel()
    let memotext = UITextView()
    let textfield = UITextField()
    let coreDataManager = CoreDataManager()
    var onDismiss: (() -> Void)?
    var ischange : Bool = false
    var entity: Entity? // 수정할 메모.
    // 만약에 entity 변수가 nil이 아니면 안에있는 name값은 제목에 textfield에 memo값은 textview에 나오게 해주세요.
    var COLOR = UIColor.gray
    
    // modern
    let textView = UITextView()
    let nredom = UIImageView()
    var weivtxet = false
    
    override func viewDidLoad() { // 함수의 이름은 뷰디드로드이고 빈파라미터의 반환타입은 없습니다.
        super.viewDidLoad()
        //                updateNavigationBarButton()
        
        view.addSubview(button) // 뷰의 에디디서브뷰함수를 파라미터의 버튼을입력해서 호출합니다.
        view.addSubview(titlelabel)// 뷰의 에디디서브뷰함수를 파라미터의 타이틀입력해서 호출합니다.
        view.addSubview(textfield)
        view.addSubview(memotext) // 뷰의 에디디서브뷰함수를 파라미터의 메모텍스트입력해서 호출합니다.
        view.addSubview(textView)
        view.addSubview(nredom)
        view.backgroundColor = .white
        view.addSubview(color)
        view.addSubview(preparation)
        
        button.setTitle("수정", for: .normal) // 버튼의 setTitle 함수를 호출합니다.
        button.setTitleColor(UIColor.gray, for: .normal) // 버튼의 setTitleColor 함수를 호출합니다.
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20) // 버튼의 타이틀레이블옵셔널의 폰트 할당값은 유아이폰트의 볼드시스템의 파라미터에 오프사이즈는 20 입니다.
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside) // 버튼의 에디디타켓힘수를 호출합니다.
        
        if ischange == true {
            button.setTitle("수정", for: .normal)
        } else {
            button.setTitle("완료", for: .normal)
        }
        
        button.snp.makeConstraints{ make in
            make.top.equalToSuperview().inset(50)
            make.trailing.equalToSuperview().inset(25)
            make.width.equalTo(50)
            make.height.equalTo(50)
            
        }
        
        titlelabel.text = "메모" // 타이틀의 텍스트 할당값은 메모 입니다.
        titlelabel.textColor = UIColor.gray // 타이틀의 텍스트색깔 할당값은 유아아이색깔의 그레이입니다.
        titlelabel.font = UIFont.systemFont(ofSize: 20) // 타이틀의 폰트 할당값은 유아이폰트의 시스템폰트 파라미터안에 오프사이즈 20입니다.
        
        titlelabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().inset(50)
            make.leading.equalToSuperview().inset(25)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        
        textfield.textColor = UIColor.gray
        textfield.font = UIFont.systemFont(ofSize: 20)
        textfield.backgroundColor = .white
        textfield.layer.borderColor = UIColor.gray.cgColor
        textfield.layer.borderWidth = 0.5
        textfield.textColor = .gray
        
        textfield.snp.makeConstraints{ make in
            make.top.equalTo(titlelabel.snp.bottom).inset(-50)
            make.leading.equalToSuperview().inset(25)
            make.trailing.equalToSuperview().inset(25)
            make.height.equalTo(50)
        }
        
        memotext.font = UIFont.systemFont(ofSize: 20) // 메모텍스트의 폰트 할당값은 유아이폰트의 시스템폰트 파라미터안에 오프사이즈 20입니다.
        memotext.textColor = UIColor.gray // 메모노트의 텍스트색깔 할당값은 유아색깔의 그레이입니다.
        memotext.textAlignment = .left // 메모노트의 textAlignment의 할당값의 왼쪽입니다.
        memotext.backgroundColor = UIColor.white // 메모노트의 backgroundColor의 할당값은 유아이색깔의 흰색입니다.
        memotext.layer.borderColor = UIColor.gray.cgColor
        memotext.layer.borderWidth = 0.5
        memotext.textColor = .gray
        
        memotext.snp.makeConstraints{ make in
            make.top.equalTo(textfield.snp.bottom).inset(-15)
            make.leading.equalToSuperview().inset(25)
            make.trailing.equalToSuperview().inset(25)
            make.height.equalTo(350)
        }
        
        textView.isHidden = true
        textView.font = UIFont.systemFont(ofSize: 20)
        textView.textColor = UIColor.gray
        textView.layer.borderColor = UIColor.gray.cgColor
        textView.layer.borderWidth = 0.5

                
        textView.snp.makeConstraints { make in
            make.top.equalTo(memotext.snp.bottom ).inset(-15)
            make.leading.equalToSuperview().inset(25)
            make.trailing.equalToSuperview().inset(25)
            make.height.equalTo(100)
        }
        
        nredom.image = UIImage(named: "modern")
        
        nredom.snp.makeConstraints{ make in
            make.top.equalTo(textView.snp.bottom).inset(-25)
            make.leading.equalToSuperview().inset(-25)
            make.trailing.equalToSuperview().inset(-25)
        }
        
        color.setTitleColor(UIColor.gray, for: .normal)
        color.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        color.addTarget(self, action: #selector(colorClick), for: .touchUpInside)
        color.setBackgroundImage(UIImage(named: "sparewindow"), for: .normal)
        
        color.snp.makeConstraints{ make in
            make.top.equalTo(nredom.snp.bottom).inset(-15)
            make.leading.equalToSuperview().inset(25)
            make.width.height.equalTo(50)
        }
        
        preparation.setTitleColor(UIColor.gray, for: .normal)
        preparation.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        preparation.addTarget(self, action: #selector(Colortypeinput), for: .touchUpInside)
        preparation.setBackgroundImage(UIImage(named: "Colortype"), for: .normal)
        
        preparation.snp.makeConstraints{ make in
            make.top.equalTo(nredom.snp.bottom).inset(-15)
            make.trailing.equalToSuperview().inset(25)
            make.width.height.equalTo(50)
        }
        
        colorpicktab.selectedColor = UIColor.white
        // 색상 선택 시 알파(투명도)를 선택할 수 있는지 여부를 결정하는 Bool 속성입니다. 기본값은 false입니다.
        colorpicktab.supportsAlpha = false
        // 프로토콜을 채택하는 객체로, 색상 선택 또는 취소 등의 이벤트를 처리할 수 있습니다.
        colorpicktab.delegate = self
        
        
        // 09.12 저녁 : 여기 공부해 보세요.
        
        if let entity = entity {
            textfield.text = entity.name
            memotext.text = entity.memo
            textView.text = entity.sidescreen
            
            //만약에 entity의 색상값이 #000000같다면 색깔을 회색으로 교체합니다.
            //만약에 #0000틀린다면
            // 만약 entity의 색상값이 #000000이라면 색상을 회색으로 교체합니다.
               if entity.color == "#000000" {
                   textfield.textColor = UIColor.gray
                   memotext.textColor = UIColor.gray
                   textView.textColor = UIColor.gray
                   COLOR = UIColor.gray
               } else {
                   // 그렇지 않다면 기존 entity.color 값을 적용
                   textfield.textColor = UIColor.hexStringToUIColor(hex: entity.color)
                   memotext.textColor = UIColor.hexStringToUIColor(hex: entity.color)
                   textView.textColor = UIColor.hexStringToUIColor(hex: entity.color)
                   COLOR = UIColor.hexStringToUIColor(hex: entity.color)
               }
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.onDismiss?()
    }
    
    //@objc func buttonTapped()
    // tutor : 해당 함수는 언제 호출(사용)이 되나요?
    // 동준님 : 완료번튼을 클릭했을경우 호출됩니다.
    @objc func buttonTapped() {// 오브젝트씨의 함수이름은 버튼탭이고 빈파라미터 반환타입은 없습니다.
        self.dismiss(animated: true, completion: nil)
        
        if ischange == false {
            coreDataManager.saveMemo(title: textfield.text!, contents: memotext.text!, color: COLOR, sidescreen: textView.text! )
        } else {
            coreDataManager.uploadMemo(entity: entity, title: textfield.text!, sentence: memotext.text!, color: COLOR, sidescreen: textView.text!)
        }
            
    }
}

extension ViewController: UIColorPickerViewControllerDelegate {
    @objc func colorClick() {
        self.present(colorpicktab, animated: true, completion: nil)
    }
    // 사용자가 색상을 선택할 떄마다 호출
    func colorPickerViewController(_ viewController: UIColorPickerViewController, didSelect color: UIColor, continuously: Bool)  {
        // 실시간으로 선택된 색상을 처리
        textfield.textColor = color
        memotext.textColor = color
        textView.textColor = color
        COLOR = color
        print("색상이 선택됨: \(color)")
    }
    
    @objc func Colortypeinput() {
        weivtxet.toggle()
        
        if weivtxet == true {
            textView.isHidden = false
            
        } else {
            textView.isHidden = true
        }
    }
}






















//// 색상 정하기 개발 스탭
//1. 작성하기 화면에서 왼쪽 아래에 있는 버튼을 누른다.
// 1-1. 버튼을 눌렀을 때 함수가 호출되어야 한다.
// 1-2. 호출된 함수에서는 색상화면이 나타나야 한다.
//2. 색상을 선택하는 화면이 나온다.
//
//3. 색상을 선택하는 화면에서 색상을 변경하면 제목과 메모의 글씨 색상이 바뀐다.
// 3-1. 색상이 선택되었을 때 호출되는 함수를 찾아야 한다. (이 함수에서는 선택된 색상을 알 수 있습니다.)
// 3-2. 해당 함수에서 제목과 메모의 텍스트 색상을 바꾸어야 한다.
//
//4. 이상태로 저장버튼을 눌렀을 때 목록에서도 제목의 색상이 바뀌어야 한다.
// 4-1. 저장버튼을 눌렀을 때 호출되는 함수를 찾는다.
// 4-2. Color가 선택되어 있다면 Color도 같이 저장한다.
// 4-3. CoreData 수정이 필요해요.
//
//09.23 오전 숙제(필수)
//1-1. ViewController(작성화면)에서 왼쪽아래 버튼을 눌르면 함수가 호출되게 해주세요.
//    - 함수이름은 colorButtonTapped으로 해주세요.
//1-2. colorButtonTapped 함수에서는 UIColorPickerViewController 화면을 올라오게 열어주세요.
//    - 블로그를 참고하여 진행해주세요.
//2. 테스트를 진행해보세요.
//
//09.23 오전 숙제(선택) ~ 가능하다면~~~
//3-1. UIColorPickerViewControllerDelegate에 대해서 공부해보세요.
//    - TableView Delegate, DataSource 사용하신것을 참고해서 개발해보시면 좋습니다.
//3-2. colorPickerViewControllerDidSelectColor 함수가 호출되면 색상을 변경해보세요.
//    - 위의 함수는 UIColorPickerViewControllerDelegate에서 제공하는 함수입니다.
