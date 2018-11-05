# Associations Exercise

To get started, download the [project skeleton][skeleton].  You will want to unzip the file and `cd` into the `skeleton` directory, then run `bundle install`.

We are going to write active record associations to connect some models.
A rails project has been created for your testing purposes with the database
migrations already set up for your convenience. 

Run `bundle exec rails db:setup` to create and migrate your database.

In this project there are three models:
`User`, `Course`, and `Enrollment`. It is your duty to connect them using
active record associations.

Be sure and check out the `db/schema.rb` to see what you are dealing with.

[skeleton]: http://assets.aaonline.io/fullstack/sql/projects/associations_exercise/skeleton.zip?raw=true

## Learning Goals

* Understand what an ActiveRecord association represents
* Know when to use `has_many` vs. `belongs_to`
* Be able to write `has_many` and `belongs_to` associations
* Know what variables to use as `primary_key`, `foreign_key`, and `class_name`
* Know how to use ActiveRecord associations to return associated objects

## `Enrollment`

Open the model, `app/models/enrollment.rb`. Add the associations inside the
currently empty class. You will need associations for `User` and `Course`.

After you are done adding the associations, you should be able to execute
`Enrollment.first.user` and `Enrollment.first.course` in the `rails
console`. These commands should return the associated user and course
for the first enrollment.

## `User`

Add associations for `enrollments` and
`enrolled_courses`. This might take a little bit of thinking.

You will know you have succeeded when you can execute
`User.first.enrollments` and `User.first.enrolled_courses` in the `rails
console`. These commands should return the user's enrollments and
enrolled courses.


## `Course`

Add `enrollments` and `enrolled_students` associations. You can infer
how to test these based on our previous work.

Now, things get tricky. Add an association for `prerequisite`. This
should return a course's prereq (if it has one).

Finally, add an `instructor` association to `Course`. This will point to
a `User` object. Note that `Course` is now related to `User` in two
ways: `instructor` and `enrolled_students`.

**Call over a TA** and show them your associations code.

--------------------------
**Associations!**

Welcome to the associations exercise.

Check out the [`db/schema.rb`][schema] to see what your database will look like.

Check out [`db/seeds.rb`][seedfile] to see what test data your database contains.

The database has already been created and is standing by for your usage.

[schema]: ./db/schema.rb
[seedfile]: ./db/seeds.rb
