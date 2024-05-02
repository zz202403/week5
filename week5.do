qui {
	if 0 { //Background
		1. Intermediate Stata
		2. Practice session of week 1-4 content
		3. Let's create an online module
	}
	if 1 { //Log, Settings, Macros, Workdirectory, Data
		cls
		clear 
		capture log close 
		log using wk5.log, replace 
		local output "/users/d/desktop" 
		global url "https://raw.githubusercontent.com/zz202403/intermediatehw1/main/simulation.do" 
		global table1_fena "https://raw.githubusercontent.com/jhustata/basic/main/table1_fena.ado"
		capture confirm file "`output'"
		if _rc == 0 {
			cd "`output'"
		}
		else {
			noi di "Provide the filepath you wish to direct your output to" _request(output)
			cd "$output"
		}
		do "$url" //data simulation
	}
	if 2 { //Install table1_fena.ado, Output a Table 1
		local num_lines 7
        capture file open myfile using "$table1_fena", read text
        forvalues i = 1/`num_lines' {
            file read myfile line
	        cls
            noi di "`line'"
        }
        file close myfile
		noi di "Use the above syntax to create a Table 1 for your simulated dataset" _request(syntax)
		noi di "Type ds to review the variables available to you in this dataset" _request(syntax)
		noi di "When finished, type the commands pwd and ls to see your outputfiles" _request(syntax)
		noi di "Remember: your syntax should always be preceeded with a command (e.g., table1_fena)" _request(syntax)
		qui do "$table1_fena"  
	}
	log close 
}