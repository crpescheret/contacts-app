class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
    render "index.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    Contact.create({first_name: params[:first_name],
                    last_name: params[:last_name],
                    email: params[:email],
                    phone_number: params[:phone_number]
      })
    render "create.html.erb"
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
    render 'update.html.erb'
  end

  def destroy
    id = params[:id].to_i
    contact = Contact.find_by(id: id)
    contact.destroy
    render 'destroy.html.erb'
  end
end