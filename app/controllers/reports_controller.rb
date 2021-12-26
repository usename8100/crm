class ReportsController < ApplicationController
  def proposals
    @q = Schedule.ransack(params[:q])
    @q.sorts = ['starts_at asc', 'ends_at asc'] if @q.sorts.empty?
  end

  def invoices
  end
end
