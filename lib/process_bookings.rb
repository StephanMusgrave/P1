require_relative 'cinema'
require_relative 'booking_request'

file_name = ARGV[0]

def check_row(row)
  result = row <= 99 ? true : false
  result
end

def check_seat(seat)
  result = seat <= 49 ? true :false
  result
end

def check_block_size(startseat,endseat)
  result = ((endseat-startseat+1) <= 5 && (endseat-startseat+1) >=1) ? true : false
end

def check_available(booking,cinema)
  available = true
  seat = booking.startseat
  while seat <= booking.endseat
    available = (available && (cinema.auditorium[booking.startrow][seat] == 0))
    seat = seat + 1
  end
  available
end

def check_singleton(booking,cinema)
  # Method to check if the requested booking would result in a sinle empty seat at either end of the block
  startseat = booking.startseat
  endseat = booking.endseat
  singleton_any    = false
  singleton_before = false
  singleton_after  = false
  singleton_before = true if  ((cinema.auditorium[booking.startrow][startseat-1] == 0) && 
                              ((cinema.auditorium[booking.startrow][startseat-2] == 1) || (startseat - 2 < 0)))
  singleton_after  = true if  ((cinema.auditorium[booking.startrow][endseat+1] == 0) && 
                              ((cinema.auditorium[booking.startrow][endseat+2] == 1) || (endseat + 2 > 49)))
  singleton_before = false if startseat == 0
  singleton_after  = false if endseat == 49
  singleton_any    = true  if ((singleton_before == true) || (singleton_after == true))
  singleton_any
end

def check_booking(booking,cinema)
  # Method to check a) if the request is valid, b) if the seats are available in the cinema
  #  and c) if the booking would result in a singleton
  validity = (  check_row(booking.startrow) &&
                check_seat(booking.endseat) && 
                check_block_size(booking.startseat,booking.endseat) &&
                (booking.startrow == booking.endrow)
              )
  availability = check_available(booking,cinema) && (!check_singleton(booking,cinema))
  status = validity && availability 
  status
end

def get_bookings(filename)
  require 'csv'
  booking_table =[]
    CSV.open(filename, 'r').each do |booking|
      id        = booking[0].gsub("(","").to_i
      startrow  = booking[1].gsub(/\:\d+/,"").to_i
      startseat = booking[1].gsub(/\d+:/,"").to_i
      endrow    = booking[2].gsub(/\:\d+/,"").to_i
      endseat   = booking[2].gsub(/\d+:/,"").to_i
      booking   = BookingRequest.new(id,startrow,startseat,endrow,endseat)
      booking_table << booking.booking_request
    end
  booking_table
end

def make_booking(booking,cinema)
  seat = booking.startseat
  while seat <= booking.endseat
    cinema.auditorium[booking.startrow][seat] = 1
    seat = seat + 1
  end
end

def process_bookings(file,cinema)
  booking_request_list = get_bookings(file)
  valid_booking_count = 0
  invalid_booking_count = 0
  puts;puts "------------------------------------------------------";puts

  booking_request_list.each { | request |
                              booking = BookingRequest.new(request[0],request[1],request[2],request[3],request[4])
                              if check_booking(booking,cinema) 
                                valid_booking_count += 1
                                make_booking(booking,cinema)
                              else
                                invalid_booking_count += 1
                                print  "Your booking Id Number: #{booking.id} has not been accepted ","\n"
                              end
                            }
  puts
  puts "A total of #{valid_booking_count} bookings were made successfully and there were #{invalid_booking_count} unsuccessful booking requests in #{file}"                       
  puts;puts "------------------------------------------------------";puts
end

empire = Cinema.new(100,50)
file = file_name || "data/sample_booking_requests"
process_bookings(file,empire)
# uncomment the following line to allow a screen display of the cinema with empty and booked seats
# display_cinema(empire)

