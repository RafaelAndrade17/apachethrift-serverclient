# Install Matz Ruby Interpreter and common gems
install_ruby() {
  echo 'Installing Ruby 2.7'
  sudo apt-get install -y ruby \
    bundler \
    ri \
    ruby-dev  > /dev/null 2>&1
}

# Install Python 3
install_python() {
  echo 'Installing Python 3'
  sudo apt-get install -y python3-all \
    python3-all-dbg \
    python3-all-dev \
    python3-setuptools \
    python3-pip > /dev/null 2>&1
}



# Install PHP 7.4
install_php() {
  echo 'Installing PHP 7.4'
  sudo apt-get install -y php-cli > /dev/null 2>&1
}

# Install Apache Thrift
install_thrift() {
  sudo apt-get install -y thrift-compiler \
  ruby-thrift \
  python3-thrift \
  php-thrift > /dev/null 2>&1
}

# Remove unused software
clean_up() {
  sudo apt -y autoremove && sudo apt autoclean > /dev/null 2>&1
}

setup() {
  install_ruby
  install_python
  install_php
  install_thrift
  clean_up
}

setup "$@"