require "http/server"

class Node
  property value : String
  property next : Node?

  def initialize(@value : String)
    @next = nil
  end
end

class Queue
  property head : Node?
  property tail : Node?

  def initialize
    @head = nil
    @tail = nil
  end

  def enqueue(value : String)
    new_node = Node.new(value)

    if @tail.nil?
      @head = new_node
      @tail = new_node
    else
      @tail.not_nil!.next = new_node
      @tail = new_node
    end
  end

  def dequeue
    return nil if @head.nil?

    removed = @head.not_nil!
    @head = removed.next

    @tail = nil if @head.nil?

    removed.value
  end

  def search(name : String)
    current = @head
    position = 1

    while current
      return position if current.value == name
      current = current.next
      position += 1
    end

    nil
  end

  def to_html
    return "<p>Fila vazia</p>" if @head.nil?

    current = @head
    html = "<p>"

    while current
      html += "#{current.value}"
      html += " → " if !current.next.nil?
      current = current.next
    end
    html += "</p>"
    html
  end
end
queue = Queue.new
server = HTTP::Server.new do |context|
  request = context.request
  path = request.path
  case path
  when "/"
    context.response.content_type = "text/html; charset=utf-8"
    context.response.print <<-HTML
      <html>
      <head>
        <meta charset="UTF-8">
      </head>
      <body>
        <h1>Fila de Atendimento</h1>

        <form action="/add" method="get">
          <input type="text" name="name" placeholder="Digite um nome" required>
          <button type="submit">Inserir</button>
        </form>

        <br>

        <form action="/search" method="get">
          <input type="text" name="name" placeholder="Buscar pessoa" required>
          <button type="submit">Buscar</button>
        </form>

        <br>

        <a href="/dequeue"><button>Atender Próximo</button></a>
        <br><br>
        <a href="/show"><button>Ver Fila</button></a>
      </body>
      </html>
    HTML
  when "/add"
    name = request.query_params["name"]?
    queue.enqueue(name) if name
    context.response.content_type = "text/html; charset=utf-8"
    context.response.print <<-HTML
      <html>
      <head><meta charset="UTF-8"></head>
      <body>
        <p>#{name} entrou na fila.</p>
        <a href="/">Voltar</a>
      </body>
      </html>
    HTML

  when "/dequeue"
    result = queue.dequeue
    context.response.content_type = "text/html; charset=utf-8"
    if result
      context.response.print <<-HTML
        <html>
        <head><meta charset="UTF-8"></head>
        <body>
          <p>Atendido: #{result}</p>
          <a href="/">Voltar</a>
        </body>
        </html>
      HTML
    else
      context.response.print <<-HTML
        <html>
        <head><meta charset="UTF-8"></head>
        <body>
          <p>Fila vazia</p>
          <a href="/">Voltar</a>
        </body>
        </html>
      HTML
    end
  when "/show"
    context.response.content_type = "text/html; charset=utf-8"
    context.response.print <<-HTML
      <html>
      <head>
        <meta charset="UTF-8">
      </head>
      <body>
        <h2>Fila atual:</h2>
        #{queue.to_html}
        <br><a href="/">Voltar</a>
      </body>
      </html>
    HTML

  when "/search"
    name = request.query_params["name"]?
    position = name ? queue.search(name) : nil
    context.response.content_type = "text/html; charset=utf-8"
    if position
      context.response.print <<-HTML
        <html>
        <head><meta charset="UTF-8"></head>
        <body>
          <p>#{name} está na posição #{position} da fila.</p>
          <a href="/">Voltar</a>
        </body>
        </html>
      HTML
    else
      context.response.print <<-HTML
        <html>
        <head><meta charset="UTF-8"></head>
        <body>
          <p>#{name} não está na fila.</p>
          <a href="/">Voltar</a>
        </body>
        </html>
      HTML
    end

  else
    context.response.status_code = 404
    context.response.print "Página não encontrada"
  end
end

server.bind_tcp 8080
puts "Rodando em http://localhost:8080"
server.listen