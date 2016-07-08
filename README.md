# Submodules buildpack

Install submodules when deploying through the Heroku API (eg, with GitHub Sync).

## Why

Heroku will automatically fetch submodules when deploying your app with a GIT push.  
However, deploying it through the API (which is used by GitHub Sync) will not do so as it doesn't get your git repository data.

This buildpack will parse your `.gitmodules` file for all submodules and install all of them during your build.

## Installation

> heroku buildpacks:add https://github.com/dmathieu/heroku-buildpack-submodules

Enjoy!
