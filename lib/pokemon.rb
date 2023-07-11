class Pokemon 

    attr_accessor :name, :type, :id

    def initialize(name:, type:, id:nil)
        @id = id
        @name = name
        @type = type
    end

    def save
        sql = <<- SQL
        INSERT INTO pokemons (name, type)
        VALUES (?,?)
        SQL

        DB[conn:].execute(sql, self.name, self.type)
        self.id = DB[:conn].execute("SELECT last_insert_rowid() FROM pokemons")[0][0]
        self
    end
end
