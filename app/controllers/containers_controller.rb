require 'search_form'

class ContainersController < ApplicationController
  include ContainersHelper

  def index
    @search_params = {}
    @flg_params = ::SearchForm.new
    @containers_daily = RfidContainer.new
    @containers_monthly = RfidContainer.new
  end

  def search
    @search_params = input_params
    @flg_params = ::SearchForm.new(nippo_flg: @search_params[:nippo_flg], geppo_flg: @search_params[:geppo_flg])
    @containers_daily = RfidContainer.search_daily(@search_params) if @search_params[:nippo_flg]
    @containers_monthly = RfidContainer.search_monthly(@search_params) if @search_params[:geppo_flg]
  end

  private

  def input_params
    params.fetch(:container, {}).permit(
      :nippo_flg,
      :geppo_flg,
      :daily,
      :monthly,
      :entering_date,
      :leaving_date,
      :contents,
      :from_place,
      :to_place
    )
  end
end
