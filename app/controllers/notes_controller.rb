class NotesController < ApplicationController
  before_action :auth!, only: [:create, :update, :destroy]

  def index
    render json: Note.all.as_json(except: [:text])
  end

  def show
    render json: Note.find(params[:id])
  end

  def create
    render json: Note.create(note_params)
  end

  def update
    note = Note.find(params[:id])
    note.update(note_params)
    render json: note
  end

  def destroy
    note = Note.find(params[:id])
    note.destroy
    render json: note
  end

  private
  def note_params
    params.require(:note).permit(:date, :title, :text)
  end
end
