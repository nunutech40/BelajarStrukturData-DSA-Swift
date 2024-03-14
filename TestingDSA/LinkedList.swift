//
//  LinkedList.swift
//  TestingDSA
//
//  Created by Nunu Nugraha on 14/03/24.
//

import Foundation

class Node<T> {
    var value: T
    var next: Node<T>?
    
    init(value: T, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

class LinkedList<T> {
    var head: Node<T>?
    
    // insert at the begining
    func append(value: T) {
        let newNode = Node(value: value, next: head) // tambahkan value di bagian paling depan, di depan head sebelumnya, jadi head sebelumnya adalah next value
        head = newNode // update variable head dengan node yang baru
    }
    
    // insert at the end of node
    func insertAtTheAnd(value: T) {
        // jika datanya masih kosong, langsung tambahkan head dengan node baru
        let newNode = Node(value: value)
        guard head != nil else {
            head = newNode
            return
        }
        
        // Langkah-langkah
        // 1. telusuri linked list mulai dari node 1, atau head (head tidak akan memiliki pointer null
        // 2. jika node 1 / head tidak null, maka telusuri sampe mendapatkan node yang pointernya null
        // 3. saat node dengan pointer null di dapatkan, update pointernya menjadi newNode
        var current = head
        while (current?.next != nil) {
            current = current?.next
        }
        if current?.next == nil {
            current?.next = newNode
        }
    }
    
    // traversal operation
    func telusuriData(isPrint: Bool) {
        var index = 1
        var current = head
        while (current != nil) {
            if (isPrint) {
                print("node \(index) datanya: \(String(describing: current?.value))")
            }
            current = current?.next
            index += 1
        }
    }
    
    func deleteValue(value: T) where T: Equatable { // perlu menambahkan T sebagai Equatable kalau di swift, supaya bisa dibandingkan.
        
        // cara hapus pada linkedlist adalah tinggal buang aja pointernya
        
        guard head != nil else { return }
        if head?.value == value {
            head = head?.next // penghapusan pada head, tinggal jadikan next sebagai head
        }
        
        var prev: Node<T>? = nil
        var current = head
        while current != nil && current?.value != value {
            prev = current
            current = current?.next
        }
        
        // penghapusan data yang valuenya ketemu adalah node prev yg pointernya ke node current, di rubah pointernya ke data yang ada di node current.
        if current != nil {
            prev?.next = current?.next
        }
    }
    
    func findData(value: T) where T: Equatable {
        var resultMessage = "Data kosong!"
        guard head != nil else {
            print(resultMessage)
            return
        }
        
        var current = head
        while current?.value != value {
            if (current?.next == nil) {
                resultMessage = "Data tidak ditemukan"
                print(resultMessage)
            }
            current = current?.next
        }
        resultMessage = "Data \(String(describing: current?.value)) ditemukan!"
        print(resultMessage)
        
    }
}
