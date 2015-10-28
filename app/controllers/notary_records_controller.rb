class NotaryRecordsController < ApplicationController
  before_action :set_notary_record, only: [:show, :edit, :update, :destroy]
  layout "with_left_sidebar"
  load_and_authorize_resource

  def index
    @notary_records = current_user.notary_records
  end



end