//
//  composite.swift
//  swifttern
//
//  Created by Иван Галкин on 22.01.2024.
//

//
// Компоновщик
// Паттерн, структурирующий объекты.
//
// Назначение:
// Компонует объекты в древовидные структуры для представления иерархий "часть - целое".
// Позволяет клиентам единообразно трактовать индивидуальные и составные объекты.
//
// Применимость:
// - требуется представить иерархию объектов вида "часть - целое";
// - клиенты должны по единым правилам работать с составными и индивидуальными объектами.
//
// Результаты:
// - определяет иерархии классов, состоящие из примитивных и составных объектов;
// - упрощает архитектуру клиента;
// - облегчает добавление новых видов компонентов;
// - способствует созданию общего дизайна.
//
// Родственные паттерны:
// Отношение "компонент - родитель" испольщуется в паттерне цепочка обязанностей.
// Паттерн декоратор часто применяется совместно с компоновщиком. Когда декораторы и компоновщики
// используются вместе, у них обычно бывает общий родительский класс. Поэтому декораторам придется
// поддержать интерфейс компонентов такими операциями, как Add, Remove и GetChild.
// Паттерн приспособленец позволяет совместно использовать компоненты, но ссылаться на своих родителей
// они уже не могут.
// Итератор можно использовать для обхода составных объектов.
// Посетитель локализует операции и поведение, которые в противном случае пришлось бы распределять
// между классами Composite и Leaf.
//

//
// Отношения:
// - клиенты используют интерфейс класса Component для взаимодействия с объектами в составной структуре.
// Если получаетелем запроса является листовый объект Leaf, то он и обрабатывает запрос.
// Когда же получаетелм является составной объект Composite, то обычно он перенаправляет запрос
// своим потомкам - возможно, с выполнением некоторых дополнительных операций до или после перенаправления.
//
// Аспекты реализации:
// - явные ссылки на родителей;
// - совместное использование компонентов;
// - максимизация интерфейса класса Component;
// - объявление операций для управления потомками;
// - должен ли Component реализовывать список компонентов;
// - упорядочение потомков;
// - кеширование для повышения производительности;
// - кто должен удалять компонентов;
// - выбор структуры данных для хранения компонентов.
//

// Компонент
// - объявляет интерфейс для компонуемых объектов;
// - реализует поведение по умолчанию для интерфейсов, общих для всех классов;
// - объявляет интерфейс для обращения к потомкам и управления ими;
// - (не обязательно) определяет интерфейс для обращения к родителю компонента
// в рекурсивной структуре и при необходимости реализует его.
protocol Component {
    func operation()
    
    func add(compoenent: Component)
    
    func remove(compoenent: Component)
    
    func getChild(value: Int)
}

// Лист
// - представляет листовые узлы композиции и не имеет потомков;
// - определяет поведение примитивных объектов в композиции.
class Leaf: Component {
    func operation() -> Void {}
    
    func add(compoenent: Component) -> Void {}
    
    func remove(compoenent: Component) -> Void {}
    
    func getChild(value: Int) -> Void {}
}

// Составной объект
// - определяет поведение компонентов, у которых есть потомки;
// - хранит компоненты-потомки;
// - реализует относящиеся к управлению потомками операции в интерфейсе класса Component.
class Composite: Component {
    private var components: [Component] = []
    
    func operation() {
        for component in components {
            component.operation()
        }
    }
    
    func add(compoenent: Component) -> Void {}
    
    func remove(compoenent: Component) -> Void {}
    
    func getChild(value: Int) -> Void {}
}

// Клиент запроса
// - манипулирует объектами композиции через интерфейс Component
class Client {
    func request() {
        var component: Component = Component()
        component.operation()
    }
}