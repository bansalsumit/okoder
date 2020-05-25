class QuestionsController < ApplicationController

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
    unless @question.present?
      flash.now[:alert] = "Your book was not found"
      redirect_to root_path and return
    end
  end

  def follow_topic
    @question = Question.find(params[:id])
    current_user.topics << @question.topic
    if current_user.save
      redirect_to root_path
    end
  end

  def follow_user
    @question = Question.find(params[:id])
    current_user.topics << @question.user
    if current_user.save
      redirect_to question_path(@question)
    end
  end
end
