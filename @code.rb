rails g controller Welcome index







# framework
class User < ApplicationRecord
  has_and_belongs_to_many :courses
# has_and_belongs_to_many :contents
end
 
class course < ApplicationRecord
  has_and_belongs_to_many :users
  has_and_belongs_to_many :contents
end
 
class Content < ApplicationRecord
  has_and_belongs_to_many :courses
#  has_and_belongs_to_many :users

end


rails g model User name:string # role: string
rails g model Course name:string   #type: string
rails g model Content name:string  #detail:text

#below are wrong codes!
###rails g migration CreateUsersCourses user:references course:references
###rails g migration CreateCoursesContents Course:references content:references




rails generate scaffold User name:string

rails generate scaffold Course name:string

rails generate scaffold Content name:string





rake db:migrate



userjack = User.create(name:'Jack')

course1 = userjack.courses.create(name:'cpp')


coursecpp = Course.create(name:'cpp')

coursecpp2 = Course.create(name:'cpp')
usercpp = coursecpp2.users.create(name:'cppuser')



### manually generate join table!
rails g migration CreateJoinTableCourseuser course user
rails g migration CreateJoinTableContentCourse content course


class CreateUsersCoursesJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_table :users_courses, id: false do |t|
      t.integer :user_id
      t.integer :course_id
    end
 
    add_index :users_courses, :user_id
    add_index :courses_users, :course_id
  end
end


class CreateAssembliesPartsJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_join_table :assemblies, :parts do |t|
      t.index :assembly_id
      t.index :part_id
    end
  end
end