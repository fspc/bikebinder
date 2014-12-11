##############
# BikeBinder #
##############
# Password is password for staff@freeridepgh.org & volunteer@freeridepgh.org

FROM bikebike/bikebike
MAINTAINER Jonathan Rosenbaum <gnuser@gmail.com>

RUN git clone https://github.com/FreeRidePGH/BikeBinder.git 
RUN gem install bundler
RUN apt-get update && apt-get -y install g++ libfcgi-dev libsqlite3-dev 
RUN bundle install --gemfile=/BikeBinder/Gemfile
RUN cd /BikeBinder; bundle exec rake setup; bundle exec rake populate

# setup to use sqlite3
COPY  bikebinder.conf /etc/supervisor/conf.d/
#COPY /BikeBinder/config/application/mailer_config.rb /BikeBinder/config/database.yml

CMD ["supervisord", "-c", "/etc/supervisor/supervisord.conf"]

