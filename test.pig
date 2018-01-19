-- Python UDF
-- register './udf/test.py' using org.apache.pig.scripting.jython.JythonScriptEngine as myFuncs;

-- Elephantbird UDF
register ./udf/elephant-bird-core-4.15.jar;
register ./udf/elephant-bird-hadoop-compat-4.15.jar;
register ./udf/elephant-bird-pig-4.15.jar;

-- Java UDF
register ./udf/target/udf-0.0.1-SNAPSHOT.jar;

-- Python UDF Test
-- scientists = LOAD 'names.txt' AS (name: chararray);

-- s_names = FOREACH scientists GENERATE myFuncs.complex(name);
-- DUMP s_names;
-- ILLUSTRATE s_names; 
-- D = FILTER s_names BY myFuncs.len_filter(t);

-- DUMP D;

-- grouped_s = GROUP s_names BY t.num;

-- DUMP grouped_s;

-- Test JSON parsing using Twitter's elephantbird UDF
transactions = LOAD 'xch_staging.log' using com.twitter.elephantbird.pig.load.JsonLoader('-nestedLoad');

sic_transactions = FILTER transactions BY ($0#'type'#'name' == 'SIC_TRANSACTION');

DUMP sic_transactions;

-- Test Java UDF
lc_transactions = FOREACH sic_transactions GENERATE udf.LOWER($0#'type'#'name');

DUMP lc_transactions;