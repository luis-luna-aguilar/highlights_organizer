class InformationLinesController < ApplicationController

  before_action :set_information_line, only: [:update]

  # POST /information_lines
  # POST /information_lines.json
  def create
    @information_line = InformationLine.new(information_line_params)

    respond_to do |format|
      if @information_line.save
        format.html { redirect_to root_url(current_topic: @information_line.topic.id) }
      else
        format.html { redirect_to root_url, notice: 'Line was not created' }
      end
    end
  end

  # PATCH/PUT /information_lines/1
  # PATCH/PUT /information_lines/1.json
  def update
    respond_to do |format|
      if @information_line.update(information_line_params)
        format.json { head :no_content, status: 200 }
      else
        format.json { render json: @information_line.errors, status: :unprocessable_entity }
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
      params.require(:information_line).permit(:text, :topic_id, :line_order_position)
    end

end
