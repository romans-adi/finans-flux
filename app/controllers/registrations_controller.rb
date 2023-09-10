class RegistrationsController < Devise::RegistrationsController
  def create
    super do |resource|
      resource.name = params[:user][:full_name] if resource.persisted?
    end
  end
end
