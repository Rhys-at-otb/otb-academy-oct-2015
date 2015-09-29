class Alarm
  
  def initialize(sensor, notifier)
        @sensor = sensor
    @notifier = notifier
  end

  def check
        pressure = @sensor.sample_pressure
        if pressure < 17.5 || pressure > 21
      @notifier.out_of_bounds
        end
    @notifier.normal_range
  end
end
