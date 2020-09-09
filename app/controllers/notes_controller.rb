class NotesController < ApplicationController
  def index
    @notes = Note.all
  end

  def new
    @note = Note.new
  end

  def show
    @note = Note.find(params[:id])
  end

  def create
    @note = Note.new(note_params)
    @note.user_id = current_user.id
    if @note.save
      redirect_to notes_path, notice: '投稿に成功しました'
    else 
      render :new
    end 
  end

  def detail
    
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    redirect_to notes_path, notice:"削除しました"
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    if @note.update(note_parameter)
      redirect_to notes_path, notice: "編集しました"
    else
      render 'edit'
    end
  end
  def search
    @notes = Note.search(params[:keyword])
  end

  private

  def note_params
    params.require(:note).permit(:title, :content, :start_time, :user_id)
  end

end
