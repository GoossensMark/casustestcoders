import os

base_url = 'https://testrpg-one.vercel.app'
api_url = base_url + '/api'
build_url = api_url + '/builds'
play_url = base_url + '/play'
valid_builds = ['thief', 'knight', 'mage', 'brigadier']
cat_url = 'https://api.thecatapi.com/v1/images/search'
cat_key = os.getenv('CAT_API_KEY', '')
