# frozen_string_literal: true

require 'tty-box'
require_relative 'cryptography'

# This class houses the asciii art and displays it for the cryptography methods
class CryptographyAsciiArt < Cryptography
  def initialize(title) # rubocop:disable Metrics/MethodLength
    @title_hash = {
      'a1z26' => '    ___   ________  ___   _____
   /   | <  /__  / |__ \ / ___/
  / /| | / /  / /  __/ // __ \
 / ___ |/ /  / /__/ __// /_/ /
/_/  |_/_/  /____/____/\____/  ',

      'atbash' => '    ___   __  __               __
   /   | / /_/ /_  ____ ______/ /_
  / /| |/ __/ __ \/ __ `/ ___/ __ \
 / ___ / /_/ /_/ / /_/ (__  ) / / /
/_/  |_\__/_.___/\__,_/____/_/ /_/ ',
      'base32' => '    ____                      ________
   / __ )____ _________      |__  /__ \
  / __  / __ `/ ___/ _ \      /_ <__/ /
 / /_/ / /_/ (__  )  __/    ___/ / __/
/_____/\__,_/____/\___/    /____/____/ ',
      'base64' => '    ____                      _____ __ __
   / __ )____ _________      / ___// // /
  / __  / __ `/ ___/ _ \    / __ \/ // /_
 / /_/ / /_/ (__  )  __/   / /_/ /__  __/
/_____/\__,_/____/\___/    \____/  /_/   ',
      'binary' => '    ____  _
   / __ )(_)___  ____ ________  __
  / __  / / __ \/ __ `/ ___/ / / /
 / /_/ / / / / / /_/ / /  / /_/ /
/_____/_/_/ /_/\__,_/_/   \__, /
                         /____/   ',
      'caesar' => '   ______                              _______       __
  / ____/___ ____  _________ ______   / ____(_)___  / /_  ___  _____
 / /   / __ `/ _ \/ ___/ __ `/ ___/  / /   / / __ \/ __ \/ _ \/ ___/
/ /___/ /_/ /  __(__  ) /_/ / /     / /___/ / /_/ / / / /  __/ /
\____/\__,_/\___/____/\__,_/_/      \____/_/ .___/_/ /_/\___/_/
                                          /_/                       ',
      'decimal' => '    ____            _                 __
   / __ \___  _____(_)___ ___  ____ _/ /
  / / / / _ \/ ___/ / __ `__ \/ __ `/ /
 / /_/ /  __/ /__/ / / / / / / /_/ / /
/_____/\___/\___/_/_/ /_/ /_/\__,_/_/   ',
      'hexadecimal' => '    __  __                    __          _                 __
   / / / /__  _  ______ _____/ /__  _____(_)___ ___  ____ _/ /
  / /_/ / _ \| |/_/ __ `/ __  / _ \/ ___/ / __ `__ \/ __ `/ /
 / __  /  __/>  </ /_/ / /_/ /  __/ /__/ / / / / / / /_/ / /
/_/ /_/\___/_/|_|\__,_/\__,_/\___/\___/_/_/ /_/ /_/\__,_/_/   ',
      'morse' => '    __  ___                         ______          __
   /  |/  /___  _____________      / ____/___  ____/ /__
  / /|_/ / __ \/ ___/ ___/ _ \    / /   / __ \/ __  / _ \
 / /  / / /_/ / /  (__  )  __/   / /___/ /_/ / /_/ /  __/
/_/  /_/\____/_/  /____/\___/    \____/\____/\__,_/\___/ ',
      'rail_fence' => '    ____        _ __   ______
   / __ \____ _(_) /  / ____/__  ____  ________
  / /_/ / __ `/ / /  / /_  / _ \/ __ \/ ___/ _ \
 / _, _/ /_/ / / /  / __/ /  __/ / / / /__/  __/
/_/ |_|\__,_/_/_/  /_/    \___/_/ /_/\___/\___/ ',
      'rsa' => '    ____  _____ ___          ____                             __  _
   / __ \/ ___//   |        / __ \___  ____________  ______  / /_(_)___  ____
  / /_/ /\__ \/ /| |       / / / / _ \/ ___/ ___/ / / / __ \/ __/ / __ \/ __ \
 / _, _/___/ / ___ |      / /_/ /  __/ /__/ /  / /_/ / /_/ / /_/ / /_/ / / / /
/_/ |_|/____/_/  |_|     /_____/\___/\___/_/   \__, / .___/\__/_/\____/_/ /_/
                                              /____/_/                        ',
      'sha1' => '   _____ __  _____   ___
  / ___// / / /   | <  /
  \__ \/ /_/ / /| | / /
 ___/ / __  / ___ |/ /
/____/_/ /_/_/  |_/_/   ',
      'vigenere' => ' _    ___                  __                 _______       __
| |  / (_)___ ____  ____  _\_\ ________      / ____(_)___  / /_  ___  _____
| | / / / __ `/ _ \/ __ \/ _ \/ ___/ _ \    / /   / / __ \/ __ \/ _ \/ ___/
| |/ / / /_/ /  __/ / / /  __/ /  /  __/   / /___/ / /_/ / / / /  __/ /
|___/_/\__, /\___/_/ /_/\___/_/   \___/    \____/_/ .___/_/ /_/\___/_/
      /____/                                     /_/                       '
    }
    show_title(title)
  end

  def show_title(title)
    clear_terminal
    colored_title = @title_hash[title].lines.map { |line| line.colorize(:red) }.join
    puts TTY::Box.frame(colored_title,
                        title: { top_left: ' RVC Hacking Toolbox - Cryptography'.colorize(:green),
                                 bottom_right: Toolbox.version.colorize(:green) },
                        enable_color: true,
                        style: { border: {
                          fg: :red
                        } })
  end
end
