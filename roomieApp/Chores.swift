//
//  Chores.swift
//  roomieApp
//
//  Created by Allen Lozano on 12/5/18.
//  Copyright © 2018 Kenia Rioja. All rights reserved.
//

import Foundation
import Parse

class Chore: PFObject,PFSubclassing {
    
    @NSManaged var name: PFUser
    @NSManaged var choreString: String
    @NSManaged var firstName: String
    @NSManaged var frequency: String
    
    class func parseClassName() -> String {
        return "Chore"
    }
    
    class func choresDifferent(withChore chorez: String?, withCompletion completion: PFBooleanResultBlock?) {
        
        let chore = Chore()
        
        chore.name = PFUser.current()!
        chore.choreString = chorez!
        chore.frequency = "1/week"
        
        // Save object (following function will save the object in Parse asynchronously)
        chore.saveInBackground(block: completion)
    }
    

}
