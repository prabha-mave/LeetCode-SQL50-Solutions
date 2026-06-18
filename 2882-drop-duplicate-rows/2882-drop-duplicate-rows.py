import pandas as pd

def dropDuplicateEmails(customers: pd.DataFrame) -> pd.DataFrame:
    customers.drop_duplicates(subset = 'email', keep = 'first', inplace = True)
    return customers

#Parameter	    -  Brief Definition
#subset         -  Column(s) used to identify duplicates.
#keep	        -  Specifies which duplicate record to keep ('first', 'last', or False).
#inplace	    -  If True, modifies the original DataFrame; if False, returns a new DataFrame.
#ignore_index	-  If True, resets row indexes after removing duplicates; if False keeps    original indexes.