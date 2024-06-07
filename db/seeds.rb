# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


#Seeding some regions data.

regions = [
{name: "US East"},
{name: "US West"},
{name: "EU Central"},
{name: "AP Southeast"}
]

regions.each do |region_data|
    region = Region.find_or_create_by!(region_data)
    if region.errors.any?
        puts "Region creation failed with errors:"
        puts region.errors.full_messages
    end
end

# Seeding some server data.

servers = [
    { ip: "10.0.0.1", regions_id: "US East", name: "Web Server 1", operational_state: true },
    { ip: "10.0.0.2", regions_id: "US West", name: "Database Server 1", operational_state: true },
    { ip: "10.0.0.3", regions_id: "EU Central", name: "Application Server 1", operational_state: false },
    { ip: "10.0.0.4", regions_id: "AP Southeast", name: "Mail Server 1", operational_state: true },
    { ip: "10.0.0.5", regions_id: "US East", name: "Web Server 2", operational_state: true },
    { ip: "10.0.0.6", regions_id: "US West", name: "Database Server 2", operational_state: false },
    { ip: "10.0.0.7", regions_id: "EU Central", name: "Application Server 2", operational_state: true },
    { ip: "10.0.0.8", regions_id: "AP Southeast", name: "Backup Server 1", operational_state: true },
    { ip: "10.0.0.9", regions_id: "US East", name: "VPN Server 1", operational_state: false },
    { ip: "10.0.0.10", regions_id: "US West", name: "File Server 1", operational_state: true },
    { ip: "10.0.0.11", regions_id: "EU Central", name: "Development Server 1", operational_state: true },
    { ip: "10.0.0.12", regions_id: "AP Southeast", name: "Monitoring Server 1", operational_state: false },
    { ip: "10.0.0.13", regions_id: "US East", name: "Web Server 3", operational_state: true },
    { ip: "10.0.0.14", regions_id: "US West", name: "Cache Server 1", operational_state: false },
    { ip: "10.0.0.15", regions_id: "EU Central", name: "Production Server 1", operational_state: true }
]


servers.each do |server_data|
    server = Server.new(ip: server_data[:ip], name: server_data[:name], operational_state: server_data[:operational_state])
    
    region = Region.find_by(name: server_data[:regions_id])
    if region
        server.region = region
        server.save!
    end 
end