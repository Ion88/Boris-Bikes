require 'docking_station'

describe DockingStation do
  #it { is_expected.to respond_to :release_bike }
  it 'respond to release_bike' do
    expect(subject).respond_to? :release_bike
  end

  describe '#release_bike' do
    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike}.to raise_error 'No bikes available'
    end
    #Arrange
    it 'releases a bike' do
      bikes = Bike.new
      subject.dock(bikes)
      expect(subject.release_bike).to eq bikes
    end
  end

  it { is_expected.to respond_to(:dock).with(1).argument }
  #it { is_expected.to respond_to(:bike) }

#Arrange
  it 'docks something' do
    bike = Bike.new
    #Act/Assert
    expect(subject.dock(bike)).to eq [bike]
  end

  #it 'returns docked bikes' do
  #  bike = Bike.new
  #  subject.dock(bike)
  #  expect(subject.bike).to eq bike
  #end

  describe '#dock' do
    it 'raises an error when full' do
      subject.capacity.times { subject.dock Bike.new }
      expect { subject.dock Bike.new }.to raise_error 'Docking station full'
    end
  end

  describe DockingStation do
    it 'has a default capacity' do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end
  end
end
