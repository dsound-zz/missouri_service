class MissouriDatum < ApplicationRecord
end


def doit(file)
    file.size.times { |i| puts file[0..i-1] if file[i] == "\\" }
end 