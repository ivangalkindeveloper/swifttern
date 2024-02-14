//
//  birdge.swift
//  swifttern
//
//  Created by Иван Галкин on 22.01.2024.
//

//
// Мост
// Паттерн, структурирующий объекты.
//
// Назначение:
// Отделить асбтракцию от ее реализации так, чтобы то и другое можно было изменять независимо.
//
// Другие названия:
// Handle/Body (описатель/тело)
//
// Применимость:
// - требуется избежать постояной привязки абстракции к реализации.
// Так, например, бывает, когда реализация должна выбираться во время выполнения программы;
// - и абстракции, и реализации должны раширяться с новыми подклассами.
// В таком случае паттерн мост позволяет комбинировать разные абстракции и реализации и изменять их независимо;
// - изменения в реализации абстракции не должны отражаться на клиентах, то есть клиентский код не должен
// перекомпилироваться;
// - требуется полностью скрыть от клиентов реализацию абстракции;
// - число классов стремительно разрастается. Это признак того, что иерархию следует разделить на две части.
// Для таких иерархий классов Рамбо использует термин "вложенные обобщения";
// - реализация должна совместно использоваться несколькими объектами (например, на базе подсчета ссылок),
// и этот факт должен быть скрыт от клиента. Простой пример - это разработанный Джейсоном Коплиеном класс String,
// в котором разные объекты могут разделять одно и то же представление строки.
//
// Результаты:
// - отделение реализации от интерфейса;
// - повышение степени расширяемости;
// - сокрытие деталей реализации от клиентов.
//
// Родственные паттерны:
// Паттерн абстрактная фабрика может создать и сконфигурировать мост.
// Для обеспечения совместной работы не свызанных между собой классов прежде всего предназначен адаптер.
// Обычно он применяется в уже готовых системах. Мост же учавствует в проекте с самого начала
// и призван поддержать возможность независимого изменения абстракций и их реализаций.
//

//
// Отношения:
// - объект Abstraction перенаправляет запросы клиентасвоему объекту Implementor.
//
// Аспекты реализации:
// - только один класс Implementor;
// - создание правильного объекта Implementor;
// - совместное использоавние реализаторов;
// - применение множественного наследования.
//

// Абстракция
// - определяет интерфейс абстракции;
// - хранит ссылку на объект типа Implementor.
protocol Abstraction {
    func operation()
}

// Уточненная абстракция
// - расширяет интерфейс, определенный абстракцией Abstraction.
class RefinedAbstraction: Abstraction {
    init(implementor: Implementor) {
        self.implementor = implementor
    }
    
    var implementor: Implementor
    
    func operation() -> Void {}
}

// Реализатор
// - определяет интерфейс для классов реализации.
// Он не обязан точно соответствовать интерфейсу класса Abstraction. На самом деле оба интерфейса
// могут быть совершенно различны. Обычно интерфейс класса Implementor предоставляет только примитивные
// операции, а класс Abstraction определяет операции более высокого уровня, основанные на этих примитивах.
protocol Implementor {
    func operationImp()
}

// Конкретный реализатор
// - реализует интерфейс класса Implementor и определяет его конкретную реализацию.
class ConcreteImplementor: Implementor {
    func operationImp() -> Void {}
}

// Клиент запроса
class Client {
    init(abstraction: Abstraction) {
        self.abstraction = abstraction
    }
    
    var abstraction: Abstraction;
    
    func request() {
        self.abstraction.operation()
    }
}
