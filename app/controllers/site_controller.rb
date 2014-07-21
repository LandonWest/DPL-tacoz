class SiteController < ApplicationController

  def index

  end

  def about

  end

  def contact

  end

  def contact_submit
    # the line below is another way to do this using sidekiq's built in worker,
    #  so you don't have to create a custom worker, just add this line and you're done.
    # ContactMailer.delay.contact_request(params)
    ContactRequestWorker.perform_async(params[:name], [:email], [:subject], [:question])
    redirect_to root_path, notice: 'Thanks for contacting us!'
  end

end
