module Counter

export create # API
export add_to_file, read_from_file, create_new_invoice_nbr # Infrastructure

include("Domain.jl"); using .Domain
include("API.jl"); using .API
include("Infrastructure.jl"); using .Infrastructure

end
