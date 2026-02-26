module birb_parser

using CSV

function main()
    inFile = "./resources/master_ioc_list_v15.1 - Master.csv"
    lines = CSV.File(inFile)

    for row in lines
        println(row)
    end

end

export main

end # module birb_parser
