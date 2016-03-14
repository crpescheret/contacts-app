class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
    render "index.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    contact = Contact.create({first_name: params[:first_name],
                              last_name: params[:last_name],
                              email: params[:email],
                              phone_number: params[:phone_number]
      })
    redirect_to "/contacts/#{contact.id.to_i}"
  end

  def show
    id = params[:id].to_i
    @contact = Contact.find_by(id: id)
    render 'show.html.erb'
  end

  def edit
    id = params[:id].to_i
    @contact = Contact.find_by(id: id)
    render 'edit.html.erb'
  end

  def update
    id = params[:id].to_i
    contact = Contact.find_by(id: id)
    contact.update({first_name: params[:first_name],
                    last_name: params[:last_name],
                    email: params[:email],
                    phone_number: params[:phone_number]
      })
    redirect_to "/contacts/#{contact.id}"
  end

  def destroy
    id = params[:id].to_i
    contact = Contact.find_by(id: id)
    contact.destroy
    redirect_to '/contacts'
  end
end