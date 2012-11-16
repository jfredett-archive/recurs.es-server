#
# Cookbook Name:: haskell
# Recipe:: default
#
# Copyright 2012, Joe Fredette
#
# All rights reserved - Do Not Redistribute
#

package 'ghc'
package 'cabal-install'

cabal_update as: 'root'
