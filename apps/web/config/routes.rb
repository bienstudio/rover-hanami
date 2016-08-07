root to: 'trips#index'

get     '/login',         to: 'sessions#new',     as: 'login'
get     '/login/failure', to: 'sessions#failure'
get     '/logout',        to: 'sessions#destroy', as: 'logout'
post    '/login',         to: 'sessions#create'

get     '/join',          to: 'users#new'

get     '/account',       to: 'users#edit',       as: 'account'
patch   '/account',       to: 'users#update'
delete  '/account',       to: 'users#destroy'

resources :users
resources :trips
