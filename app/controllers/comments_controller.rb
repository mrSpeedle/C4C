class CommentsController < ApplicationController
  def create
    @publication = Publication.find(params[:comment][:publication_id])
    @comment = @publication.comments.new(comment_params) # Asociación correcta

    @comment.user = current_user # Asignar el usuario actual

    respond_to do |format|
      if @comment.save
        format.html { redirect_to publication_path(@publication), notice: 'Comment was successfully created.' }
      else
        # En caso de error, renderiza la vista de la publicación con los errores
        format.html { redirect_to publication_path(@publication), alert: 'Comment was not created.' }
        # Puedes optar por renderizar una vista específica si lo prefieres
        # format.html { render 'publications/show', status: :unprocessable_entity }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :publication_id)
  end
end
