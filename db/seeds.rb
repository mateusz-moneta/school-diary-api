# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

WorkDay.destroy_all

WorkDay.create!([
    { name: 'Monday', short_name: 'MON' },
    { name: 'Tuesday', short_name: 'TUE' },
    { name: 'Wednesday', short_name: 'WED' },
    { name: 'Thursday', short_name: 'THU' },
    { name: 'Friday', short_name: 'FRI' }
])

p "Created #{WorkDay.count} work days"