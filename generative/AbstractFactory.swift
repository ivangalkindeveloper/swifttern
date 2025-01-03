//
//  abstract_factory.swift
//  Swifttern
//
//  Created by Иван Галкин on 13.01.2024.
//

//
// Абстрактная фабрика
// Паттерн, порождающий объекты.
//
// Назначение:
// Представляет собой интерфейс для созздания семейств взиамосвязанных или взаимозависимых объектов,
// не специфицируя их конкретных классов.
//
// Другие названия:
// Kit (инструментарий)
//
// Применимость:
// - система не должна зависеть от того, как создаются, компонуются и представляются входящие в нее объекты;
// - система должна настраиватся одним из семейств объектов;
// - входящие в семейство взаимосвязанные объекты спроектированы для совместной работы, и вы должны
// обеспечить выполнение этого ограничения;
// - вы хотите предоставить библиотеку объектов, раскрывая только их интерфейсы, но не реализацию.
//
// Результаты:
// - изолирует конкретные классы;
// - упрощает замену семейств продуктов;
// - гарантирует сочетаемость продуктов;
// - не упрощает задачу поддержки нового вида продуктов;
//
// Родственные паттерны:
// Классы асбтрактных фабрик часто реализуются фабричными методами, но могут быть реализованы
// с помощью паттерна Прототип.
//

//
// Отношения:
// - Обычно во время выполнения создается единственный экземпляр класса ConcreteFactory. Эта фабрика создает
// объекты-продукты, имеющие вполне определенную реализацию. Для создания других видов объектов клиент
// должен воспользоваться другой конкретной фабрикой;
// - AbstractFactory передоверяет создание объектов-продуктов своему подклассу ConcreteFactory.
//
// Аспекты реализации:
// - фабрики как объекты, существующие в единственном экземпляре;
// - создание продуктов;
// - определение расширяемых фабрик.
// Но даже если приведение типов не нужно, остается принципиальная проблема: все продукты возвращаются клиенту
// одним и тем же абстрактным интерфейсом с уже определенным типов возвращаемого значения. Клиент не может
// ни различить классы продуктов, ни сделать какие-нибудь предположения о них. Если клиенту нужно выполнить
// операцию, зависящую от подкласса, то она будет недоступна через абстрактный интерфейс.
//

// Абстрактная фабрика
// - объявляет интерфейс для операций, создающих абстрактные объекты-продукты
protocol AbstractFactory {
    func createProductA() -> AbstractProduct

    func createProductB() -> AbstractProduct
}

// Конкретная фабрика
// - реализует операции, создающие конкретые объекты-продукты
class ConcreteFactory: AbstractFactory {
    func createProductA() -> AbstractProduct {}

    func createProductB() -> AbstractProduct {}
}

// Асбтрактный продукт
// - объявляет интерфейс для типа объекта-продукта
protocol AbstractProduct {}

// Кокнретный продукт
// - определяет объект-продукт, создаваемый соответствующей конкретной фабрикой
class ConcreteProduct: AbstractProduct {}

// Клиент
// - пользуется исключительно интерфейсами, которые объявлены в классах AbstractFactory и AbstractProduct.
class Client {
    init(abstractFactory: AbstractFactory) {
        self.abstractFactory = abstractFactory
    }

    var abstractFactory: AbstractFactory
}
