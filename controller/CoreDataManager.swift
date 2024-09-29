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
    
    func removeMemo(entity: Entity?) {
           guard let entity else { return }
           guard let id = entity.id else { return }
           guard let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext else { return }
           let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Entity")
           fetchRequest.predicate = NSPredicate(format: "id = %@", "\(id)")
           do {
               let removeObjects = try context.fetch(fetchRequest)
               let objectToDelete = removeObjects[0] as! NSManagedObject
               context.delete(objectToDelete)
               do {
                   try context.save()
               } catch {
                   print(error)
               }
           } catch {
               print(error)
           }


       }
    
    // 코어데이터에 저장하는 함수
    func saveMemo(title: String, contents: String, color: UIColor?, sidescreen: String) { // 번역 : 함수의 이름은 saveMemo이고 파라미터의 title,contents에 타입은 스트링입니다.
        guard let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext else { return }
        guard let entity = NSEntityDescription.entity(forEntityName: "Entity", in: context) else { return }
        let color = color ?? .black
        
        let memoObject = NSManagedObject(entity: entity, insertInto: context)
        memoObject.setValue(title, forKey: "name")
        memoObject.setValue(contents, forKey: "memo")
        memoObject.setValue(UUID(), forKey: "id")
        memoObject.setValue(color.toHexStr(), forKey: "color")
        memoObject.setValue(Date().timeIntervalSince1970, forKey: "time")
        memoObject.setValue(sidescreen, forKey: "sidescreen")
        memoObject.setValue(false, forKey: "restoration")
        try? context.save()
    }
    
    func checkMemo(entity: Entity?, check: String) {
        guard let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext else { return }
        guard let entity else { return }
        guard let uuid = entity.id else { return }
        
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Entity")
        fetchRequest.predicate = NSPredicate(format: "id = %@", uuid.uuidString)
        
        do {
            let fetchData = try context.fetch(fetchRequest)
            guard let objectUpdate = fetchData.first as? NSManagedObject else { return }
            objectUpdate.setValue(check, forKey: "check")
            
            do {
                try context.save()
            } catch {
                print(error)
            }
        } catch {
            print(error)
        }
        
    }
    
    func uploadMemo(entity: Entity?, title: String, sentence: String, color: UIColor?, sidescreen: String) {
        guard let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext else { return }
        guard let entity else { return }
        guard let uuid = entity.id else { return }
        let color = color ?? .black
        
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Entity")
        fetchRequest.predicate = NSPredicate(format: "id = %@", uuid.uuidString)
        
        do {
            let fetchData = try context.fetch(fetchRequest)
            guard let objectUpdate = fetchData.first as? NSManagedObject else { return }
            objectUpdate.setValue(title, forKey: "name")
            objectUpdate.setValue(sentence, forKey: "memo")
            objectUpdate.setValue(color.toHexStr(), forKey: "color")
            objectUpdate.setValue(sidescreen, forKey: "sidescreen")
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
    func loadMemo(restoration: Bool) -> [Entity] {
        guard let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext else { return [] }
        
        let memoList = try? context.fetch(Entity.fetchRequest())
        
        guard var memoList = memoList else { return [] }
        memoList = memoList.map {
            if $0.color == nil {
                $0.color = "#000000"
            }
            return $0
        }
        
        memoList = memoList.filter({ entity in
              entity.restoration == restoration
            })
        
        return memoList
    }
    
    func deleteMemo(entity: Entity?) {
        guard let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext else { return }
        guard let entity else { return }
        guard let uuid = entity.id else { return }
        
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Entity")
        fetchRequest.predicate = NSPredicate(format: "id = %@", uuid.uuidString)
        
        do {
            let fetchData = try context.fetch(fetchRequest)
            guard let objectUpdate = fetchData.first as? NSManagedObject else { return }
            objectUpdate.setValue(true, forKey: "restoration")
            do {
                try context.save()
            } catch {
                print(error)
            }
        } catch {
            print(error)
        }
        
        
    }
}

extension UIColor {
    static func hexStringToUIColor(hex:String?) -> UIColor {
            guard let hex = hex else { return UIColor.black }
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

    
    func toHexStr() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        
        getRed(&r, green: &g, blue: &b, alpha: &a)
        
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        
        return NSString(format:"#%06x", rgb) as String
    }

}
