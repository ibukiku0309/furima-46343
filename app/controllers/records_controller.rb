class RecordsController < ApplicationController
  def index
    @records = Record.all.order(created_at: :desc)
  end
end
