#!/bin/bash

# Make sure you have the latest version of the repo
echo
git pull
echo

# Ask the user for login details
read -p 'Git repository url: ' https://github.com/DiegelD/SelfDrivingCar_Eng
read -p 'Git Username: ' DiegelD
read -p 'Git email: ' daniel.diegel@outlook.de

echo
echo Thank you DiegelD, we now have your credentials
echo for upstream https://github.com/DiegelD/SelfDrivingCar_Eng You must supply your password for each push.
echo

echo setting up git

git config --global user.name DiegelD
git config --global user.email daniel.diegel@outlook.de
git remote set-url origin https://github.com/DiegelD/SelfDrivingCar_Eng
echo

echo Please verify remote:
git remote -v
echo

echo Please verify your credentials:
echo username: `git config user.name`
echo email: `git config user.email`