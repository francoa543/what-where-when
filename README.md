# what_where_when

A calendar app that's fast and easy to use. 

## Problem Statement

Calendar apps like Outlook and Apple Calendar are tedious to use. I want an app that is simple to use and lets me make events quickly and intuitively. 

I like Outlook and Apple's swiping to view dates, and their online sync is great too. However, the same screen always appears for new event creation, and I think there are lots of unnecessary fields. It's tedious to choose a date and time, and they always have the creation process be the same way. I think a quick "wizard"-like approach would be nice for me.

I also think the view per week or day is nice but it's difficult to view the month at a glance in a way that feels informative. 

## Needs

The app should:
1. Be small in install size
2. Be aesthetically pleasing
3. Be intuitive and satisfying to use
4. Be helpful and guiding during use
5. Be offline-friendly
6. Be minimalistic without noise
7. Create events quickly
8. Store events efficiently
9. Allow for multi-device syncing
10. Enable flexibility and customization
11. Notify the user about their events
12. Be able to export a calendar section to a PDF

## App Flow:
I will use Flutter for this project together with an SQLite database (DB) for data storage. The app will load the DB data into memory as models for easier work, and then it will take new/updated events and insert them back to the DB. 

DB Structure v1:

| Events |
| --- |
| event_title_id |
| date_id |
| start_time (JSON BLOB) |
| end_time (JSON BLOB) |
| location_id (NULL OK) |
| repeat_info (JSON BLOB) (NULL OK) |
| notification_info (JSON BLOB) (NULL OK) |
| icon_id (NULL OK) |

| Event Titles |
| --- |
| title (TEXT) |
| description (TEXT) (NULL OK) |
| abbreviation (TEXT) (NULL OK) |

| Icons |
| --- |
| title (TEXT) |
| icon_type_id |
| icon_data (JSON BLOB) |

| Icon Types |
| --- |
| icon_type (TEXT) |

| Locations |
| --- |
| title (TEXT) |
| address_id |
| description (TEXT) |

| Addresses |
| --- |
| title (TEXT) |
| address (TEXT) |

| Date |
| --- |
| day (INT) |
| month (INT) |
| year (INT) |

## Ideas:
- I think a system to store your titles and get them again for easy access would be nice
- Perhaps an icon system (choose or draw your own) to look at a glance at your calendar
- Template events
- Export as PDF to share

## Plan
1. Create the DB structure
2. Configure app to read and write to DB
3. Create Dart model classes to store data for use
4. Create temporary screens/views for data
5. Create temporary forms to make new events
6. Create a day view
7. Create a calendar view
8. Add quick-create function
9. Add template event function
10. Stylize/optimize views
11. Build app interaction flow (opening, loading, navigation)
12. Optimize for speed and accessibility
13. Implement custom icon function
14. Implement export function
15. Implement online sync (maybe)
16. Deploy app (hopefully!)