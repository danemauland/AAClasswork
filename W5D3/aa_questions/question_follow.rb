class QuestionFollow < ModelBase
    attr_accessor :id, :user_id, :question_id

    def self.most_followed_questions(n)
        questions = QuestionsDatabase.instance.execute(<<-SQL, n)
        SELECT
            questions.id, title, body, author_id
        FROM
            question_follows
        JOIN
            questions
        ON
            questions.id = question_follows.question_id    
        GROUP BY questions.id
        ORDER BY count(*) DESC
        LIMIT ?
        SQL
        questions.map {|question| Question.new(question)}
    end

    def self.followers_for_question_id(question_id)
        followers = QuestionsDatabase.instance.execute(<<-SQL, question_id)
        SELECT
            users.id, fname, lname
        FROM
            users
        JOIN
            question_follows
        ON
            users.id = question_follows.user_id
        WHERE
            question_id = ?
        SQL
        followers.map {|follower| User.new(follower)}
    end

    def self.followed_questions_for_user_id(user_id)
        questions = QuestionsDatabase.instance.execute(<<-SQL, user_id)
        SELECT
            questions.id, title, body, author_id
        FROM
            questions
        JOIN
            question_follows
        ON
            questions.id = question_follows.question_id
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
        "question_follows"
    end
end