option='--no-cache'
image_name=anime_gan
version=$(cat VERSION)
set -e

# dockerize
docker build $cache_option -t $image_name:$version .
