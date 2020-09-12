class RfidContainer < ApplicationRecord
  scope :search_daily, lambda { |search_params|
    return if search_params.blank?

    daily_at(search_params[:daily])
      .container_id_is(search_params[:container_id])
      .contents_size_at(search_params[:contents_size])
      .entering_flg_at(search_params[:entering_flg])
      .entering_date_at(search_params[:entering_date])
      .leaving_date_at(search_params[:leaving_date])
      .type_is(search_params[:contents])
      .from_place_like(search_params[:from_place])
      .to_place_like(search_params[:to_place])
  }

  scope :search_monthly, lambda { |search_params|
    return if search_params.blank?

    monthly_at(search_params[:monthly])
      .container_id_is(search_params[:container_id])
      .contents_size_at(search_params[:contents_size])
      .entering_flg_at(search_params[:entering_flg])
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
  scope :container_id_is, lambda { |container_id|
                            where('container_id LIKE ?', "%#{container_id}%") if container_id.present?
                          }
  scope :contents_size_at, ->(contents_size) { where(contents_size: contents_size) if contents_size.present? }
  scope :entering_flg_at, ->(entering_flg) { where(entering_flg: entering_flg) if entering_flg.present? }
  scope :entering_date_at, ->(entering_date) { where(entering_date: entering_date) if entering_date.present? }
  scope :leaving_date_at, ->(leaving_date) { where(leaving_date: leaving_date) if leaving_date.present? }
  scope :type_is, ->(contents) { where('contents LIKE ?', "%#{contents}%") if contents.present? }
  scope :from_place_like, ->(from) { where('from_place LIKE ?', "%#{from}%") if from.present? }
  scope :to_place_like, ->(to) { where('to_place LIKE ?', "%#{to}%") if to.present? }
end
