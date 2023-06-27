import Foundation
import CoreData


extension Dish {

    static func createDishesFrom(menuItems:[MenuItem],
                                 _ context:NSManagedObjectContext) {
        menuItems.forEach { item in
            guard let isExist = Dish.exists(name: item.title, context), !isExist else {
                return
            }
            let dish = Dish.with(name: item.title, context)
            dish?.name = item.title
            dish?.price = Float(item.price) ?? 0
        }
        Dish.save(context)
    }
    
}
