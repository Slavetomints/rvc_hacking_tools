# frozen_string_literal: true

require 'colorize'
require_relative 'ascii_art'
require_relative 'lib/cryptography'
require_relative 'lib/enumeration_and_exploitation'
require_relative 'lib/forensics'
require_relative 'lib/log_analysis'
require_relative 'lib/network_traffic_analysis'
require_relative 'lib/open_source_intelligence'
require_relative 'lib/password_cracking'
require_relative 'lib/scanning_and_reconnaissance'
require_relative 'lib/web_application_exploitation'
require_relative 'lib/wireless_acess_exploitation'
require_relative 'lib/special_functions'

def show_title
  puts "\n\n      Welcome to the RVC Hacking Toolbox!".colorize(:green)
  show_ascii_title_image
end

def select_main_mode # rubocop:disable Metrics/MethodLength
  acceptable_inputs = %w[1 2 3 4 5 6 7 8 9 10 quit]
  puts '1 - Open Source Intelligence        6 - Network Traffic Analysis'
  puts '2 - Cryptography                    7 - Scanning & Reconnaissance'
  puts '3 - Password Cracking               8 - Web Application Exploitation'
  puts '4 - Forensics                       9 - Wireless Access Exploitation'
  puts '5 - Log Analysis                    10 - Enumeration & Exploitation'
  puts "'quit' to quit"

  puts("\n\nPlease select your mode: ")
  mode = gets.chomp

  # validation of mode
  acceptable_inputs.each do |input|
    return mode if input == mode
  end

  puts 'Invalid mode selected, please select a new mode'
  select_main_mode
end

def show_title_page # rubocop:disable Metrics/AbcSize,Metrics/CyclomaticComplexity,Metrics/MethodLength
  show_title
  mode = select_main_mode

  case mode
  when '1'
    clear_terminal
    OpenSourceIntelligence.select_mode
  when '2'
    clear_terminal
    Cryptography.select_mode
  when '3'
    clear_terminal
    PasswordCracking.select_mode
  when '4'
    clear_terminal
    Forensics.select_mode
  when '5'
    clear_terminal
    LogAnalysis.select_mode
  when '6'
    clear_terminal
    NetworkTrafficAnalysis.select_mode
  when '7'
    clear_terminal
    ScanningAndReconnaissance.select_mode
  when '8'
    clear_terminal
    WebApplicationExploitation.select_mode
  when '9'
    clear_terminal
    WirelessAccessExploitation.select_mode
  when '10'
    clear_terminal
    EnumerationAndExploitation.select_mode
  when 'quit'
    exit
  else
    puts 'Invalid mode selected, exiting now'
  end
end
