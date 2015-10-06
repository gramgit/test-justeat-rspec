# Contents

- Overview
- Folder Structure
- Dependencies
- Execution

### Overview

The Site chosen to run Tests on was the Just-Eat UK site.  Further to this the Test/Demo area of the Just-Eat site was utilised.  The Site seems to display A/B Testing on the Menu Page as the HTML for that page is constantly switching.  This posed an unexpected hinderance on completing the Menu Page.

In addition the Ruby Gem page-object was used to simlify Page Object code.  In hindsite learning a new API is not to be recomended when submitting a Tech Spec !

### Folder Structure

All the Tests and Test framework are located in the ```Automation``` Folder.  This folder contains the 2 folders listed and this README
- ```ruby``` - all the Ruby code needed to execute
- ```selenium``` - the selenium webdriver and chromedriver utilised

Inside the ruby folder there are 2 additional folders. specs contains the executable RSpec files, and page-objects contains the Page Object framework used.

### Dependencies

You will need
- Ruby 2
- ```gem install page-object``` - needed for the PageObject API framework used

### Execution

Start the selenium standalone server found in the ```selenium``` folder.  For Macs a shell script is provided to start this up.  Either load the project up into RubyMine, mark the spec folder as the Test folder and execute from there or navigate to the specs folder and run the command ```rspec example_spec.rb```
