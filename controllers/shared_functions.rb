# Defines what to sort on when sorting tvs to go into indexes and drop downs
# Save a lot of code looking very ugly in controllers and indexes... :)
def tv_sort_criteria( tv1, tv2 )
  [ tv1.manufacturer.name, tv2.model_no, tv2.retail_price ] <=> [ tv2.manufacturer.name, tv1.model_no, tv2.retail_price ]
end
