## Installation

### Elm

* https://guide.elm-lang.org/get_started.html

### Auto build

__NOTE:__ When installing and building the application, the following folders are generated. They can be removed to fix various problems or if you only want to start from scratch.

* node_modules (package.json)
* elm-stuff
* public

#### Elm live

* https://github.com/tomekwi/elm-live
* https://www.npmjs.com/package/elm-live
* sudo npm install --save-dev elm elm-live

#### npm global install

* elm-live
* elm-test

#### Chokidar (used to live update CSS)

* https://maximilianhoffmann.com/posts/how-to-compile-elm-files-on-save
* https://www.npmjs.com/package/chokidar-cli
* sudo npm install chokidar-cli --save-dev

### Code format

https://github.com/avh4/elm-format

1. Download, unzip and move to /usr/local/bin
1. IntelliJ: Setup File Watchers plugin to run when saving files (Tools), https://github.com/avh4/elm-format/blob/master/img/JetBrains%20setup.png
1. Manually run: elm-format --yes src 

### Visual Studio Code

#### Plugins for Elm
* elm - Helps with type annotations
* elm-format - Requires Node v6 (2017.10.01)

#### Recommended plugins (not necessarily related to Elm)
* HTML Snippets
* JavaScript (ES6) code snippets
* Node Exec
* Trailing Semicolon

### IntelliJ

#### Code format
A. Using Tools/External Tools
1. elm-format (see above)
1. Setup external tools and keymap, see https://github.com/durkiewicz/elm-plugin/issues/9

OR

B. Using File Watchers
1. Elm language plugin
1. File Watchers plugin

#### Live reload
1. Live reload with Chrome: Install plugin Live Edit on Intellij and Jetbrains extension on Chrome
See below for more information.

### Maybe fix permissions on the Mac

https://docs.npmjs.com/getting-started/fixing-npm-permissions

## Build and Run

### Build

* elm make src/Hello.elm --output target/index.html 
* Also, see package.json for more options.

### Run reactor

elm-reactor


### To read

* Elm Live: https://github.com/tomekwi/elm-live


### CSS

* http://faq.elm-community.org/#how-can-i-load-css-or-other-resources-in-elm-reactor
* Sass->CSS: node-sass: https://www.npmjs.com/package/node-sass
* https://medium.com/@brianhan/watch-compile-your-sass-with-npm-9ba2b878415b#.1q3vnihlb
* autoprefixer: https://github.com/postcss/autoprefixer
* Minify: cssmin
* Watch both Elm and sass with Chokidar

## NPM

* https://www.keithcirkel.co.uk/how-to-use-npm-as-a-build-tool/

### Live reload
1. Jetbrains Chrome extension and IntelliJ plugin.
1. http://livereload.com/
1. https://www.npmjs.com/package/livereload
1. https://www.npmjs.com/package/live-reload

## Troubles
1. Elm: Delete elm-stuff/ or just elm-stuff/build-artifacts/ and maybe also public/.
1. Node: Delete node_modules/
 