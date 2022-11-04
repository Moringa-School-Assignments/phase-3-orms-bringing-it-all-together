class Dog
    attr_accessor :name, :breed, :id

    def initialize(name:, breed:, id:)
        @name = name 
        @breed = breed 
        @id = id
    end

    def self.create_table
        drop = <<-SQL
        DROP TABLE IF EXISTS dogs;
        SQL

        DB[:conn].execute(drop)
        sql = <<-SQL
        CREATE TABLE IF NOT EXISTS dogs(
            id INTEGER PRIMARY KEY,
            name TEXT,
            breed TEXT
        )
        SQL

        DB[:conn].execute(sql)
    end

    def self.drop_table
        sql = <<-SQL
        DROP TABLE IF EXISTS dogs;
        SQL

        DB[:conn].execute(sql)
    end

    def save
        sql = <<-SQL
            INSERT INTO dogs (name, breed)
            VALUES (?, ?)
        SQL
        DB[:conn].execute(sql, self.name, self.breed)
    end

    def self.create
        save 
    end

    def self.new_from_db
        self.new(name:, breed:, id:)
    end

    def self.all 
        sql = <<-SQL
            SELECT * FROM dogs;
        SQL
        DB[:conn].execute(sql)
    end

    def self.find_by_name find_name
        sql = <<-SQL
            select * FROM dogs WHERE name="#{find_name}"
        SQL

        DB[:conn].execute(sql)
    end

    def self.find id
        sql = <<-SQL
            SELECT * FROM dogs WHERE id="#{id}"
        SQL
        DB[:conn].execute(sql)
    end

end

