class User < ModelBase
    attr_accessor :id, :fname, :lname

    def self.find_by_name(fname, lname)
        user = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
        SELECT
            *
        FROM
            users
        WHERE
            (fname = ? AND lname = ?)
        SQL
        User.new(user.first)
    end

    def initialize(options)
        @id = options['id']
        @fname = options['fname']
        @lname = options['lname']
    end

    def save
        raise "entry already exists" unless @id.nil?
        QuestionsDatabase.instance.execute(<<-SQL, @fname, @lname)
        INSERT INTO users (fname, lname)
        VALUES (?, ?)
        SQL
        @id = QuestionsDatabase.instance.last_insert_row_id
    end

    def update
        raise "entry does not exist" if @id.nil?
        QuestionsDatabase.instance.execute(<<-SQL, @fname, @lname, @id)
        UPDATE users
        SET fname = ?, lname = ?
        WHERE id = ?
        SQL
    end

    def authored_questions
        Question.find_by_author_id(@id)
    end

    def authored_replies
        Reply.find_by_user_id(@id)
    end

    def followed_questions
        QuestionFollow.followed_questions_for_user_id(@id)
    end

    def liked_questions
        QuestionLike.liked_questions_for_user_id(@id)
    end

    def average_karma
        nums = QuestionsDatabase.instance.execute(<<-SQL, @id)
            SELECT
                count(question_likes.id) AS likes, count(DISTINCT questions.id) AS questions
            FROM questions
            LEFT OUTER JOIN question_likes
            ON questions.id = question_likes.question_id
            WHERE author_id = ?
        SQL
        nums = nums.first
        raise "no questions" if nums['questions'] == 0 
        nums['likes'] / nums['questions'].to_f
    end

    def self.table_name
        "users"
    end
end