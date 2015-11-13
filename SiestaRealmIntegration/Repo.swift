//
//  Repo.swift
//  SiestaRealmIntegration
//
//  Created by Annica Burns on 11/11/15.
//

import RealmSwift

class Repo: Object {
    
    dynamic var name = ""
    dynamic var full_name = ""
    dynamic var created_at = ""
    dynamic var updated_at = ""
    dynamic var watchers = 0
    dynamic var siestaKey = ""
    
    override static func primaryKey() -> String? {
        return "full_name"
    }
    
}

extension Repo {
    
    class func parseItemList(fromJSON:AnyObject) -> [Repo] {
        var list = [Repo]()
        
        if let jsonArray = fromJSON as? NSArray {
            for itemDictionary in jsonArray {
                let item = Repo(value: itemDictionary)
                list.append(item)
            }
        } else if let jsonDictionary = fromJSON as? NSDictionary {
            list.append(Repo(value: jsonDictionary))
        }
        
        return list
    }
    
}