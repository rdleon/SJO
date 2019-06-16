ALTER TABLE follow_ups RENAME COLUMN finalcial_advance TO financial_advance;
ALTER TABLE follow_ups ADD COLUMN check_date date NOT NULL;
