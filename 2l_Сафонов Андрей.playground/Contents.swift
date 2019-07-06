import UIKit

var str = "Hello, playground"

// Написать функцию, которая определяет, четное число или нет

func evenOddDetermination (_ a: Int) -> () {
    if a % 2 == 0 {
        print("The number is even")
    } else {
        print("The number is odd")
    }
}

evenOddDetermination(39874592)

// Написать функцию, которая определяет, делится ли число без остатка на 3

func devisionByThree (_ a: Int) -> () {
    if a % 3 == 0 {
        print("The number can be devided by 3 without a remainder")
    } else {
        print("The number cannot be devided by 3 without a remainder")
    }
}

devisionByThree(8)

// Создать возрастающий массив из 100 чисел

var increasingArray: [Int] = []

for i in 0...100 {
    increasingArray.append(i)
}

increasingArray

// Удалить из этого массива все четные числа и все числа, которые не делятся на 3

for (index, value) in increasingArray.enumerated() {
    if (value % 2) == 0 || (value % 3) == 0 {
        increasingArray.remove(at: increasingArray.index(of: value)!)
    }
}

print(increasingArray)

// Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов
// Не знаю как обратиться к индексу, чтобы функция считала до 100
var i: Int = 0
var fibonachiArray: [Int] = []

func fibonachiFunc(firstValue: Int, secondValue: Int) -> () {
    fibonachiArray.append(firstValue)
    fibonachiArray.append(secondValue)
    i = firstValue + secondValue
    fibonachiArray.append(i)

    
    for (index, value) in fibonachiArray.enumerated() {
            i = fibonachiArray.index(after: i-1) + fibonachiArray.index(after: i-2)
            fibonachiArray.append(i)
        }
    print(fibonachiArray)
}

fibonachiFunc(firstValue: 1, secondValue: 3)

