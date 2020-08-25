CREATE TABLE IF NOT EXISTS base_table(
	Year INT NOT NULL,
	Month VARCHAR(30),
	State VARCHAR(30),
	County VARCHAR(50),
	Unemployment_Rate decimal(5,3));
ALTER TABLE base_table ADD id_unemployment SERIAL;
ALTER TABLE base_table ADD PRIMARY KEY (id_unemployment);


CREATE TABLE IF NOT EXISTS NY(
	Month VARCHAR(30),
	County VARCHAR(50),
	Unemployment_Rate numeric,
	Year INT NOT NULL,
	State VARCHAR(30));
	insert into ny (id_ny)
	select id_unemployment
    from base_table
    where State = 'ny';
	ALTER TABLE ny ADD foreign key (id_ny) references base_table(id_unemployment);
	
CREATE TABLE IF NOT EXISTS FL(
	Month VARCHAR(30),
	County VARCHAR(50),
	Unemployment_Rate numeric,
	Year INT NOT NULL,
	State VARCHAR(30));
	ALTER TABLE fl ADD id_fl SERIAL;
	insert into fl (id_fl)
	select id_unemployment
    from base_table
    where State = 'fl';
	ALTER TABLE fl ADD foreign key (id_fl) references base_table(id_unemployment);
	
CREATE TABLE IF NOT EXISTS CA(
	Month VARCHAR(30),
	County VARCHAR(50),
	Year INT,
	Unemployment_Rate numeric,
	State VARCHAR(30));
	ALTER TABLE CA ADD id_cali SERIAL;
	insert into ca (id_cali)
	select id_unemployment
    from base_table
    where State = 'CA';
	ALTER TABLE ca ADD foreign key (id_cali) references base_table(id_unemployment);
	