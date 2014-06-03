class PunchcardGenerator
  attr_accessor :data
  def initialize(data)
    @data = data
  end

  def generate
    builder.to_xml
  end

  def builder
    Nokogiri::XML::Builder.new do |xml|
      xml.svg(xmlns: 'http://www.w3.org/2000/svg', width: 920, height: 520, class: 'viz') do
        generate_days(xml)
        generate_legend(xml)
      end
    end
  end

  def generate_days(xml)
    xml.g(transform: 'translate(0,0)') do
      (0..6).map do |day|
        xml.g(class: 'day', transform: "translate(0, #{9 + day * 67})") do

          xml.line(x1: 0, y1: 60, x2: 920, y2: 60, class: 'axis')
          xml.text_(class: 'label', dy: 30) do
            xml.text(days[day])
          end

          (0..23).map do |hour|
            xml.g(class: 'hour', transform: "translate(#{104 + hour * 34}, 0)", width: 31) do
              xml.line(x1: 0, y1: "#{hour.even? ? 45 : 50}", x2: 0, y2: 60, class: "axis #{hour.even? ? 'even' : 'odd'}")
              value = data[day][hour].to_f || 0.0
              r = radius * Math.sqrt(value / maximum)
              xml.circle(r: r, cy: 25, class: 'day')
            end
          end
        end
      end
    end
  end

  def generate_legend(xml)
    xml.g(transform: 'translate(0,0)') do
      (0..23).map do |hour|
        xml.text_('text-anchor' => 'middle', transform: "translate(#{104 + hour * 34}, 500)", class: 'label') do
          xml.text(hour)
        end
      end
    end
  end

  private

  def days
    ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']
  end

  def maximum
    @maximum ||= data.values.map(&:values).flatten.max
  end

  def radius
    15.5
  end
end
