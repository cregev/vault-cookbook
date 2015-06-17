#
# Cookbook Name:: vault
# Recipe:: default
#
# Copyright 2015, Totango
#
# All rights reserved - Do Not Redistribute
include_recipe "vault::service"
include_recipe "vault::install"

