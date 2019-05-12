import UIKit

// 1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
// 2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
// 3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
// 4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
// 5. Создать несколько объектов каждого класса. Применить к ним различные действия.
// 6. Вывести сами объекты в консоль.

protocol ConsolePrintable: CustomStringConvertible {
    func printDescription()
}

extension ConsolePrintable{
    func printDescription() {
        print(description)
    }
}

///////

protocol Car {
    // Включен ли двигатель
    var EngineState: Bool {get set}
    
    // Открыты ли окна
    var WindowsState: Bool {get set}
    
    // Открыты ли двери
    var DoorState: Bool {get set}
    
    func changeState() -> Bool
}

///////

extension Car {
    
    mutating func engineOn() {
        EngineState = true
        print("Двигатель включен")
    }
    mutating func windowsDown() {
        WindowsState = false
        print("Окна опущены")
    }
    
    mutating func doorsOpen() {
        DoorState = false
        print("Двери открыты")
    }
}

////////

class SportCar:  Car, ConsolePrintable {
   
    var EngineState: Bool
    var WindowsState: Bool
    var DoorState: Bool
    
    var TurboState: Bool
    
    func changeState() -> Bool {
        TurboState = true
        print("Спортивный режим включен")
        return TurboState
    }
    
    init(engineState: Bool, windowsState: Bool, doorState: Bool, turboState: Bool) {
        self.TurboState = turboState
        self.DoorState = doorState
        self.WindowsState = windowsState
        self.EngineState = engineState
    }
    
    var description: String {
        return String(describing: TurboState) // Как добавить вывод не только TurboState, а всех показателей
    }
}

let sc = SportCar (engineState: true, windowsState: false, doorState: false, turboState: true)
sc.printDescription()


///////


class TruckCar:  Car, ConsolePrintable {
    
    var EngineState: Bool
    var WindowsState: Bool
    var DoorState: Bool
    
    var TruckState: Bool
    
    func changeState() -> Bool {
        TruckState = true
        print("Цистерна заполнена")
        return TruckState
    }
    
    init(engineState: Bool, windowsState: Bool, doorState: Bool, truckState: Bool) {
        self.TruckState = truckState
        self.DoorState = doorState
        self.WindowsState = windowsState
        self.EngineState = engineState
    }
    
    var description: String {
        return String(describing: TruckState) // Как добавить вывод не только TruckState, а всех показателей
    }
}

let tc = TruckCar (engineState: true, windowsState: true, doorState: false, truckState: false)
tc.printDescription()



var sport = SportCar(engineState: true, windowsState: false, doorState: true, turboState: false)
print(sport) // Почему выводится только слово false, а не все описание? Это связано с тем, что в строке 78 я указал в describing только turboState?








