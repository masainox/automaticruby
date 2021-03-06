# -*- coding: utf-8 -*-
# Name::      Automatic::Plugin::CustomFeed::SVNFLog
# Author::    kzgs
# Created::   Mar 1, 2012
# Updated::   Mar 1, 2012
# Copyright:: kzgs Copyright (c) 2012
# License::   Licensed under the GNU GENERAL PUBLIC LICENSE, Version 3.0.

require File.expand_path(File.dirname(__FILE__) + '../../../spec_helper')

require 'filter/image'

describe Automatic::Plugin::FilterImage do
  context "with description with image tag" do
    subject {
      Automatic::Plugin::FilterImage.new({},
        AutomaticSpec.generate_pipeline {
          feed {
            item "http://tumblr.com", "",
            "<img src=\"http://27.media.tumblr.com/tumblr_lzrubkfPlt1qb8vzto1_500.png\">"
          }})}

    describe "#run" do
      its(:run) { should have(1).feeds }

      specify {
        subject.run
        subject.instance_variable_get(:@pipeline)[0].items[0].link.
        should == "http://27.media.tumblr.com/tumblr_lzrubkfPlt1qb8vzto1_500.png"
      }
    end
  end
end

describe Automatic::Plugin::FilterImage do
  context "with description with image tag" do
    subject {
      Automatic::Plugin::FilterImage.new({},
        AutomaticSpec.generate_pipeline {
          feed {
            item "http://tumblr.com", "",
            "<img src=\"http://24.media.tumblr.com/tumblr_m07wttnIdy1qzoj1jo1_400.jpg\">"
          }})}

    describe "#run" do
      its(:run) { should have(1).feeds }

      specify {
        subject.run
        subject.instance_variable_get(:@pipeline)[0].items[0].link.
        should == "http://24.media.tumblr.com/tumblr_m07wttnIdy1qzoj1jo1_400.jpg"
      }
    end
  end
end
