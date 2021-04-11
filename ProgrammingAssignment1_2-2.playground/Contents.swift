import Foundation

// Частина 1

// Дано рядок у форматі "Student1 - Group1; Student2 - Group2; ..."

let studentsStr = "Дмитренко Олександр - ІП-84; Матвійчук Андрій - ІВ-83; Лесик Сергій - ІО-82; Ткаченко Ярослав - ІВ-83; Аверкова Анастасія - ІО-83; Соловйов Даніїл - ІО-83; Рахуба Вероніка - ІО-81; Кочерук Давид - ІВ-83; Лихацька Юлія - ІВ-82; Головенець Руслан - ІВ-83; Ющенко Андрій - ІО-82; Мінченко Володимир - ІП-83; Мартинюк Назар - ІО-82; Базова Лідія - ІВ-81; Снігурець Олег - ІВ-81; Роман Олександр - ІО-82; Дудка Максим - ІО-81; Кулініч Віталій - ІВ-81; Жуков Михайло - ІП-83; Грабко Михайло - ІВ-81; Іванов Володимир - ІО-81; Востриков Нікіта - ІО-82; Бондаренко Максим - ІВ-83; Скрипченко Володимир - ІВ-82; Кобук Назар - ІО-81; Дровнін Павло - ІВ-83; Тарасенко Юлія - ІО-82; Дрозд Світлана - ІВ-81; Фещенко Кирил - ІО-82; Крамар Віктор - ІО-83; Іванов Дмитро - ІВ-82"

// Завдання 1
// Заповніть словник, де:
// - ключ – назва групи
// - значення – відсортований масив студентів, які відносяться до відповідної групи

var studentsGroups: [String: [String]] = [:]

// Ваш код починається тут

var arrayOfStudents = studentsStr.components(separatedBy: "; ")
for student in arrayOfStudents {
    let nameAndGroup = student.components(separatedBy: " - ")
    let nameOfStudent = nameAndGroup[0]
    let nameOfGroup = nameAndGroup[1]
    studentsGroups[nameOfGroup] == nil ? studentsGroups[nameOfGroup] = [nameOfStudent] :
        studentsGroups[nameOfGroup]!.append(nameOfStudent)
}

for nameOfGroup in studentsGroups.keys {
    studentsGroups[nameOfGroup]!.sort()
}

// Ваш код закінчується тут

print("Завдання 1")
print(studentsGroups)
print()

// Дано масив з максимально можливими оцінками

let points: [Int] = [12, 12, 12, 12, 12, 12, 12, 16]

// Завдання 2
// Заповніть словник, де:
// - ключ – назва групи
// - значення – словник, де:
//   - ключ – студент, який відносяться до відповідної групи
//   - значення – масив з оцінками студента (заповніть масив випадковими значеннями, використовуючи функцію `randomValue(maxValue: Int) -> Int`)

func randomValue(maxValue: Int) -> Int {
    switch(arc4random_uniform(6)) {
    case 1:
        return Int(ceil(Float(maxValue) * 0.7))
    case 2:
        return Int(ceil(Float(maxValue) * 0.9))
    case 3, 4, 5:
        return maxValue
    default:
        return 0
    }
}

var studentPoints: [String: [String: [Int]]] = [:]

// Ваш код починається тут

for(nameOfGroup, sortedArrayOfStudents) in studentsGroups {
    var dictionaryOfMarks: [String : [Int]] = [:]
    sortedArrayOfStudents.forEach { name in
        let marks = points.map {randomValue(maxValue: $0)}
        dictionaryOfMarks[name] = marks
    }
    studentPoints[nameOfGroup] = dictionaryOfMarks
}

// Ваш код закінчується тут

print("Завдання 2")
print(studentPoints)
print()

// Завдання 3
// Заповніть словник, де:
// - ключ – назва групи
// - значення – словник, де:
//   - ключ – студент, який відносяться до відповідної групи
//   - значення – сума оцінок студента

var sumPoints: [String: [String: Int]] = [:]

// Ваш код починається тут
var sumOfMarks:Int;
for (nameOfGroup, sortedArrayOfStudents) in studentPoints {
    sumPoints[nameOfGroup] = [:];
    for student in sortedArrayOfStudents{
        sumOfMarks = 0;
        student.value.forEach{ rating in
            sumOfMarks += rating;
        }
        sumPoints[nameOfGroup]![student.key] = sumOfMarks;
    }
}

// Ваш код закінчується тут

print("Завдання 3")
print(sumPoints)
print()

// Завдання 4
// Заповніть словник, де:
// - ключ – назва групи
// - значення – середня оцінка всіх студентів групи

var groupAvg: [String: Float] = [:]

// Ваш код починається тут

var sumOfMarksInGroup: Int;
var quantityOfStudents: Int;
for (nameOfGroup, sortedArrayOfStudents) in sumPoints {
    sumOfMarksInGroup = 0;
    quantityOfStudents = 0;
    for student in sortedArrayOfStudents{
        sumOfMarksInGroup += student.value;
        quantityOfStudents += 1;
    }
    groupAvg[nameOfGroup] = Float(sumOfMarksInGroup)/Float(quantityOfStudents);
}

// Ваш код закінчується тут

print("Завдання 4")
print(groupAvg)
print()

// Завдання 5
// Заповніть словник, де:
// - ключ – назва групи
// - значення – масив студентів, які мають >= 60 балів

var passedPerGroup: [String: [String]] = [:]

// Ваш код починається тут

for (nameOfGroup, sortedArrayOfStudents) in sumPoints {
    passedPerGroup[nameOfGroup] = [];
    for student in sortedArrayOfStudents{
        if student.value > 60 {
            passedPerGroup[nameOfGroup]!.append(student.key);
        }
    }
}

// Ваш код закінчується тут

print("Завдання 5")
print(passedPerGroup)

// Приклад виведення. Ваш результат буде відрізнятися від прикладу через використання функції random для заповнення масиву оцінок та через інші вхідні дані.
//
//Завдання 1
//["ІВ-73": ["Гончар Юрій", "Давиденко Костянтин", "Капінус Артем", "Науменко Павло", "Чередніченко Владислав"], "ІВ-72": ["Бортнік Василь", "Киба Олег", "Овчарова Юстіна", "Тимко Андрій"], "ІВ-71": ["Андрющенко Данило", "Гуменюк Олександр", "Корнійчук Ольга", "Музика Олександр", "Трудов Антон", "Феофанов Іван"]]
//
//Завдання 2
//["ІВ-73": ["Давиденко Костянтин": [5, 8, 9, 12, 11, 12, 0, 0, 14], "Капінус Артем": [5, 8, 12, 12, 0, 12, 12, 12, 11], "Науменко Павло": [4, 8, 0, 12, 12, 11, 12, 12, 15], "Чередніченко Владислав": [5, 8, 12, 12, 11, 12, 12, 12, 15], "Гончар Юрій": [5, 6, 0, 12, 0, 11, 12, 11, 14]], "ІВ-71": ["Корнійчук Ольга": [0, 0, 12, 9, 11, 11, 9, 12, 15], "Музика Олександр": [5, 8, 12, 0, 11, 12, 0, 9, 15], "Гуменюк Олександр": [5, 8, 12, 9, 12, 12, 11, 12, 15], "Трудов Антон": [5, 0, 0, 11, 11, 0, 12, 12, 15], "Андрющенко Данило": [5, 6, 0, 12, 12, 12, 0, 9, 15], "Феофанов Іван": [5, 8, 12, 9, 12, 9, 11, 12, 14]], "ІВ-72": ["Киба Олег": [5, 8, 12, 12, 11, 12, 0, 0, 11], "Овчарова Юстіна": [5, 8, 12, 0, 11, 12, 12, 12, 15], "Бортнік Василь": [4, 8, 12, 12, 0, 12, 9, 12, 15], "Тимко Андрій": [0, 8, 11, 0, 12, 12, 9, 12, 15]]]
//
//Завдання 3
//["ІВ-72": ["Бортнік Василь": 84, "Тимко Андрій": 79, "Овчарова Юстіна": 87, "Киба Олег": 71], "ІВ-73": ["Капінус Артем": 84, "Науменко Павло": 86, "Чередніченко Владислав": 99, "Гончар Юрій": 71, "Давиденко Костянтин": 71], "ІВ-71": ["Корнійчук Ольга": 79, "Трудов Антон": 66, "Андрющенко Данило": 71, "Гуменюк Олександр": 96, "Феофанов Іван": 92, "Музика Олександр": 72]]
//
//Завдання 4
//["ІВ-71": 79.333336, "ІВ-72": 80.25, "ІВ-73": 82.2]
//
//Завдання 5
//["ІВ-72": ["Бортнік Василь", "Киба Олег", "Овчарова Юстіна", "Тимко Андрій"], "ІВ-73": ["Давиденко Костянтин", "Капінус Артем", "Чередніченко Владислав", "Гончар Юрій", "Науменко Павло"], "ІВ-71": ["Музика Олександр", "Трудов Антон", "Гуменюк Олександр", "Феофанов Іван", "Андрющенко Данило", "Корнійчук Ольга"]]

print()
print()

enum Direction : String {
    case Lat = "Lat";
    case Long = "Long";
}

class CoordinateBS {
    var direction: Direction;
    var degrees: Int;
    var minutes: UInt;
    var seconds: UInt;

    
    init() {
        self.degrees = 180;
        self.minutes = 59;
        self.seconds = 59;
        self.direction = Direction.Long;
    }
    
    init?(degrees: Int, minutes: UInt, seconds: UInt, direction: Direction) {
        if !(( -90 <= degrees && degrees <= 90 && direction == Direction.Lat || -180 <= degrees && degrees <= 180 && direction == Direction.Long) &&
            0 <= minutes && minutes <= 59 &&
            0 <= seconds && seconds <= 59
        ) {
            return nil
        }
        self.degrees = degrees;
        self.minutes = minutes;
        self.seconds = seconds;
        self.direction = direction;
        
    }

    func get_coord_first_format() -> String {
        
        var z = "";
        
        if direction == Direction.Lat {
            if 0 <= degrees && degrees <= 90 {
                z = "N";
            } else if -90 <= degrees && degrees < 0 {
                z = "S";
            }
        } else {
            if 0 <= degrees && degrees <= 180 {
                z = "E";
            } else if -180 <= degrees && degrees < 0 {
                z = "W";
            }
        }
        return "\(abs(self.degrees))°\(self.minutes)'\(self.seconds)\" \(z)"
    }
    
    func get_coord_second_format() -> String {
        
        var z = "";
        
        if direction == Direction.Lat {
            if 0 <= degrees && degrees <= 90 {
                z = "N";
            } else if -90 <= degrees && degrees < 0 {
                z = "S";
            }
        } else {
            if 0 <= degrees && degrees <= 180 {
                z = "E";
            } else if -180 <= degrees && degrees < 0 {
                z = "W";
            }
        }
        
        let decimal_degrees: Float = Float(abs(self.degrees)) + Float(self.minutes)/60 + Float(self.seconds)/3600;
        return "\(decimal_degrees)° \(z)";
    }
    
    func average_coord_with(coord: CoordinateBS) -> CoordinateBS? {
        if self.direction != coord.direction {
            return nil;
        }
        let degrees_3 = (self.degrees + coord.degrees) / 2;
        let minutes_3 = (self.minutes + coord.minutes) / 2;
        let seconds_3 = (self.seconds + coord.seconds) / 2;
        return CoordinateBS(degrees: degrees_3, minutes: minutes_3, seconds: seconds_3, direction: self.direction)
    }
    
    func average_coord_between(coord_1:CoordinateBS, coord_2: CoordinateBS) -> CoordinateBS? {
        if coord_1.direction != coord_2.direction {
            return nil;
        }
        let degrees_3 = (coord_1.degrees + coord_2.degrees) / 2;
        let minutes_3 = (coord_1.minutes + coord_2.minutes) / 2;
        let seconds_3 = (coord_1.seconds + coord_2.seconds) / 2;
        return CoordinateBS(degrees: degrees_3, minutes: minutes_3, seconds: seconds_3, direction: coord_1.direction)
    }
    
}

let coord = CoordinateBS(degrees: 54,minutes: 32,seconds: 43, direction: Direction.Lat);
print(coord?.get_coord_first_format() ?? "#-#");
print(coord?.get_coord_second_format() ?? "#-#");

let coord_2 = CoordinateBS(degrees: -299, minutes: 157, seconds: 265, direction: Direction.Long);
print(coord_2?.get_coord_first_format() ?? "#-#");
print(coord_2?.get_coord_second_format() ?? "#-#");

let coord_3 = CoordinateBS();
print(coord_3.get_coord_first_format());
print(coord_3.get_coord_second_format());

let coord_4 = coord?.average_coord_with(coord: coord ?? coord_3);
print(coord_4?.get_coord_first_format() ?? "#-#");
print(coord_4?.get_coord_second_format() ?? "#-#");

let coord_5 = coord_4?.average_coord_between(coord_1: coord ?? coord_3, coord_2: coord_4 ?? coord_3)
print(coord_5?.get_coord_first_format() ?? "#-#");
print(coord_5?.get_coord_second_format() ?? "#-#");
