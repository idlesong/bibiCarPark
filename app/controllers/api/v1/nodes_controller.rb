class Api::V1::NodesController < Api::V1::BaseController
  # before_action :authenticate_user!, only: [:update]
  def index
  end

  def update
    @node = Node.find(params[:id])

    @node.update_attributes(update_params)

    @node = Node.find(params[:id])
    Rails.logger.info("---------------------#{@node.inspect}")
  end

  private

  def update_params
    params.require(:node).permit(:status)
  end

end
