class StepsController < ApplicationController
  before_action :get_step, only: :show

  def index
  end

  def show
  end

  private

  def get_step
    @step = Step.find(params[:id])
    authorize @step
  end
end