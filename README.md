# Pre-work - *Tipster*

**Tipster** is a tip calculator application for iOS.

Submitted by: **Julian Bossiere**

Time spent: **20** hours spent in total

## User Stories

The following **required** functionality is complete:

* [X] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [X] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [X] UI animations
* [ ] Remembering the bill amount across app restarts (if <10mins)
* [ ] Using locale-specific currency and currency thousands separators.
* [X] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [X] User can split the bill by number of people
- [X] User can choose to include tax in the tip calculation or not. The tax amount used is 9.6%, which is the tax rate in Seattle, WA. If the user chooses not to include tax it calculates the tip amount as (bill / 1.096) * tip

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='http://i.imgur.com/Xl7eOfr.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

The two biggest challenges I faced were figuring out how to get the defaults saved and working, and figuring out how to trigger the tip to recalculate when returning from the settings page.

## License

Copyright [yyyy] [name of copyright owner]

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
