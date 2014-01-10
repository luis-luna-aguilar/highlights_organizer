class TopicsController < ApplicationController

  before_action :set_topic, only: [:update, :destroy]

  # POST /topics
  # POST /topics.json
  def create
    @topic = Topic.new(topic_params)

    respond_to do |format|
      if @topic.save
        format.html { redirect_to root_url(current_topic: @topic.id), notice: 'Topic created' }
      else
        format.html { redirect_to root_url, notice: 'Topic was not created' }
      end
    end
  end

  # PATCH/PUT /topics/1
  # PATCH/PUT /topics/1.json
  def update
    title = params[:value]
    respond_to do |format|
      if @topic.update({title: title})
        format.json { head :no_content, status: 200 }
      else
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /topics/1
  # DELETE /topics/1.json
  def destroy
    @topic.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content, status: 200 }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_topic
      @topic = Topic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def topic_params
      params.require(:topic).permit(:title, :parent_id)
    end

end
