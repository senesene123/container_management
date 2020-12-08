class RfidContainer < ApplicationRecord
  belongs_to :companies, optional: true
  belongs_to :vegetables, optional: true

  scope :search_daily, lambda { |search_params|
    return if search_params.blank?

    daily_at(search_params[:daily])
      .with_company_from
      .with_company_to
      .with_vegetable
      .container_id_is(search_params[:container_id])
      .contents_size_at(search_params[:contents_size])
      .entering_flg_at(search_params[:entering_flg])
      .entering_date_at(search_params[:entering_date])
      .leaving_date_at(search_params[:leaving_date])
      .type_is(search_params[:contents])
      .from_place_like(search_params[:from_place])
      .to_place_like(search_params[:to_place])
      .select('rfid_containers.*, fp.company_name AS fp_name, tp.company_name AS tp_name, vegetables.vegetable_name')
  }

  scope :search_monthly, lambda { |search_params|
    return if search_params.blank?

    monthly_at(search_params[:monthly])
      .with_company_from
      .with_company_to
      .with_vegetable
      .container_id_is(search_params[:container_id])
      .contents_size_at(search_params[:contents_size])
      .entering_flg_at(search_params[:entering_flg])
      .entering_date_at(search_params[:entering_date])
      .leaving_date_at(search_params[:leaving_date])
      .type_is(search_params[:contents])
      .from_place_like(search_params[:from_place])
      .to_place_like(search_params[:to_place])
      .select('rfid_containers.*, fp.company_name AS fp_name, tp.company_name AS tp_name, vegetables.vegetable_name')
  }

  scope :with_company_from, lambda {
                              joins('LEFT OUTER JOIN companies AS fp ON rfid_containers.from_place = fp.company_id')
                            }
  scope :with_company_to, lambda {
                            joins('LEFT OUTER JOIN companies AS tp ON rfid_containers.to_place = tp.company_id')
                          }
  scope :with_vegetable, lambda {
                           joins('LEFT OUTER JOIN vegetables ON rfid_containers.contents = vegetables.vegetable_id')
                         }
  scope :daily_at, lambda { |daily|
                     if daily.present?
                       where('rfid_containers.created_at LIKE ?', "%#{daily}%")
                     else
                       date = DateTime.now
                       where('rfid_containers.created_at LIKE ?', "%#{date.strftime('%Y-%m-%d')}%")
                     end
                   }
  scope :monthly_at, lambda { |monthly|
                       if monthly.present?
                         where('rfid_containers.created_at LIKE ?', "%#{monthly}%")
                       else
                         date = DateTime.now
                         where('rfid_containers.created_at LIKE ?', "%#{date.strftime('%Y-%m')}%")
                       end
                     }
  scope :container_id_is, lambda { |container_id|
                            where('container_id LIKE ?', "%#{container_id}%") if container_id.present?
                          }
  scope :contents_size_at, ->(contents_size) { where(contents_size: contents_size) if contents_size.present? }
  scope :entering_flg_at, ->(entering_flg) { where(entering_flg: entering_flg) if entering_flg.present? }
  scope :entering_date_at, ->(entering_date) { where(entering_date: entering_date) if entering_date.present? }
  scope :leaving_date_at, ->(leaving_date) { where(leaving_date: leaving_date) if leaving_date.present? }
  scope :type_is, ->(contents) { where(contents: contents) if contents.present? }
  scope :from_place_like, ->(from) { where(from_place: from) if from.present? }
  scope :to_place_like, ->(to) { where(to_place: to) if to.present? }
end
