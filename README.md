This project contains step definitions that can be used to spawn a Vim instance
and control it through code. The actual work is done by the
[vimrunner gem](https://github.com/AndrewRadev/vimrunner).

Here's an example feature from my plugin
[splitjoin](https://github.com/AndrewRadev/splitjoin.vim):

    Feature: CSS support

      Scenario: Splitting single-line style definitions
        Given Vim is running
        And the splitjoin plugin is loaded
        And I'm editing a file named "example.css" with the following contents:
          """
          h2 { font-size: 18px; font-weight: bold }
          """
        And the cursor is positioned on "h2"
        And "expandtab" is set
        And "shiftwidth" is set to "2"
        When I split the line
        And I save
        Then the file "example.css" should contain the following text:
          """
          h2 {
            font-size: 18px;
            font-weight: bold;
          }
          """

It's a bit verbose, but it's work in progress.

For now, there are only a few steps in `lib/cucumber/vimscript.rb`. I'll add
more and organize them as I attempt to use this project for testing some of my
own scripts. Any contributions are more than welcome, though.
