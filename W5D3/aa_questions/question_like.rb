class QuestionLike < ModelBase
    attr_accessor :id, :user_id, :question_id

    def self.most_liked_questions(n)
        questions = QuestionsDatabase.instance.execute(<<-SQL, n)
        SELECT
            questions.id, title, body, author_id
        FROM
            question_likes
        JOIN
            questions
        ON
            questions.id = question_likes.question_id    
        GROUP BY questions.id
        ORDER BY count(*) DESC
        LIMIT ?
        SQL
        questions.map {|question| Question.new(question)}
    end

    def self.likers_for_question_id(question_id)
        likers = QuestionsDatabase.instance.execute(<<-SQL, question_id)
        SELECT
            users.id, fname, lname
        FROM
            question_likes
        JOIN
            users
        ON
            users.id = question_likes.user_id
        WHERE
            question_id = ?
        SQL
        likers.map {|user| User.new(user)}
    end

    def self.num_likes_for_question_id(question_id)
        likes = QuestionsDatabase.instance.execute(<<-SQL, question_id)
        SELECT
            COUNT(*)
        FROM
            question_likes
        WHERE
            question_id = ?
        SQL
        likes.first.values[0]
    end

    def self.liked_questions_for_user_id(user_id)
        questions = QuestionsDatabase.instance.execute(<<-SQL, user_id)
        SELECT
            questions.id, title, body, author_id
        FROM
            question_likes
        JOIN
            questions
        ON
            questions.id = question_likes.question_id
        WHERE
            user_id = ?
        SQL
        questions.map {|question| Question.new(question)}
    end

    def initialize(options)
        @id = options['id']
        @user_id = options['user_id']
        @question_id = options['question_id']
    end

    def self.table_name
        "question_likes"
    end
end