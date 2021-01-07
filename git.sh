#!/usr/bin/env bash

function f() {
  git fetch ${1} ${2}
}

function p () {
  git cherry-pick ${1}
}

function pc() {
  git add . && git cherry-pick --continue
}

function pa() {
  git add . && git cherry-pick --abort
}

function cm () {
  translate
  git add . && git commit --message $msg --author "Alexandre Rangel <mamutal91@gmail.com>"
}

function c () {
  git add . && git commit --author "${1}"
}

function amend () {
  git add . && git commit --amend
}

function tree () {
  rm -rf device/motorola vendor/motorola kernel/motorola
  git clone https://github.com/PotterLab/lineage_device_motorola_potter -b lineage-18.1 device/motorola/potter
  git clone https://github.com/PotterLab/vendor_motorola_potter -b eleven vendor/motorola/potter
  git clone https://github.com/PixelExperience-devices/kernel_motorola_potter -b eleven kernel/motorola/potter
}

function push () {
  if [[ "${3}" = true ]];
  then
    FORCE="&& git push -f"
  fi
  echo "Pushing github.com/PoisonProject/${1} - ${2}"
  git push ssh://git@github.com/PoisonProject/${1} HEAD:refs/heads/${2} ${3}
}

function clone () {
  echo "Cloning github.com/PoisonProject/${1} - ${2}"
  git clone ssh://git@github.com/PoisonProject/${1} -b ${2}
}

function los () {
  echo "Cloning github.com/LineageOS/android_${1} - ${2}"
  rm -rf ${1} && git clone https://github.com/LineageOS/android_${1} -b ${2} ${1} && cd ${1}
}
