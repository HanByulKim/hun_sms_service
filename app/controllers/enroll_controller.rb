class EnrollController < ApplicationController
  before_action :authenticate#, only: [:sendtest]
  before_action :authenticate_admin#, only: [:sendtest]
  
    def register
        @member = Member.all
    end
        
    def create
        Member.create(name: params[:name], phone: params[:phone], residence: params[:residence], elec_constit: params[:elec_constit], support_ide: params[:support_ide], age: params[:age], sex: params[:sex], recog: params[:recog],
                    support_re: params[:support_re], par_eval: params[:par_eval], support_gov: params[:support_gov], support_party: params[:support_party], governer: params[:governer], job: params[:job], position: params[:position],
                    homenum: params[:homenum], compnum: params[:compnum], email: params[:email], recommender: params[:recommender], native: params[:native], birth: params[:birth], partyfee: params[:partyfee])
        redirect_to '/enroll'
    end
end
