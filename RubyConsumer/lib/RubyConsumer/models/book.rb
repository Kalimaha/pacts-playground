class Book
  attr_reader :id,
              :title

  def initialize(id, title)
    @id     = id
    @title  = title
  end
end
