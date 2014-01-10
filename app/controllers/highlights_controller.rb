class HighlightsController < ApplicationController
  
  # POST /highlights
  # POST /highlights.json
  def create
    @highlight = Highlight.new(highlight_params)

    respond_to do |format|
      if @highlight.save
        format.html { redirect_to root_url, notice: 'Highlight created', current_topic: @highlight.information_line.topic.id }
      else
        format.html { redirect_to root_url, notice: 'Highlight was not created' }
      end
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_information_line
      @information_line = InformationLine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def information_line_params
      params.require(:information_line).permit(:text, :topic_id)
    end

end
