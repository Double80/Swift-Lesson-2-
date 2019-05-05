import UIKit

// Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием

class Car {
    
    enum carColor {
        case white
        case black
        case blue
        case yellow
        case green
        case red
    }
    
    enum carModel {
        case BMW
        case Mercedes
        case Audi
        case Porsche
    }
    
    var color: carColor
    var model: carModel

    init(Color: carColor, Model: carModel) {
        self.color = Color
        self.model = Model
    }
    
    // Метод
    func setColor(char c: String) {
        self.color = (c)
    }
}

// Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства. sportCar добавлен позднее

class trunkCar: Car {
    
    enum carModel {
        case Kamaz
    }
    
    enum carTruckType {
        case opened
        case closed
    }
    
    let truck: carTruckType
    
    override init(Color: carColor, Model: carModel) {
        self.truck = Truck
    }   // Не понял, как добавить новый параметр в инициализатор. В данном случае для машины мне не важен был тип контейнера или багажника (открытый или закрытый), а в случае с грузовиком - мне важно понимать, открыт ли у него верх, где перевозится груз, или нет.
}


// Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет  sportCar. Добавить эти действия в перечисление

enum carActions {
    case startEngine(status: statusEngine)
    enum statusEngine: String {
        case ON = "ON"
        case OFF = "OFF"
    }
    
    case openWindows(status: statusWindows)
    enum statusWindows: String {
        case UP = "UP"
        case DOWN = "DOWN"
    }
    
    case unloadTruck(action: truckAction, cargoWeigth: Int)
    enum truckAction: String {
        case LOAD = "LOAD"
        case UNLOAD = "UNLOAD"
    }
}

let StatusEngine: carActions.statusEngine
let StatusWindows: carActions.statusWindows
let truckAction: carActions.truckAction



class sportCar: Car {
    
    enum carModel {
        case Lamborgini
        case Ferrari
    }
    
    enum carActions {
        case switchMode (status: statusMode)
        enum statusMode: String {
            case SPORT = "SPORT"
            case TRACTION = "TRACTION"
            case COMFORT = "COMFORT"
        }
    }
}

let StatusMode: carActions.statusMode //Как добавить statusMode в carActions для класса sportCar?

var firstCar = Car(Color: yellow, Model: BMW) //Как сослаться на кейсы из класса Car?

