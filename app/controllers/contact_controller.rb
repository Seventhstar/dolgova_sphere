class ContactController < ApplicationController
  def index
    @contacts = Contact.order(:id)
  end
end
