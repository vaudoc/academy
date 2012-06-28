#---
# Excerpted from "The Rails View",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/warv for more book information.
#---
class CreationsController < ApplicationController
  def index
    @creations = Creation.all
  end

  def new
    @creation = Creation.new
  end

  def show
    @creation = Creation.find(params[:id])
    @client = @creation.project.client
  end

  def create
    @creation = Creation.new(params[:creation])
    # STUB: Since we're just illustrating how to build the form, we're
    # just assigning the first project here. In a fully fledged app,
    # this information would either comefrom a
    # mare camplex form that supports selecting the client and
    # project, ar a form that supported adding the creation from the
    # specific project context.
    @creation.project = Project.first
    
    if @creation.save
      flash[:notice] = "Creation added!"
      redirect_to @creation
    else
      flash.now[:alert] = "Could not save creation!"
      render action: 'new'
    end
  end

  def permissions
    @creation = Creation.find(params[:id])
  end

end
