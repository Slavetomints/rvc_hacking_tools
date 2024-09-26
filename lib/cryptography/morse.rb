# frozen_string_literal: true

require 'telegraph'
require_relative 'cryptography'
require_relative 'cryptography_ascii_art'

# This class runs the MorseCode cipher
class MorseCode < Cryptography
  def initialize
    CryptographyAsciiArt.new('morse')
    select_morse_mode
  end

  def select_morse_mode # rubocop:disable Metrics/MethodLength
    prompt = TTY::Prompt.new

    choices = [
      { name: 'Encode', value: 1 },
      { name: 'Decode', value: 2 },
      { name: 'Go to previous menu', value: 'previous' },
      { name: 'Go to Main Menu', value: 'main' },
      { name: 'Quit Program', value: 'quit' }
    ]

    mode = prompt.select('Please select your mode', choices, per_page: 5, cycle: true)

    case mode
    when 1
      CryptographyAsciiArt.new('morse')
      encode_morse_code
    when 2
      CryptographyAsciiArt.new('morse')
      decode_morse_code
    when 'quit'
      clear_terminal
      exit
    when 'main'
      Toolbox.new
    when 'previous'
      Cryptography.new
    end
  end

  def encode_morse_code
    puts 'Please enter your message to be encoded'

    plaintext = gets.chomp

    ciphertext = Telegraph.text_to_morse(plaintext)
    print "\nYour result is: "
    puts ciphertext.colorize(:green)

    quit_or_continue(MorseCode)
  end

  def decode_morse_code
    puts 'Please enter your message to be decoded, seperate letters by spaces and words by 7 spaces'

    ciphertext = gets.chomp

    plaintext = Telegraph.morse_to_text(ciphertext)
    print "\nYour result is: "
    puts plaintext.colorize(:green)

    quit_or_continue(MorseCode)
  end
end
