class EventsController < ApplicationController
  before_action :set_event, only: [:edit, :update, :show, :favorite, :ticket]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update]
  
    def index
        @events = Event.all
    end
    
    def show
      
    end
    def new 
       @event = Event.new 
    end
    
    def create
        @event = Event.new(event_params)
        @event.user = current_user
        
        if @event.save
          flash[:success]= "Tu evento fue creado con éxito!"
          redirect_to events_path
        else
          render :new
        end
    end
    
    def edit
      
    end 
    
    def update 
      if @event.update(event_params)
        redirect_to event_path(@event)
      else
        render :edit
      end
    end 
    
    def favorite
      Favorite.create(favorite: params[:favorite], user: current_user, event: @event)
      redirect_to :back
    end
    
    def ticket
      Ticket.create(ticket: params[:ticket], user: current_user, event: @event)
      flash[:success]  = "Tu boleto fue comprado exitosamente" 
      redirect_to :back
    end
    
    private
    
      def event_params
        params.require(:event).permit(:name, :address, :description, :price, :start_date, :picture)
      end
      
      def set_event
        @event = Event.find(params[:id])
      end
      
      def require_same_user
        if current_user != @event.user
          flash[:danger]  = "You can only edit your own events" 
          redirect_to events_path
        end
      end
end