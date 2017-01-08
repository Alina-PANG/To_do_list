# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
   u = User.create(id: 1, user_name: 'John', password: '123abc', email: 'todolist@gmail.com')
   List.create([{
     list_name: 'Work',
     user: u
     },
     {
       list_name: 'Travel',
       user: u
     },
     {
       list_name: 'Family',
       user: u
       }])

p "Created #{List.count} lists"


#user_lists = [
#  [ "Travel"],
#  [ "Work"],
#  [ "Family"],
#  [ "Book" ]
#]

#user_lists.each do |list_name|
#  List.create( list_name: list_name)
#end


#params =  { :user =>
#    {
#    :user_name => 'John',
#    :password_digest => '123abc',
#    :email => 'todolist@gmail.com',
#
#    :list_attributes => {
#        :list_name => 'Travel',
#        :task_attributes => {
#            :title => 'Beijing',
#            :completed => false,
#            :imp => 3,
#            :date => '2017-05-02 12:17:10',
#            :comment => 'This is a test case',
#          }
#      }
#  }

#User.create!(params[:user])
