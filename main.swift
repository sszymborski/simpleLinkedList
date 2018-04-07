//
//  main.swift
//  LinkedList
//
//  Created by Szymon on 13/03/2018.
//  Copyright © 2018 SS. All rights reserved.
//

import Foundation

public class Element {
    var next: Element?
    var previous: Element?
    var value: String
    
    init(value: String) {
        self.value = value
        print("Utworzono element o wartości \(self.value)")
    }
    deinit {
        print("Usunięto element.")
    }
}

public class LinkedList {
    var first: Element?
    var last: Element?
    var count: Int
    
    public var isEmpty: Bool {
        return first == nil
    }
    public func append (value: String){
        let newElement = Element(value: value)
        if let lastElement = last {
            newElement.previous = lastElement
            lastElement.next = newElement
        }
        else{
            first = newElement
        }
        last = newElement
        count += 1
    }
    public func remove (element: Element) -> String {
        let previous = element.previous
        let next = element.next
        
        if let previous = previous {
            previous.next = next
        }
        else{
            first = next
        }
        next?.previous = previous
        if (next == nil) {
            last = previous
        }
        element.previous = nil
        element.next = nil
        count -= 1
        return element.value
    }
    public func elementAtPosition(number: Int) -> Element? {
        if(number >= 0){
            var element = first
            var i = 0
            while(element != nil){
                if(i == number){
                    return element
                }
                i += 1
                element = element!.next
            }
        }
        return nil
    }
    public func removeAll() {
        self.first!.next!.previous = nil
        self.last!.previous!.next = nil
        self.first = nil
        self.last = nil
    }
    init(){
        count = 0
        print("Utworzono liste")
    }
    deinit {
        print("Deleted list")
    }
}

print("Hello, World!")
var list: LinkedList? = LinkedList()
list!.append(value: "Jeden")
list!.append(value: "Dwa")
list!.append(value: "Trzy")
list!.append(value: "Pięć")
list!.append(value: "Sześć")
var iter = list!.first
var i = 0
while(i < list!.count){
    print(iter!.value)
    iter = iter?.next
    i += 1
}

print(list!.elementAtPosition(number: 2)!.value)
var j = 0
while j < list!.count {
    print(list!.elementAtPosition(number: j)!.value)
    j += 1
}
list!.remove(element: list!.elementAtPosition(number: 1)!)
j = 0
while j < list!.count {
    print(list!.elementAtPosition(number: j)!.value)
    j += 1
}

list = nil

print(list?.count)
