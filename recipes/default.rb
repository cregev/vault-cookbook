#
# Cookbook Name:: vault
# Recipe:: default
#
# Copyright 2015, Costya.Regev@me.com
#
# All rights reserved - Do Not Redistribute
include_recipe "vault::install"
include_recipe "vault::vault"
include_recipe "vault::service"