module Api
  module V1
    class NotesController < ApiController
      before_action :set_note, only: %i[show update destroy]

      # GET /notes
      def index
        @notes = Note.all

        render json: @notes
      end

      # GET /notes/1
      def show
        render json: @note
      end

      # POST /notes
      def create
        new_note

        if @note.save
          render json: @note, status: :created, location: @note
          send_notification(@note)
        else
          render json: @note.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /notes/1
      def update
        if @note.update(note_params)
          render json: @note
        else
          render json: @note.errors, status: :unprocessable_entity
        end
      end

      # DELETE /notes/1
      def destroy
        @note.destroy
      end

      private

      def send_notification(note)
        alert_time = note.alert_time.to_datetime
        NotificationWorker.perform_at(alert_time, note.content, note.user.fcm_token)
      end

      def new_note
        @note = Note.new(note_params)
        @note.user = current_user
      end

      def set_note
        @note = Note.find(params[:id])
      end

      def note_params
        params.require(:note).permit(:content, :alert_time)
      end
    end
  end
end
