# 📚 Exemplos de Lista Encadeada por Linguagem

Este documento apresenta exemplos didáticos de implementação de **lista encadeada simples** em diferentes linguagens.

Cada exemplo inclui:

* Estrutura de nó
* Inserção no final
* Impressão da lista

---

# 1) Elixir - Mahgid
Em Elixir, o mais natural é usar a própria ideia funcional de lista. Portanto o próximo de “lista encadeada” é modelar cada nó manualmente com struct.
```elixir
defmodule Node do
  defstruct value: nil, next: nil
end

defmodule LinkedList do
  def new do
    nil
  end

  def append(nil, value) do
    %Node{value: value, next: nil}
  end

  def append(%Node{value: v, next: next}, value) do
    %Node{value: v, next: append(next, value)}
  end

  def print(nil) do
    IO.puts("fim")
  end

  def print(%Node{value: value, next: next}) do
    IO.write("#{value} -> ")
    print(next)
  end
end

list =
  LinkedList.new()
  |> LinkedList.append("Ana")
  |> LinkedList.append("Bruno")
  |> LinkedList.append("Carlos")

LinkedList.print(list)
```
** Observação:**
Elixir não trabalha com ponteiros explícitos. Aqui a ligação entre nós é feita por referência estrutural e recursão.
---

# 2) Rust
Em Rust, uma forma clássica de fazer isso é com `Box`, pois o tamanho precisa ser conhecido em tempo de compilação.
```rust
#[derive(Debug)]
struct Node {
    value: String,
    next: Option<Box<Node>>,
}

struct LinkedList {
    head: Option<Box<Node>>,
}

impl LinkedList {
    fn new() -> Self {
        LinkedList { head: None }
    }

    fn append(&mut self, value: String) {
        let new_node = Box::new(Node { value, next: None });

        match self.head.as_mut() {
            None => self.head = Some(new_node),
            Some(mut current) => {
                while current.next.is_some() {
                    current = current.next.as_mut().unwrap();
                }
                current.next = Some(new_node);
            }
        }
    }

    fn print(&self) {
        let mut current = self.head.as_ref();

        while let Some(node) = current {
            print!("{} -> ", node.value);
            current = node.next.as_ref();
        }

        println!("fim");
    }
}

fn main() {
    let mut list = LinkedList::new();
    list.append("Ana".to_string());
    list.append("Bruno".to_string());
    list.append("Carlos".to_string());

    list.print();
}
```
** Observação:**
Rust não usa ponteiros “livres” como C. Aqui o encadeamento é feito com `Option<Box<Node>>`.
---

# 3) Crystal
Crystal trabalha muito bem com referências entre objetos.
```crystal
class Node
  property value : String
  property next_node : Node?

  def initialize(@value : String)
    @next_node = nil
  end
end

class LinkedList
  @head : Node?

  def initialize
    @head = nil
  end

  def append(value : String)
    new_node = Node.new(value)

    if @head.nil?
      @head = new_node
    else
      current = @head
      while current.not_nil!.next_node
        current = current.not_nil!.next_node
      end
      current.not_nil!.next_node = new_node
    end
  end

  def print_list
    current = @head
    while current
      print "#{current.value} -> "
      current = current.next_node
    end
    puts "fim"
  end
end

list = LinkedList.new
list.append("Ana")
list.append("Bruno")
list.append("Carlos")
list.print_list
```
**Observação:**
Crystal usa referências automaticamente; o encadeamento fica bem próximo do que que se vê em Java.
---

# 4) Java
Java é uma das linguagens mais clássicas para ensinar lista encadeada.
```java
class Node {
    String value;
    Node next;

    Node(String value) {
        this.value = value;
        this.next = null;
    }
}

class LinkedList {
    Node head;

    LinkedList() {
        this.head = null;
    }

    void append(String value) {
        Node newNode = new Node(value);

        if (head == null) {
            head = newNode;
            return;
        }

        Node current = head;
        while (current.next != null) {
            current = current.next;
        }

        current.next = newNode;
    }

    void printList() {
        Node current = head;
        while (current != null) {
            System.out.print(current.value + " -> ");
            current = current.next;
        }
        System.out.println("fim");
    }
}

public class Main {
    public static void main(String[] args) {
        LinkedList list = new LinkedList();
        list.append("Ana");
        list.append("Bruno");
        list.append("Carlos");

        list.printList();
    }
}
```
**Observação:**
Java não expõe ponteiros, mas o conceito de encadeamento aparece claramente via referências.
---

# 5) Nim
Nim permite trabalhar com `ref object`, o que fica muito apropriado para lista encadeada.
```nim
type
  Node = ref object
    value: string
    next: Node

  LinkedList = object
    head: Node

proc append(list: var LinkedList, value: string) =
  let newNode = Node(value: value, next: nil)

  if list.head == nil:
    list.head = newNode
  else:
    var current = list.head
    while current.next != nil:
      current = current.next
    current.next = newNode

proc printList(list: LinkedList) =
  var current = list.head
  while current != nil:
    stdout.write(current.value & " -> ")
    current = current.next
  echo "fim"

var list: LinkedList
append(list, "Ana")
append(list, "Bruno")
append(list, "Carlos")

printList(list)
```
**Observação:**
Nim permite uma visualização muito boa de estruturas dinâmicas com `ref`.
---

# 6) Julia
Em Julia, dá para modelar a lista com `mutable struct`.
```julia
mutable struct Node
    value::String
    next::Union{Nothing, Node}
end

mutable struct LinkedList
    head::Union{Nothing, Node}
end

function LinkedList()
    LinkedList(nothing)
end

function append!(list::LinkedList, value::String)
    new_node = Node(value, nothing)

    if list.head === nothing
        list.head = new_node
    else
        current = list.head
        while current.next !== nothing
            current = current.next
        end
        current.next = new_node
    end
end

function print_list(list::LinkedList)
    current = list.head
    while current !== nothing
        print(current.value, " -> ")
        current = current.next
    end
    println("fim")
end

list = LinkedList()
append!(list, "Ana")
append!(list, "Bruno")
append!(list, "Carlos")

print_list(list)
```
**Observação:**
Julia não é normalmente a primeira linguagem para esse tipo de conteúdo, mas o exemplo fica bem claro usando estruturas mutáveis.
---

# 7) Lean
Lean é uma linguagem funcional e voltada para prova formal. Em vez de ponteiros, a modelagem é indutiva. Um exemplo simples seria:
```lean
inductive LinkedList where
  | nil : LinkedList
  | node : String → LinkedList → LinkedList
deriving Repr

def append : LinkedList → String → LinkedList
  | LinkedList.nil, value => LinkedList.node value LinkedList.nil
  | LinkedList.node v next, value => LinkedList.node v (append next value)

def printList : LinkedList → IO Unit
  | LinkedList.nil => IO.println "fim"
  | LinkedList.node v next => do
      IO.print s!"{v} -> "
      printList next

def main : IO Unit := do
  let list := LinkedList.nil
  let list := append list "Ana"
  let list := append list "Bruno"
  let list := append list "Carlos"

  printList list
```
**Observação:**
Em Lean, faz mais sentido falar em tipo indutivo recursivo do que em ponteiros. Mesmo assim,é representar o conceito de lista encadeada.
---

# 📌 Observação

Cada linguagem implementa o conceito de lista encadeada de acordo com seu paradigma:

* Imperativas/OOP → nós + referências
* Funcionais → estruturas recursivas

O importante é entender o conceito de encadeamento entre elementos.

