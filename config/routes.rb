Rails.application.routes.draw do

  # laporan uang keluar
  get 'apps/laporan/keluar' => 'laporan_keluar#index'

  # laporan uang masuk
  get 'apps/laporan/masuk' => 'laporan_masuk#index'

  # uang masuk
  get  'apps/uang/masuk'            => 'uang_masuk#index'
  get  'apps/uang/masuk/add'        => 'uang_masuk#add'
  post 'apps/uang/masuk/create'     => 'uang_masuk#create'
  get  'apps/uang/masuk/edit/:id'   => 'uang_masuk#edit'
  post 'apps/uang/masuk/update/:id' => 'uang_masuk#update'
  get  'apps/uang/masuk/delete/:id' => 'uang_masuk#delete'

  # uang keluar
  get  'apps/uang/keluar'           => 'uang_keluar#index'
  get  'apps/uang/keluar/add'       => 'uang_keluar#add'
  post 'apps/uang/keluar/create'    => 'uang_keluar#create'
  get  'apps/uang/keluar/edit/:id'  => 'uang_keluar#edit'
  post 'apps/uang/keluar/update/:id'=> 'uang_keluar#update'
  get  'apps/uang/keluar/delete/:id'=> 'uang_keluar#delete'

  # dashboard
  get 'apps/dashboard' => 'dashboard#index'
  get 'apps/sign-out'  => 'dashboard#destroy'	

  # register
  get 	'apps/users'		        => 'register#index'
  get   'apps/users/add'        => 'register#add'
  post	'apps/users/create'     => 'register#create'
  get   'apps/users/edit/:id'   =>'register#edit'
  post  'apps/users/update/:id' =>'register#update'
  get   'apps/users/delete/:id' =>'register#delete'

  # root
  root to: 'home#index'
  get 'home/index'
  post 'sign-in' => 'home#create_session'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
