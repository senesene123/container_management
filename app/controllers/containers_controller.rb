class ContainersController < ApplicationController
  def index
    @search_pramas = input_paramas
    @containers = RfidContainer.search(@search_pramas)
  end

  private

  def input_paramas
    params.require(:u).permit(
      :nippo_flg,
      :geppo_flg,
      :daily,
      :monthly, 
      :entering_date,
      :leaving_date,
      :type,
      :from_place,
      :to_place
    )
  end
end