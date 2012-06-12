(
:: Set your application name here.
SET APP_NAME=ams

SET BUNDLE_NAME="1.9.2%APP_NAME%"

echo "Installing Bundler..."
gem install bundler --no-ri --no-rdoc

echo "Installing bundle..."
bundle install --system

echo "Creating rails app %APP_NAME%"
rails new %APP_NAME%

echo "Setting Gemfile..."
copy /y Gemfile "%APP_NAME%/"
copy /y Gemfile.lock "%APP_NAME%/" 
cd %APP_NAME%

echo "Setting up active_scafold css and js..."
move ..\app\assets\stylesheets\application.css ..\app\assets\stylesheets\application_css_bak
copy /y ..\application.css app\assets\stylesheets\application.css
copy /y ..\bodybackground.png app\assets\images

echo "Generating Devise configuration. You MUST review it at 'config/initializers/devise.rb'"
echo "See https://github.com/plataformatec/devise for more details on devise."
rails generate devise:install
echo "Generating scaffolding..."

:: Change the following for your models...

rails g active_scaffold Customer name:string email:string phone1:string phone2:string fax:string
rails g active_scaffold Site name:string customer_id:integer supervisor_id:integer
rails g active_scaffold Attendance site_id:integer customer_id:integer recorded_at:datetime uploaded_at:datetime shift1:integer shift2:integer shift3:integer device_id:integer supervisor_id:integer
rails g active_scaffold User first_name:string last_name:string phone:string customer_id:integer
rails g active_scaffold Role name:string

rails g devise User
rails g devise:views
rails g cancan:ability

echo "****"
echo "Temporarily allowing open authorization. Change app/model/ability.rb to change this!"
echo "****"
copy /y ..\ability.rb .\app\models\ability.rb
mkdir -p .\app\views\devise\menu
copy /y ..\_login_items.html.erb .\app\views\devise\menu
copy /y ..\_registration_items.html.erb .\app\views\devise\menu

:: copy the home controller and home page
copy /y ..\home_controller.rb .\app\controllers
mkdir .\app\views\home
copy /y ..\index.html.erb .\app\views\home

echo "Running db migrate..."
rake db:migrate

echo "Your app is now ready."
echo "Add the following to config/routes.rb"
echo "    root :to => 'home#index'"
echo "Then start the rails server as:"
echo "cd %APP_NAME%; rails s"
)
 :: echo "Generating scaffolding..."
  
  

