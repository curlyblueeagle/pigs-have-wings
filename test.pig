register './udf/test.py' using org.apache.pig.scripting.jython.JythonScriptEngine as myFuncs;
scientists = LOAD 'names.txt' AS (name: chararray);

s_names = FOREACH scientists GENERATE myFuncs.complex(name);
-- DUMP s_names;
-- ILLUSTRATE s_names; 
-- D = FILTER s_names BY myFuncs.len_filter(t);

-- DUMP D;

grouped_s = GROUP s_names BY t.num;

DUMP grouped_s;