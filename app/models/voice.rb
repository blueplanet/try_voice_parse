class Voice < ApplicationRecord
  after_save :save_to_file

  private

  def save_to_file
    File.open(Rails.root.join('public', "voice_#{self.id}.wav"), 'wb') do |f|
      f.write self.wav
    end
  end
end
