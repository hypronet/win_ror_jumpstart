:: Set your application name here.
(
SET APP_NAME=ams

SET BUNDLE_NAME="1.9.2%APP_NAME%"

echo "Installing Bundler..."
gem install bundler

echo "Installing bundle..."
bundle install --system

echo "Creating rails app %APP_NAME%"
rails new %APP_NAME%

TIMEOUT /T 3

echo "Setting Gemfile..."
copy /y Gemfile "%APP_NAME%/"
copy /y Gemfile.lock "%APP_NAME%/" 
cd %APP_NAME%

)
