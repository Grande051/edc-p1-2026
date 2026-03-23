# 📚 Trabalho P1 – Estrutura de Dados  
## Sistema de Gerenciamento de Fila de Atendimento

---

## 👨‍🏫 Objetivo

Desenvolver um sistema simples que simule uma **fila de atendimento**, utilizando obrigatoriamente o conceito de **lista encadeada** *.

O objetivo do trabalho é avaliar a compreensão de estruturas de dados dinâmicas e sua adaptação a diferentes linguagens de programação.

---

## 🧩 Contexto do Problema

Você deverá implementar um sistema que simula uma fila de atendimento, como por exemplo:

- Atendimento em banco  
- Fila de hospital  
- Atendimento em suporte técnico  
- Restaurante ou fila de pedidos  

---

## ⚙️ Funcionalidades obrigatórias

O sistema deve permitir:

- Inserir pessoa na fila  
- Atender próxima pessoa (remoção do início)  
- Exibir fila atual  
- Buscar pessoa na fila  
- Contar quantidade de elementos  

---

## 🧠 Requisito Obrigatório

A estrutura de dados **DEVE ser implementada manualmente como lista encadeada**.

❌ Não é permitido (mas haverão exceções a depender da linguagem):
- Arrays
- Listas prontas da linguagem (List, Vec, ArrayList, etc.)

✔ Deve existir:
- Estrutura de nó (Node)
- Referência para o próximo elemento
- Controle da lista (head)

---

## 🖥️ Interface

Você pode escolher:

- Interface via terminal (CLI)  - mais fácil
- Interface web simples  - mais complexa tem pontuação extra

---

## 👨‍💻 Linguagens por aluno

Cada aluno deverá implementar o sistema na linguagem escolhida:

- Mahgid → Elixir  
- Samuel → Rust  
- Robert → Crystal  
- João → Java  
- Rafael → Nim  
- Alberto → Julia  
- Caio → Lean  

---

## 🧠 Sobre ponteiros e referências

Nem todas as linguagens utilizam ponteiros da mesma forma.

Você deve implementar a lista encadeada **respeitando o paradigma da linguagem**:

| Linguagem | Modelo |
|----------|--------|
| Rust | Ponteiros seguros (`Box`, `Option`) |
| Java | Referências de objetos |
| Crystal | Referências |
| Elixir | Estrutura recursiva imutável |
| Nim | Ponteiros ou referências (`ref`) |
| Julia | Estruturas mutáveis com referência |
| Lean | Tipo indutivo recursivo |

---

## 📦 Entrega

### 🔹 Estrutura

Será utilizado um modelo com repositórios:

- 1 repositório principal
- 1 repositório por aluno

### 🔹 Repositório principal

Deve conter:

- Este enunciado
- Lista de links para os repositórios dos alunos

Exemplo:

```md
## Repositórios dos alunos

- Mahgid (Elixir): https://github.com/usuario/edc-p1-2026-projeto-elixir  
- Samuel (Rust): https://github.com/usuario/edc-p1-2026-projeto-rust  
- Robert (Crystal): https://github.com/usuario/edc-p1-2026-projeto-crystal  
- João (Java): https://github.com/usuario/edc-p1-2026-projeto-java  
- Rafael (Nim): https://github.com/usuario/edc-p1-2026-projeto-nim  
- Alberto (Julia): https://github.com/usuario/edc-p1-2026-projeto-julia  
- Caio (Lean): https://github.com/usuario/edc-p1-2026-projeto-lean  
```
### 🔹 Gravação da execução e lista de ferramentas
- Será necessário também que o aluno grave a sua própria tela durante o processo de codificação do projeto.
- Embora o uso de IA // LLMs seja permitido para auxiliar a implementação do projeto, é expressamente proibido copiar-e-colar código pronto gerado por qualquer outra ferramenta.
- Também será necessário listar exatamente quais ferramentas foram utilizadas para implementação do projeto.

## Material de auxilio
Nesse mesmo repositório, há um arquivo [langs.md](./langs.md) com dicas de como criar listas encadeadas em cada uma das linguagens a serem utilizadas.
deverá ser utilizado os exemplos como base para implementação do enunciado.
