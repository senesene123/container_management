class RfidContainer < ApplicationRecord
  scope :search_daily, lambda { |search_params|
    return if search_params.blank?

    daily_at(search_params[:daily])
      .entering_date_at(search_params[:entering_date])
      .leaving_date_at(search_params[:leaving_date])
      .type_is(search_params[:contents])
      .from_place_like(search_params[:from_place])
      .to_place_like(search_params[:to_place])
  }

  scope :search_monthly, lambda { |search_params|
    return if search_params.blank?

    monthly_at(search_params[:monthly])
      .entering_date_at(search_params[:entering_date])
      .leaving_date_at(search_params[:leaving_date])
      .type_is(search_params[:contents])
      .from_place_like(search_params[:from_place])
      .to_place_like(search_params[:to_place])
  }

  scope :daily_at, lambda { |daily|
                     if daily.present?
                       where('created_at LIKE ?', "%#{daily}%")
                     else
                       date = DateTime.now
                       where('created_at LIKE ?', "%#{date.strftime('%Y-%m-%d')}%")
                     end
                   }
  scope :monthly_at, lambda { |monthly|
                       if monthly.present?
                         where('created_at LIKE ?', "%#{monthly}%")
                       else
                         date = DateTime.now
                         where('created_at LIKE ?', "%#{date.strftime('%Y-%m')}%")
                       end
                     }
  scope :entering_date_at, ->(entering_date) { where(entering_date: entering_date) if entering_date.present? }
  scope :leaving_date_at, ->(leaving_date) { where(leaving_date: leaving_date) if leaving_date.present? }
  scope :type_is, ->(contents) { where('contents LIKE ?', "%#{contents}%") if contents.present? }
  scope :from_place_like, ->(from) { where('from_place LIKE ?', "%#{from}%") if from.present? }
  scope :to_place_like, ->(to) { where('to_place LIKE ?', "%#{to}%") if to.present? }
end
