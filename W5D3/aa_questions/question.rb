class Question < ModelBase
    attr_accessor :id, :title, :body, :author_id

    def self.find_by_author_id(author_id)
        questions = QuestionsDatabase.instance.execute(<<-SQL, author_id)
        SELECT
            *
        FROM
            questions
        WHERE
            author_id = ?
        SQL
        questions.map {|question| Question.new(question)}
    end

    def self.most_liked(n)
        QuestionLike.most_liked_questions(n)
    end

    def self.most_followed(n)
        QuestionFollow.most_followed_questions(n)
    end

    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @author_id = options['author_id']
    end

    def update
        raise "entry does not exist" if @id.nil?
        QuestionsDatabase.instance.execute(<<-SQL, @title, @body, @author_id, @id)
        UPDATE questions
        SET title = ?, body = ?, author_id = ?
        WHERE id = ?
        SQL
    end

    def author
        User.find_by_id(@author_id)
    end

    def replies
        Reply.find_by_question_id(@id)
    end

    def followers
        QuestionFollow.followers_for_question_id(@id)
    end

    def likers
        QuestionLike.likers_for_question_id(@id)
    end

    def num_likes
        QuestionLike.num_likes_for_question_id(@id)
    end

    def self.table_name
        "questions"
    end

    def table_name
        "questions"
    end
end