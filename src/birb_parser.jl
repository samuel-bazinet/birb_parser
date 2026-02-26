module birb_parser

using DelimitedFiles

mutable struct Bird
    infraclass::String
    order::String
    family::String
    genus::String
    species::String
    name::String
end


function main()
    inFile = "./resources/master_ioc_list_v15.1 - Master.csv"
    
    lines = readdlm(inFile, ',', String, '\n')
    
    birds = []
    bird = Bird("", "", "", "", "", "")
    println(size(lines, 1))
    for i in 5:size(lines, 1)
        if lines[i, 1] != ""
            bird.infraclass = lines[i, 1]
        elseif lines[i, 3] != ""
            bird.order = lines[i, 3]
        elseif lines[i, 4] != ""
            bird.family = lines[i, 4]
        elseif lines[i, 6] != ""
            bird.genus = lines[i, 6]
        elseif lines[i, 7] != ""
            bird.species = lines[i, 7]
            bird.name = lines[i, 10]
            push!(birds, bird)
            bird = Bird(bird.infraclass, bird.order, bird.family, bird.genus, "", "")
        end
    end

    for b in birds
        println(b)
    end
end

export main

end # module birb_parser
