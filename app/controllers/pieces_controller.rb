# frozen_string_literal: true

class PiecesController < AgentsController
  # Callbacks
  # ---------

  before_action :piece, only: [:edit, :update, :destroy]

  # Methods
  # -------

  def edit
  end

  def update
    if piece.update(piece_params)
      flash[:notice] = "Piece was successfully updated."
      redirect_to parent_url(@parent)
    else
      render :edit
    end
  end

  def destroy
    piece.destroy
    flash[:notice] = "Piece was successfully destroyed."
    redirect_to parent_url(@parent)
  end

  def new
    @piece = Piece.new
  end

  def create
    @piece = Piece.new(piece_params)

    if @piece.save
      @agent = Agent.new(
        union_id: @parent.union.id,
        act_type: @piece.class.name,
        act_id: @piece.id
      )
      @agent.save

      flash[:notice] = "Piece was successfully created."
      redirect_to parent_url(@parent)
    else
      render :new
    end
  end

  private

  def piece
    @piece = Piece.find_by(slug: params[:id])
  end

  def piece_params
    params.require(:piece).permit(
      :label,
      :body,
      :position
    )
  end
end
