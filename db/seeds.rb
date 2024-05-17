# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# Seeding some server data.

servers = [
{ ip: "10.0.0.1", region: "US East", name: "Web Server 1", Operational_state: true },
{ ip: "10.0.0.2", region: "US West", name: "Database Server 1", Operational_state: true },
{ ip: "10.0.0.3", region: "EU Central", name: "Application Server 1", Operational_state: false },
{ ip: "10.0.0.4", region: "AP Southeast", name: "Mail Server 1", Operational_state: true },
{ ip: "10.0.0.5", region: "US East", name: "Web Server 2", Operational_state: true },
{ ip: "10.0.0.6", region: "US West", name: "Database Server 2", Operational_state: false },
{ ip: "10.0.0.7", region: "EU Central", name: "Application Server 2", Operational_state: true },
{ ip: "10.0.0.8", region: "AP Southeast", name: "Backup Server 1", Operational_state: true },
{ ip: "10.0.0.9", region: "US East", name: "VPN Server 1", Operational_state: false },
{ ip: "10.0.0.10", region: "US West", name: "File Server 1", Operational_state: true },
{ ip: "10.0.0.11", region: "EU Central", name: "Development Server 1", Operational_state: true },
{ ip: "10.0.0.12", region: "AP Southeast", name: "Monitoring Server 1", Operational_state: false },
{ ip: "10.0.0.13", region: "US East", name: "Web Server 3", Operational_state: true },
{ ip: "10.0.0.14", region: "US West", name: "Cache Server 1", Operational_state: false },
{ ip: "10.0.0.15", region: "EU Central", name: "Production Server 1", Operational_state: true }
]

servers.each do |server_data|
    server = Server.create(server_data)
    if server.errors.any?
        puts "Server creation failed with errors:"
        puts server.errors.full_messages
    end
end


