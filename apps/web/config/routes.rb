root to: 'trips#index'

get   '/login',         to: 'sessions#new',     as: 'login'
get   '/login/failure', to: 'sessions#failure'
get   '/logout',        to: 'sessions#destroy', as: 'logout'
post  '/login',         to: 'sessions#create'

get   '/join',          to: 'users#new'

resources :users
