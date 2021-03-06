library(tidyverse)
library(here)
library(spotifyr)

# Você precisará pegar um id e segredo para seu código aqui: https://developer.spotify.com/my-applications/#!/applications 
# 
chaves = read_csv(here::here("code/chaves-do-spotify.csv"), 
                  col_types = "cc")

Sys.setenv(SPOTIFY_CLIENT_ID = pull(chaves, client_id))
Sys.setenv(SPOTIFY_CLIENT_SECRET = pull(chaves, client_secret))

# Autentica com a API e pega token para usar os endpoints 
access_token <- get_spotify_access_token()

# Da maneira como é feito nesse script, você PRECISARÁ RODAR get_artist_audio_features()
# INTERATIVO, PARA UM ARTISTA POR VEZ, para que o terminal lhe pergunte que artista 
# exatamente você quer analisar. 
tame.impala <- get_artist_audio_features('tame impala') %>% 
    mutate(artist = "Tame Impala")

tame.impala %>% 
    bind_rows(tame.impala) %>% 
    write_csv(here("data/tame_impala.csv"))
