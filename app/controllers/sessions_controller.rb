class SessionsController < ApplicationController
	before_filter :authenticate_user, except: [:index, :login, :login_attempt, :logout]
	before_filter :save_login_state, only: [:index, :login, :login_attempt]

	def home
		if session[:student_id]
			redirect_to controller: 'studentassignments', action: 'index'
		elsif session[:teacher_id]
			redirect_to controller: 'assignments', action: 'index'
		end
	end

	def profile
	end

	def setting
	end

	def login
	end

	def login_attempt
		session[:teacher_id] = nil
		session[:student_id] = nil

		authorized_user = User.authenticate(params[:email], params[:login_password])
		if authorized_user
		  session[:user_id] = authorized_user.id
			session[:email] = authorized_user.email
			puts "Authorized user id: #{session[:user_id]}"
			# output example from shell: Authorized user id: 5
		  student = Student.find_by_user_id session[:user_id]
			if student
				puts "Student Authorized: #{student.id}"
			  session[:student_id] = student.id
			else
		    teacher = Teacher.find_by_user_id session[:user_id]
				if teacher
					puts "Teacher Authorized: #{teacher.id}"
					session[:teacher_id] = teacher.id
					# example of out from shell: Teacher Authorized: 1
				end
			end

			puts "Student id: #{session[:student_id]}; Teacher_id: #{session[:teacher_id]}"
			# prints this info out in the command line of rails server so you can
			# track what's going on as the method runs. Would rather use log4r gem but
			# is a little complicated to set up
			# output exmample from shell: Student id: ; Teacher_id: 1

			flash[:notice] = "Welcome back to Homework Tracker! You've logged in as #{session[:email]}"
			redirect_to(action: 'home')

		else
			flash[:notice] = "Invalid Username or Password"
			flash[:color] = "invalid"
			render "login"
		end
	end

	def logout
    session[:user_id] = nil
		session[:teacher_id] = nil
		session[:student_id] = nil
		redirect_to action: 'login'
	end
end
