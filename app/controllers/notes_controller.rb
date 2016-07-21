class NotesController < ApplicationController
  before_action :auth!, only: [:new, :edit, :create, :update, :destroy]

  def index
    notes = Note.all
    render json: notes.as_json(except: [:text])
  end

  def show
    note = Note.find(params[:id])
    render json: note
  end

  def new
    note = Note.new
    render json: note
  end

  def edit
    note = Note.find(params[:id])
    render json: note
  end

  def create
    note = Note.new(note_params)
    note.save
    render json: note
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
