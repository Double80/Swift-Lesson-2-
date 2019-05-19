import UIKit

// 1. Придумать класс, методы которого могут создавать непоправимые ошибки. Реализовать их с помощью try/catch.
// 2. Придумать класс, методы которого могут завершаться неудачей. Реализовать их с использованием Error.


enum dpsPaymentSystemError: Error {
    case insufficientFunds(rublesLacking: Int)
    case invalidFine
}


struct FineCharacteristics {
    var price: Int
    var daysToPay: Int
}


class dpsPaymentSystem {
    var FineList = [
        "Превышение скорости" : FineCharacteristics(price: 500, daysToPay: 14) ,
        "Пересечение сплошной" : FineCharacteristics(price: 3500, daysToPay: 30),
        "Неправильная парковка": FineCharacteristics(price: 2500, daysToPay: 21),
        "Проезд на красный" : FineCharacteristics(price: 5000, daysToPay: 30)
    ]
    
var paidByDriver = 0
    
    func fines(fineName name: String) throws {
        guard var fine = FineList[name] else {
            throw dpsPaymentSystemError.invalidFine
        }
        
        guard fine.price <= paidByDriver else {
            throw dpsPaymentSystemError.insufficientFunds(rublesLacking: fine.price - paidByDriver)
        }
        
        paidByDriver -= fine.price
        
        print("Оплачен штраф за \(name)")
        
    }
}


let finesAlocated = [
    "Alex":"Первышение скорости",
    "John":"Пересечение сплошной",
    "John":"Неправильная парковка",
    "Bill":"Выключенные фары"
]


func payFine(person: String, DPSPayment: dpsPaymentSystem) throws {
    
    let fineToBePaid = finesAlocated[person] ?? ""
    try dpsPaymentSystem.fines(fineName: fineToBePaid)
}

var DPSpayment = dpsPaymentSystem()
DPSpayment.paidByDriver = 3500


do {
    try payFine(person: "John", DPSPayment: dpsPaymentSystem)
} catch dpsPaymentSystemError.insufficientFunds {
    print("Недостаточно средств. требуется доплатить \(dpsPaymentSystem.paidByDriver)")
} catch dpsPaymentSystemError.invalidFine {
    print("Данного штрафа не существует")
}

