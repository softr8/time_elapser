require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe TimeElapser do

  subject { TimeElapser }

  context 'time elapser initialized without parameters' do
    
    it 'should return the current date if no params are provided' do
      Time.stub(:now).and_return(Time.at(946757701))
      subject.sanitize.to_i.should eq(946757701)
    end

  end

  context 'time elapser initialized without parameters' do

    it 'should return a second cero when second_four' do
      Time.stub(:now).and_return(Time.at(946757704))
      subject.sanitize(5).to_i.should eq(946757700)
    end

  end

end
