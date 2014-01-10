HighlightsOrganizer::Application.routes.draw do

  resources :topics
  resources :information_lines
  resources :highlights

  root :to => 'visitors#new'

end
