#!/bin/sh

pip install ghp-import
ghp-import -n -m "Updated docs" -p -b gh-pages docs
