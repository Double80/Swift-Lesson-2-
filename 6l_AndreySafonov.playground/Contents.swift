import UIKit

//1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
//2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
//3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.

//Протокол стоимости одежды

protocol clothesPrice {
    var clothes: Double { get set }
}

// Две очереди с людьми: ВИП и обычная. Считаем благосостояние членов очереди по их кошелькам.

class manVIP: clothesPrice {
    var clothes: Double
    var bigWallet: Double
    
    func calculateMoney() -> Double {
        return bigWallet + clothes
    }
    
    init(bigWallet: Double, clothes: Double) {
        self.bigWallet = bigWallet
        self.clothes = clothes
    }
}

extension manVIP: CustomStringConvertible {
    var description: String {
        return "Размер кольшелька \(bigWallet)"
        
    }
}

class manOrdinary:clothesPrice {
    var clothes: Double
    var smallWallet: Double
    
    func calculateMoney() -> Double {
        return smallWallet + clothes
    }
    
    init(smallWallet: Double, clothes: Double) {
        self.smallWallet = smallWallet
        self.clothes = clothes
    }
}

extension manOrdinary: CustomStringConvertible {
    var description: String {
        return "Размер кольшелька \(smallWallet)"
        
    }
}

/////

struct Queues<T: clothesPrice> {
    private var elements: [T] = []
    
    mutating func push(_ element: T) {
        elements.append(element)
    }
    
    mutating func pop() -> T? {
        return elements.removeLast()
    }
    
    var totalClothesPrice : Double {
        var clothes = 0.0
        for element in elements {
            clothes += element.clothes
        }
        return clothes
    }
    
    subscript(elements: Int ...) -> Double {
        var clothes = 0.0
    
        for index in elements where index < self.elements.count {
            clothes += self.elements[index].clothes
        }
        return clothes
    }
}


var stackQueueVIP = Queues<manVIP>()
var stackQueueOrdinary = Queues<manOrdinary>()

stackQueueVIP.push(manVIP(bigWallet: 2_000.0, clothes: 60_000.0))
stackQueueVIP.push(manVIP(bigWallet: 7_500.0, clothes: 43_000.0))
stackQueueOrdinary.push(manOrdinary(smallWallet: 500.0, clothes: 15_000.0))
stackQueueOrdinary.push(manOrdinary(smallWallet: 341.5, clothes: 11_200.0))

print(stackQueueOrdinary)
print(stackQueueVIP) 

stackQueueOrdinary[0,1]
print(stackQueueOrdinary[0,1])






//Делим людей на бедных и богатых
let wealthy: (Int) -> Bool = { (element: Int) -> Bool in
    return element >= 1_000_000
}

let poor: (Int) -> Bool = { (element: Int) -> Bool in
    return element < 1_000_000
}

var arrayOfWallets = [100, 2_000_000, 3_000, 8_000_100, 999_999]

arrayOfWallets.filter{ $0 >= 1_000_000 }
arrayOfWallets.filter{ $0 < 1_000_000 }

print(arrayOfWallets.filter{ $0 >= 1_000_000 })
print(arrayOfWallets.filter{ $0 < 1_000_000 })


// Сортируем людей по обеспеченности
arrayOfWallets.sort { $0 < $1 }
print(arrayOfWallets.sort { $0 < $1 }) //Почему не считает?


// Считаем общую сумму денег
arrayOfWallets.reduce(0){ $0 + $1 } //Зачем тут ноль?
print(arrayOfWallets.reduce(0){ $0 + $1 })



