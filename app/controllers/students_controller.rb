class StudentsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :response_not_found
    rescue_from ActiveRecord::RecordInvalid ,with: :error_response
    def show
        student=Student.find(params[:id])
        render json: student
    end
    def index
        student=Student.all
        render json: student
    end
    def create
        student=Student.create!(create_student)
    
    render json: student
    end
    def update
        student=Student.find(params[:id]) 
        student.update!(create_student)
        render json: student, status: :accepted
    end
    def destroy
        student=Student.find(params[:id])
        student.destroy
        head :no_content
    end

    
     private
    def response_not_found
        render json: {error: "Student Not Found"}, status: :not_found
    end
    def create_student
        params.permit(:name, :major, :age)
    end

    def error_response(invalid)
        render json: {errors: invalid.record.errors}, status: :unprocessable_entity
    end
    
end
