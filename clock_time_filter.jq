def first(g): label $out | g | ., break $out;

first(inputs | if .clock_time!=null then .clock_time else empty end)
