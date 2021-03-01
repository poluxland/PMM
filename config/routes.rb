# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  resources :trucks
  get 'blank', to: 'trucks#blank'
  resources :checklists
  resources :brus
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
  get '/others', to: 'home#others'
  authenticate :user, ->(u) { u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  resources :notifications, only: [:index]
  resources :announcements, only: [:index]
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
