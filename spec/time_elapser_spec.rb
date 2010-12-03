require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe TimeElapser do

  subject { TimeElapser }

  context 'time elapser initialized without parameters' do
    it 'should return the current date if no params are provided' do
      Time.stub(:now).and_return(Time.at(946757701))
      subject.sanitize.to_i.should eq(946757701)
    end
  end

  context 'time elapser ready for query caching' do
    it 'should return a second cero for the next 5 seconds' do
      [946757700, 946757701, 946757702, 946757703, 946757704].each do |local_time|
        Time.stub(:now).and_return(Time.at(local_time))
        subject.sanitize(5).to_i.should eq(946757700)
      end
    end

    it 'should jump to the next window when it has to' do
      Time.stub(:now).and_return(Time.at(946757705))
      subject.sanitize(5).to_i.should_not eq(946757700)
    end
  end

  context 'time elapser initialized without parameters and rails is used' do
    before(:each) do
      RAILS_ROOT = true
      @time_zone = mock('TimeZone')
    end
    it 'should return the current date if no params are provided' do
      @time_zone.stub(:now).and_return(Time.at(946757701))
      Time.stub(:zone).and_return(@time_zone)
      subject.sanitize.to_i.should eq(946757701)
    end

    it 'should return a second cero for the next 5 seconds' do
      [946757700, 946757701, 946757702, 946757703, 946757704].each do |local_time|
        @time_zone.stub(:now).and_return(Time.at(local_time))
        Time.stub(:zone).and_return(@time_zone)
        subject.sanitize(5).to_i.should eq(946757700)
      end
    end

    it 'should jump to the next window when it has to' do
      @time_zone.stub(:now).and_return(Time.at(946757706))
      Time.stub(:zone).and_return(@time_zone)
      subject.sanitize(5).to_i.should_not eq(946757700)
    end
  end

end
