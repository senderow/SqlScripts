/* 
NULL == NULL is always false

Always write your filters / statements in terms of a search predicate, 
ie columnName == something, not F(columnName) == true
This will allow SQL to optimize the query more efficiently

Always use () for AND and ORs as the Order of Operations favors AND

SQL does not short circuit evaluate.  It will optimize any way it feels like,
and that may include ignoring your short circuit evaluation.

By default, dates should be expressed as 
20120125 though different countries have diff conventions

