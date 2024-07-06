SELECT part, assembly_step FROM parts_assembly
WHERE finish_date IS NULL AND assembly_step IS NOT NULL