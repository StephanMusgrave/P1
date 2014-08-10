#Cinema booking system
A technical test to develop a system to check booking requests

## Developed by
[Steve Musgrave]

## Technologies used
|Technology                 |Used for                        |
|---------------------------|--------------------------------|
|Ruby 2.1.2                 |Programming language            |
|Rspec                      |Test Driven Development - unit testing  |

## How to run it:

ruby 'lib/process_bookings.rb' 'data/sample_booking_requests'

## Logic:
- Obtain a booking request
-- check that all seats are on the same row
-- check that the number of seats is <= 5
-- check that each seat in the booking is not already taken
-- check that the number of any adjacent seats to the start and end of the proposed booking are != 1 (ie can be 0 or >1)
-- check that the seat number is between 0 and 49
-- check that the row number is betwwen 0 and 99
- if no errors then make the booking

## Project Brief:
A cinema has a theatre of 100 rows, each with 50 seats. Customers request particular seats when making a booking.
Bookings are processed on a first-come, first-served basis. A booking is accepted as long as it is for five or fewer
seats, all seats are adjacent and on the same row, all requested seats are available, and accepting the booking would
not leave a single-seat gap (since the cinema believes nobody would book such a seat, and so loses the cinema money).

Write a system to process a text file of bookings (booking_requests) and determine the number of bookings which are
rejected. To test your system, a smaller sample file (sample_booking_requests) is supplied; processing this file should
yield 11 rejected requests.

The text file of bookings contains one booking per line, where a booking is of the following form:
  (<id>,<index of first seat row>:<index of first seat within row>,<index of last seat row>:<index of last seat within row>),
Rows and seats are both 0-indexed. Note the trailing comma is absent on the final line.

You should treat this as an opportunity to demonstrate your coding style. Solutions should ideally be written in Java
or C#, but solutions in Ruby, JavaScript and Scala are also acceptable. Please discuss with Softwire before using any
other language.



[Steve Musgrave]:https://github.com/StephanMusgrave


