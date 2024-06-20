import UIKit

/*
 Dependency inversion  Principle
 
 DIP Is Concept in OOP that promotes
 
 hignlevel class should not depend on low level class which causes tight coupling ..
 
 
 
 DIP emphasis the losse coupling using protocol abstraction  protocols insted of concrete class
 
 */


//without DIP tight coupling

struct Order {
    var amount: Double
    var description : String
    var tax : Double
    var createdBY : String
}

//- High Level Class

class handler {
    private let orderdatabaseOpertaion : orderDataBaseOperation
    /* above line(29 line NUmber) shows class handler is tightly coupled to class orderDataBaseOperation*/
    
    
    init(orderdatabaseOpertaion: orderDataBaseOperation) {
        self.orderdatabaseOpertaion = orderdatabaseOpertaion
    }
    
    func saveOrder(order:Order){
        guard order.amount != 0 else {
            print("Save to order failed")
            return
        }
        orderdatabaseOpertaion.saveOrder(order: order)
    }
    
}

//low level class
class orderDataBaseOperation {
    
    func saveOrder(order:Order) {
        print("Order \(order.amount) with \(order.description) was saved")
        
    }
    
}


let objHandler = handler(orderdatabaseOpertaion: orderDataBaseOperation())
objHandler.saveOrder(order: Order(amount: 300, description: "this is the one order", tax: 2.0, createdBY: "Shreyanka"))



// to Overcome tightcoupling create protocol

protocol storage {
    func saveOrder(order:Order)
}

class handler1 {
    private let orderdatabaseOpertaion : storage
    /* above line(29 line NUmber) shows class handler is tightly coupled to class orderDataBaseOperation*/
    
    
    init(orderdatabaseOpertaion: storage) {
        self.orderdatabaseOpertaion = orderdatabaseOpertaion
    }
    
    func saveOrder(order:Order){
        guard order.amount != 0 else {
            print("Save to order failed")
            return
        }
        orderdatabaseOpertaion.saveOrder(order: order)
    }
    
}

//low level class
class orderDataBaseOperation1:storage {
    
    func saveOrder(order:Order) {
        print("Order \(order.amount) with \(order.description) was saved DATABASE")
    }
    
}

class orderAPIBaseOperation1:storage {
    
    func saveOrder(order:Order) {
        print("Order \(order.amount) with \(order.description) was saved to API")
    }
    
}


let orderStorage = handler1(orderdatabaseOpertaion: orderDataBaseOperation1())

orderStorage.saveOrder(order: Order(amount: 200, description: "this is the one order", tax: 2, createdBY: ""))
let apiStorage = handler1(orderdatabaseOpertaion: orderAPIBaseOperation1())
apiStorage.saveOrder(order: Order(amount: 400, description: "this is the one order", tax: 3, createdBY: ""))
