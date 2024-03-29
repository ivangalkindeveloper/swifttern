//
//  strategy.swift
//  swifttern
//
//  Created by Иван Галкин on 11.02.2024.
//

//
// Стратегия
// Паттерн поведения объектов.
//
// Назначение:
// Определяет семейство алгоритмов, инкапсулирует каждый из них и делает их взаимозаменяемыми.
// Стратегия позволяет изменять алгоритмы независимо от клиентов, которые ими пользуются.
//
// Другие названия:
// Policy (политика)
//
// Применимость:
// - наличие множества родственных классов, отличающихся только поведением;
// - наличие нескольких разновидностей алгоритма;
// - в алгоритме содержатся данные, о которых клиент не должен "знать";
// - в классе определенно много вариантов поведения, представленных разветвленными условными операторами.
//
// Результаты:
// - семейства родственных алгоритмов;
// - альтернатива порождению подклассов;
// - стратегии позволяют избавиться от условных конструкций;
// - выбор реализации;
// - клиенты должны знать о различных стратегиях;
// - затраты на передачу информации между стратегией и контекстом;
// - увеличение числа объектов.
//
// Родственные паттерны:
// Приспособленец: объекты-стратегии в большинстве случаем подходят для применения паттерна приспособленец.
//

//
// Отношения:
// - классы Strategy и Context взаимодействуют для реализации выбранного алгоритма. Контекст может передать стратегии все необходимые
// алгоритму данные в момент его вызова. Вместо этого контекст может позволить обращаться к своим операциям в нужные моменты,
// передавая ссылку на ссамого себя операциям класса Strategy;
// - контекст переадресует запросы своих клиентов объекту-стратегии. Обычно клиент создает объект ConcreteStrategy и передает его контексту,
// после чего клиент взаимодействует исключительно с контекстом. Часто в распоряжении клиента находится несколько классов ConcreteStrategy,
// которые он может выбирать.
//
// Аспекты реализации:
// - определение интерфейсов классов Stratedy и Context;
// - cтратегии как параметры шаблона;
// - объекты-стратегии можно не задавать.
//

// Контекст
// - настраивается объектом класса ConcreteStrategy;
// - хранит ссылку на объект класса Strategy;
// - может определять интерфейс, который позволяет объекту Strategy обращаться к данным контекста.
class Context {
    init(strategy: Strategy) {
        self.strategy = strategy
    }
    
    var strategy: Strategy;
    
    func contextInterface() -> Void {
        self.strategy.algorithmInterface();
    }
}

// Стратегия
// - объявляет общий для всех поддерживаемых алгоритмов интерфейс.
// Класс Context пользуется этим интерфейсом для вызова конкретного алгоритма, определенного в классе ConcreteStrategy.
protocol Strategy {
    func algorithmInterface() -> Void
}

// Конкретная стратегия
// - реализует алгоритм, использующий интерфейс, объявленный в классе Strategy.
class ConcreteStrategy: Strategy {
    func algorithmInterface() -> Void {}
}
