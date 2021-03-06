class School
  attr_reader :start_time,
              :hours_in_school_day,
              :student_names
  def initialize(start_time, hours_in_school_day)
    @start_time          = start_time
    @hours_in_school_day = hours_in_school_day
    @student_names       = []
  end

  def add_student_name(name)
    @student_names << name
  end

  def military_time
    start_time[0].to_i + hours_in_school_day
  end

  def end_time
    military_time.to_s + ":00"
  end

  def is_full_time?
    if @hours_in_school_day >= 4
      true
    else
      false
    end
  end

  def standard_student_names
    student_names.map do |name|
      name.capitalize
    end
  end

  def clock_time
    if military_time >= 13
      military_time - 12
    else
      end_time
    end
  end

  def ante_meridiem
    if military_time >= 12
      convert_end_time_to_clock_time + " PM"
    else
      convert_end_time_to_clock_time + " AM"
    end
  end

  def convert_end_time_to_clock_time
    if military_time > 12
      clock_time.to_s + ":00"
    else
      clock_time
    end
  end
end
