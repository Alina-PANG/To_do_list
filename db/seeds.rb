# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#user_lists = [
#  [ "Travel"],
#  [ "Work"],
#  [ "Family"],
#  [ "Book" ]
#]

#user_lists.each do |list_name|
#  List.create( list_name: list_name)
#end


params =  { :user =>
    {
    :user_name => 'John',
    :password_digest => '123abc',
    :email => 'todolist@gmail.com',

    :list_attributes => {
        :list_name => 'Travel',
        :task_attributes => {
            :title => 'Beijing',
            :completed => false,
            :imp => 3,
            :date => '2017-05-02 12:17:10',
            :comment => 'This is a test case',
          }
      }
      {  :list_name => 'Work',
      }
      {
      :list_name => 'Family',
        }
    }
  }

User.create!(params[:user])
