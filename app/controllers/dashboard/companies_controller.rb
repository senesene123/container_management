module Dashboard
  class CompaniesController < Dashboard::BaseController
    def index
      @companies = Company.all
      @form = Company.new
    end

    def create
      @company = Company.new(company_id: input_params[:company_id],
                             company_name: input_params[:company_name])

      @company.save
      @companies = Company.all
    end

    def edit
    end

    def destroy
      @company = Company.find_by(company_id: input_params[:id])

      @company.destroy
      @companies = Company.all
    end

    private

    def input_params
      params.permit(:company_id, :company_name, :id)
    end
  end
end
