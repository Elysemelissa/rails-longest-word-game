Rails.application.routes.draw do

root to: 'games#new'
get 'new', to: 'games#new'
post 'score', to: 'games#score'
get 'reset', to: 'games#reset'

end
