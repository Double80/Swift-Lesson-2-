import UIKit


// Описать несколько структур – любой легковой автомобиль и любой грузовик. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.

struct car {
    var name: String
    var year: Int
    var trunkVolume: Int
    var engine: Bool
    var windows: Bool
    var trunkFilledVolume: Int
    
    mutating func changeYear(year: Int) {
        self.year += year
    }
}
    
 // Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
    
    enum carActions {
        case startEngine(status: StatusEngine)
        enum StatusEngine: String {
            case ON = "ON"
            case OFF = "OFF"
        }
        
        case openWindows(status: StatusWindows)
        enum StatusWindows: String {
            case UP = "UP"
            case DOWN = "DOWN"
        }
        
        case unloadTruck(action: truckAction, cargoWeigth: Int)
        enum truckAction: String {
            case LOAD = "LOAD"
            case UNLOAD = "UNLOAD"
        }
    }


var BMW = car(name: "BMW M3", year: 2013, trunkVolume: 40, engine: true, windows: true, trunkFilledVolume: 15)
var Mercedes = car(name: "Mercedes CLS", year: 2015, trunkVolume: 35, engine: false, windows: true, trunkFilledVolume: 5)


print(BMW)
BMW.changeYear(year: 4)
print(BMW)

if BMW.year > Mercedes.year {
    print("BMW is newer")
} else {
    print("Mercedes is newer")
}


// Не понял, как заставить перечисление выводить в print не просто текст, а более гибкую информацию. Например, в данном случае я указываю, что хочу загрузить багажник на 3. Соответственно мне нужно чтобы один из кейсов выводил именно эти данные на печать. Также с окнами и двигателем, если я указал бы в переменной action, что окна открыты, я хотел бы, чтобы кейс подтянул мне слово DOWN из enum carActions.

var action = carActions.unloadTruck(action: .LOAD, cargoWeigth: 3)

switch action {
case .startEngine:
    print("The engine is \(carActions.startEngine)")
case .openWindows:
    print("The windows are \(carActions.openWindows)")
default:
    print("\(carActions.unloadTruck)")
}
