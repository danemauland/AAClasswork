class Reply < ModelBase
    attr_accessor :id, :question_id, :parent_id, :user_id, :body

    def self.find_by_user_id(user_id)
        replies = QuestionsDatabase.instance.execute(<<-SQL, user_id)
        SELECT
            *
        FROM
            replies
        WHERE
            user_id = ?
        SQL
        replies.map {|reply| self.new(reply)}
    end

    def self.find_by_question_id(question_id)
        replies = QuestionsDatabase.instance.execute(<<-SQL, question_id)
        SELECT
            *
        FROM
            replies
        WHERE
            question_id = ?
        SQL
        replies.map {|reply| self.new(reply)}
    end

    def self.find_by_parent_id(parent_id)
        replies = QuestionsDatabase.instance.execute(<<-SQL, parent_id)
        SELECT
            *
        FROM
            replies
        WHERE
            parent_id = ?
        SQL
        replies.map {|reply| self.new(reply)}
    end

    def initialize(options)
        @id = options['id']
        @question_id = options['question_id']
        @parent_id = options['parent_id']
        @user_id = options['user_id']
        @body = options['body']
    end

    def save
        raise "entry already exists" unless @id.nil?
        QuestionsDatabase.instance.execute(<<-SQL, @question_id, @parent_id, @user_id, @body)
        INSERT INTO users (question_id, parent_id, user_id, body)
        VALUES (?, ?, ?, ?)
        SQL
        @id = QuestionsDatabase.instance.last_insert_row_id
    end

    def update
        raise "entry does not exist" if @id.nil?
        QuestionsDatabase.instance.execute(<<-SQL, @question_id, @parent_id, @user_id, @body, @id)
        UPDATE replies
        SET question_id = ?, parent_id = ?, user_id = ?, body = ?
        WHERE id = ?
        SQL
    end

    def author
        User.find_by_id(@user_id)
    end

    def question
        Question.find_by_question_id(@question_id)
    end

    def parent_reply
        Reply.find_by_id(@parent_id)
    end

    def child_replies
        Reply.find_by_parent_id(@id)
    end

    def self.table_name
        "replies"
    end
end