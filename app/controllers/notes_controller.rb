class NotesController < ApplicationController
  def edit
    @note = Note.find(params[:id])
  end

  def create
    @note = Note.new
    @note.customer_id = params[:customer_id]
    @note.content = params[:content]
    if @note.save
      flash[:success] = "Add new note successfully!"
      redirect_to note_lead_path(@note.customer_id)
    else
      redirect_to root_path
    end
  end

  def new
  end

  def destroy
    @note = Note.find(params[:id])
    if @note.destroy
      flash[:success] = "Deleted note!"
      redirect_to note_lead_path(params[:lead_id])
    else
      redirect_to root_path
    end
  end

  def update
    @note = Note.find(params[:id])
    if @note.update(content: params[:note][:content])
      flash[:success] = "Updated note!"
      redirect_to note_lead_path(params[:lead_id])
    else
      redirect_to root_path
    end
  end
end
