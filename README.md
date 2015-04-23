# React + CoffeeScript Study

WEB+DB Press vol.86 p123~ のnaoya氏のReact記事をcoffeeでやってみる


## Install Dependencies

    % npm i
    % npm i grunt-cli -g


## Build
gruntでcjsx(coffee内にjsxが書ける)をビルドする

### Development

    % npm run build
    # or
    % grunt

### Production

    % NODE_ENV=production npm run build
    # or
    % NODE_ENV=production grunt
