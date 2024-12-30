//
//  state.swift
//  swifttern
//
//  Created by Иван Галкин on 11.02.2024.
//

//
// Состояние
// Паттерн поведения объектов.
//
// Назначение:
// Позволяет объекту изменять свое поведение в зависимости от внутреннего состояния.
// Извне создается впечатление, что изменился класс объекта.
//
// Применимость:
// - поведение объекта зависит от его состояния и должно изменяться во время выполнения.
// - когда в коде операций встречаются состоящие из многих ветвей условные операторы, в которых выбор ветви зависит от
// состояния. Обычно в таком случае состояние представлено перечисляемыми константами.
// Часто одна и та же структура условного оператора повторяется в нескольких операциях. Паттерн состояние предлагает поместить каждую
// ветвь в отдельный класс. Это позволяет трактовать состояние объекта как самостоятельный объект, который может изменяться независимо
// от других.
//
// Результаты:
// - локализация поведения, зависящего от состояния, и деление его на части, соответствующие состояниям;
// - явно выраженные переходы между состояниями;
// - возможность совместного исользования объектов состояния.
//
// Родственные паттерны:
// Паттерн приспособленец объясняет, как и когда можно совместно использовать объекты состояния.
// Объекты состояния часто бывают одиночками.
//

//
// Отношения:
// - класс Context делегирует зависящие от состояния запросы текущему объекту ConcreteState;
// - контекст может передать себя в качестве аргумента объекту State, который будет обрабатывать запрос. Это дает возможность
// объекту-состоянию при необходимости получить доступ к контексту;
// - Context - это основной интерфейс для клиентов. Клиенты могут конфигурировать контекст объектами состояния State. Один раз
// сконфигурировав контекст, клиенты уже не должны напрямую связываться с объектами состояния;
// - либо Context, либо подклассы ConcreteState могут решить, при каких условиях и в каком порядке происходит смена состояний.
//
// Аспекты реализации:
// - что определяет переходы между состояниями;
// - табличная альтернатива;
// - создание и уничтожение объектов состояния;
// - использование динамического наследования.
//

// Контекст
// - определяет интерфейс, преставляющий интерес для клиентов;
// - хранит экземпляр подкласса ConcreteState, которым определяется текущее состояние.
class Context {
    init(state: State) {
        self.state = state
    }
    
    var state: State
    
    func request() -> Void {
        self.state.handle()
    }
}

// Состояние
// - определяет интерфейс для инекапсуляции поведения, ассоциированного с конкретным состоянием контекста Context;
protocol State {
    func handle() -> Void
}

// Подкласс состояния
// - каждый подкласс реализует поведение, ассоциированное с некоторым состоянием контекста Context.
class ConcreteState: State {
    func handle() -> Void {}
}