class QuestionsController < ApplicationController

  def show
    @question = Question.find(params[:id])
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
end
