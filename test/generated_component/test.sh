#!/usr/bin/env bash

set -ue

pushd ./test/generated_component
pwd

. ./install-gems.sh

bundle exec evt component something_component



popd
pwd

# rm -rf *-component/
# bundle exec evt component foo_component



# rm -f *.gem
# rm -rf test/package/installed

# echo "Building client gem"
# gem build account-client.gemspec --norc

# echo "Installing client gem"
# gem install account-client*.gem \
#   --install-dir ./test/package/installed \
#   --norc \
#   --no-document \
#   --no-ri

# export GEM_PATH=test/package/installed

# ruby test/package/client.rb
