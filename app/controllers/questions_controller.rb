class QuestionsController < ApplicationController

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
    unless @question.present?
      redirect_to root_path and return
    end
  end

  def follow_topic
    @question = Question.find(params[:id])
    if current_user.topics.exists?(@question.topic)
      flash.now[:alert] = "You already followed this topic"
      redirect_to question_path(@question)
    else
      current_user.topics << @question.topic
      current_user.save
      redirect_to root_path
    end
  end

  def follow_user
    @question = Question.find(params[:id])
    current_user.follow << @question.user.id
    if current_user.save
      redirect_to question_path(@question)
    end
  end
end
