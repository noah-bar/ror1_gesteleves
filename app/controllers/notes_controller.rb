class NotesController < ApplicationController
  load_and_authorize_resource
  def create
    note = Note.find_by(exam_id: note_params[:exam_id], student_id: note_params[:student_id]) || Note.new(exam_id: note_params[:exam_id], student_id: note_params[:student_id])
    if note_params[:value] == nil
      if note.persisted?
        note.destroy!
      end
    else
      note.value = note_params[:value]
      note.save!
    end
    render json: note, status: 200
  end

  private
  def note_params
    params.require(:note).permit(:value, :exam_id, :student_id)
  end
end
