
## Installation

1. Elm, https://guide.elm-lang.org/get_started.html


### Auto build

#### Chokidar - worked

https://maximilianhoffmann.com/posts/how-to-compile-elm-files-on-save

sudo npm install chokidar-cli --save-dev

#### Elm live - didn't work
https://github.com/tomekwi/elm-live

https://www.npmjs.com/package/elm-live

sudo npm install --save-dev elm elm-live


### Code format

https://github.com/avh4/elm-format

elm-format --yes src

1. Download, unzip and move to /usr/local/bin
2. IntelliJ: Setup File Watchers plugin to run when saving files (Tools), https://github.com/avh4/elm-format/blob/master/img/JetBrains%20setup.png


### IntelliJ

1. Elm language plugin
2. File Watchers plugin

## Build and Run

### Build

elm make src/Hello.elm --output target/index.html 

### Run reactor

elm-reactor



