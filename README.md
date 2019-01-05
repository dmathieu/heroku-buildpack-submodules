# Submodules buildpack

Install submodules when deploying through the Heroku API (eg, with GitHub Sync).

## Why

Heroku will automatically fetch submodules when deploying your app with a GIT push.  
However, deploying it through the API (which is used by GitHub Sync) will not do so as it doesn't get your git repository data.

This buildpack will parse your `.gitmodules` file for all submodules and install all of them during your build.

## Installation

> heroku buildpacks:add https://github.com/dmathieu/heroku-buildpack-submodules

## Configuration

In your `.gitmodules` file you can specify a branch name or an exact exact revision to check out.

For example to specify a branch:

```
[submodule "path/to/checkout"]
	path = "path/to/checkout"
	url = https://github.com/someuser/somerepo.git
	branch = mybranch
```

To specify an exact revision:

```
[submodule "path/to/checkout"]
	path = "path/to/checkout"
	url = https://github.com/someuser/somerepo.git
	revision = d97f4bf
```

Enjoy!
