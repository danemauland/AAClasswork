# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create username: 'a'
User.create username: 'b'
User.create username: 'c'
User.create username: 'd'
User.create username: 'e'
User.create username: 'f'

Poll.create! user_id: 1, title: :title1
Poll.create! user_id: 2, title: :title2
Poll.create! user_id: 3, title: :title3
Poll.create! user_id: 4, title: :title4
Poll.create! user_id: 5, title: :title5
Poll.create! user_id: 6, title: :title6

Question.create! poll_id: 1, question: :question1
Question.create! poll_id: 1, question: :question2
Question.create! poll_id: 1, question: :question3
Question.create! poll_id: 2, question: :question1
Question.create! poll_id: 2, question: :question2
Question.create! poll_id: 2, question: :question3
Question.create! poll_id: 3, question: :question1
Question.create! poll_id: 3, question: :question2
Question.create! poll_id: 3, question: :question3
Question.create! poll_id: 4, question: :question1
Question.create! poll_id: 4, question: :question2
Question.create! poll_id: 4, question: :question3
Question.create! poll_id: 5, question: :question1
Question.create! poll_id: 5, question: :question2
Question.create! poll_id: 5, question: :question3
Question.create! poll_id: 6, question: :question1
Question.create! poll_id: 6, question: :question2
Question.create! poll_id: 6, question: :question3

AnswerChoice.create question_id: 1, text: :answer1
AnswerChoice.create question_id: 1, text: :answer2
AnswerChoice.create question_id: 1, text: :answer3
AnswerChoice.create question_id: 2, text: :answer1
AnswerChoice.create question_id: 2, text: :answer2
AnswerChoice.create question_id: 2, text: :answer3
AnswerChoice.create question_id: 3, text: :answer1
AnswerChoice.create question_id: 3, text: :answer2
AnswerChoice.create question_id: 3, text: :answer3

Response.create! user_id: 1, answer_choice_id: 9
Response.create! user_id: 1, answer_choice_id: 6
Response.create! user_id: 2, answer_choice_id: 8
Response.create! user_id: 3, answer_choice_id: 5
Response.create! user_id: 2, answer_choice_id: 1
Response.create! user_id: 3, answer_choice_id: 2
