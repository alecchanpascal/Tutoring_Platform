# README

# Members: Aaron, Ailing, Alec, Han, Kyle, Mehak, Mike

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

  create_table "enrollments", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "lesson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_enrollments_on_lesson_id"
    t.index ["student_id"], name: "index_enrollments_on_student_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.string "subject"
    t.text "description"
    t.integer "cost"
    t.datetime "time_of_lesson"
    t.bigint "tutor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tutor_id"], name: "index_lessons_on_tutor_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.text "body"
    t.bigint "student_id"
    t.bigint "tutor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_reviews_on_student_id"
    t.index ["tutor_id"], name: "index_reviews_on_tutor_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.boolean "is_tutor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "enrollments", "lessons"
  add_foreign_key "enrollments", "users", column: "student_id"
  add_foreign_key "lessons", "users", column: "tutor_id"
  add_foreign_key "reviews", "users", column: "student_id"
  add_foreign_key "reviews", "users", column: "tutor_id"

s1 = User.create(username: "s1", email: "s1@s.s", password_digest: "123",is_tutor: false);
s2 = User.create(username: "s2", email: "s2@s.s", password_digest: "123",is_tutor: false);
s3 = User.create(username: "s3", email: "s3@s.s", password_digest: "123",is_tutor: false);
t1 = User.create(username: "t1", email: "t1@t.t", password_digest: "123",is_tutor: true);
t2 = User.create(username: "t2", email: "t2@t.t", password_digest: "123",is_tutor: true);
t3 = User.create(username: "t3", email: "t3@t.t", password_digest: "123",is_tutor: true);
User.all.where(is_tutor: [false]).count 
User.all.where(is_tutor: [true]).count 

l1 = Lesson.create(subject: "rails1", description: "wow" ,cost: 100, time_of_lesson: DateTime.new(2022, 8, 29, 22, 35, 0), tutor_id: 1);   

l2 = Lesson.create(subject: "rails2", description: "wow" ,cost: 100, time_of_lesson: DateTime.new(2022, 8, 29, 22, 35, 0), tutor_id: 2);   

e11 = Enrollment.create(student_id: 1, lesson_id: 1); 
e12 = Enrollment.create(student_id: 2, lesson_id: 1); 
e33 = Enrollment.create(student_id: 3, lesson_id: 1); 

e21 = Enrollment.create(student_id: 1, lesson_id: 2); 
e22 = Enrollment.create(student_id: 2, lesson_id: 2); 
e23 = Enrollment.create(student_id: 3, lesson_id: 2);

Enrollment