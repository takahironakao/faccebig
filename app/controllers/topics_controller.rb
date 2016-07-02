class TopicsController < ApplicationController
  before_action :set_topic, only: [:edit, :update, :destroy]

  def index
    @topics = Topic.all
  end

  def new
   @topic = Topic.new
  end

  def create
    @topic = Topic.new(topics_params)
    if @topic.save
      redirect_to topics_path, notice: "作成しました！"
    else
      render action: 'new'
    end
  end
  
  def edit
    @topic = Topic.find(params[:id])
  end
  
  def update
    @topic = Topic.find(params[:id])
    if  @topic.update(topics_params)
    redirect_to topics_path, notice: "更新しました！"
    else
      render action: 'edit'
    end
  end
  
  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    redirect_to topics_path, notice: "削除しました！"
  end

  private
    def topics_params
      params.require(:topic).permit(:content)
    end
    
    def set_topic
      @topic = Topic.find(params[:id])
    end
end