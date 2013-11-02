GangWarApp::Application.routes.draw do
  root 'test#map'

  get '/crimes/:id' => 'test#specific_crime', as: 'specific_crime'

  get '/all_crimes' => 'test#all', as: 'all_crimes'

  get '/search_results' => 'test#search_results', as: 'search_results'
end
