//
//  CoreDataManager.swift
//  7 Project
//
//  Created by 변창원 on 9/9/24.
//

import Foundation
import CoreData
import UIKit

class CoreDataManager {
    
    // 메모의 제목과 메모의 내용을 코어데이터에 저장하는 함수
    func saveMemo(title: String, contents: String) { // 번역 : 함수의 이름은 saveMemo이고 파라미터의 title,contents에 타입은 스트링입니다.
        guard let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext else { return }
        guard let entity = NSEntityDescription.entity(forEntityName: "Entity", in: context) else { return }
        
        let memoObject = NSManagedObject(entity: entity, insertInto: context)
        memoObject.setValue(title, forKey: "name")
        memoObject.setValue(contents, forKey: "memo")
        memoObject.setValue(UUID(), forKey: "id")
        
        try? context.save()
    }
    
    // entity 는 수정될 메모
    // title에는 새롭게 수정 될 제목이 들어올 예정
    // sentence에는 새롭게 수정 될 메모의 문장이 들어올 예정
    func uploadMemo(entity: Entity?, title: String, sentence: String) {
        guard let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext else { return }
        guard let entity else { return }
        guard let uuid = entity.id else { return }

        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Entity")
        fetchRequest.predicate = NSPredicate(format: "id = %@", uuid.uuidString)

        do {
            let fetchData = try context.fetch(fetchRequest)
            guard let objectUpdate = fetchData.first as? NSManagedObject else { return }
            objectUpdate.setValue(title, forKey: "name")
            objectUpdate.setValue(sentence, forKey: "memo")
            do {
                try context.save()
            } catch {
                print(error)
            }
        } catch {
            print(error)
        }
        
    }
    
    // 코어데이터에 저장되어 있는 메모정보들을 불러오는 함수
    func loadMemo() -> [Entity] { // 번역 : 함수의 이름은 loadMemo에 빈파라미터이고 리턴의 배열은 Entity 입니다.
        guard let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext else { return [] }
        
        let memoList = try? context.fetch(Entity.fetchRequest()) // 번역 : 상수의 이름은 memoList이고 할당값은 try옵셔널에 context의fetch는 피라미터에 Entity의fetchRequest 입니다.
                                                            // (try? context.fetch(Entity.fetchRequest())) 의 번역은 아래에!
                                                                 // 코어데이터에서 Entity 데이터를 불러옵니다.
        guard let memoList = memoList else { return [] }
        
        return memoList
    }
}
