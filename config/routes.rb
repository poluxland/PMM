# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  resources :check_list_despacho_camions
  resources :ptmtrucks
  get 'historic', to: 'ptmtrucks#historico'
  resources :traslados
  resources :informes
  resources :trabajos do
  resources :reportes
end

  get 'last', to: 'informes#last', as: 'last_informe'
  resources :estado_canchas
  get 'hist', to: 'estado_canchas#hist'
  resources :mantenimientos
  resources :evaluacions
  resources :sectors
  resources :barredoras
  resources :puzolanas
  resources :envasadoras
  get 'henv', to: 'envasadoras#henv'
  resources :aprs
  resources :plants
  resources :inspections
  get 'full', to: 'inspections#full'
  resources :supervisors
  resources :tareas
  resources :areas
  resources :recuperados
  get 'historico', to: 'recuperados#historico'
  resources :estado_edificios
  get 'ed', to: 'estado_edificios#ed'
  resources :derrames
  resources :trucks
  get 'blank', to: 'trucks#blank'
  get 'inf', to: 'trucks#inf'
  get 'report', to: 'trucks#report'
  get 'month', to: 'trucks#month'
  get 'year', to: 'trucks#year'
  get 'trucks_in_2022', to: 'trucks#trucks_in_2022'
  resources :checklists
  resources :brus
  get 'resume', to: 'brus#resume'
  resources :lvs
  resources :cuasis
  resources :registros
  resources :canchas
  get 'bloquear', to: 'canchas#bloquear'

  resources :mmpps
  namespace :admin do
    resources :users
    resources :announcements
    resources :notifications
    resources :services
    resources :brus

    root to: 'users#index'
  end

  get '/privacy', to: 'home#privacy'
  get '/terms', to: 'home#terms'
  get '/inf', to: 'home#informes'

  get '/others', to: 'home#others'
  authenticate :user, ->(u) { u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  resources :notifications, only: [:index]
  resources :announcements, only: [:index]

  devise_for :users, controllers: { registrations: 'users/registrations' }

  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
