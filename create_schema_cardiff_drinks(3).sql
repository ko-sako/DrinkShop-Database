DROP TABLE IF EXISTS online_activity;

CREATE TABLE online_activity (
	activity_id int NOT NULL AUTO_INCREMENT,
	client_id int,
	activity_date timestamp,
	platform varchar(50),
	CONSTRAINT online_activity_PK PRIMARY KEY (activity_id),
	CONSTRAINT FK_online_activity_clients FOREIGN KEY (client_id) REFERENCES clients(client_id)  -- PK and FK must be of the same data type and of the same size!
);

DROP TABLE IF EXISTS regions;
CREATE TABLE regions (
	region_id int NOT NULL AUTO_INCREMENT,
	name varchar(50),
	CONSTRAINT regions_PK PRIMARY KEY (region_id)
);


DROP TABLE IF EXISTS placed_orders;
CREATE TABLE placed_orders (
	order_id int NOT NULL AUTO_INCREMENT,
	client_id int,
	order_date timestamp,
	soda_qty int,
	wine_qty int,
	juice_qty int,
	total int,
	soda_gbp decimal(10,2),
	wine_gbp decimal(10,2),
	juice_gbp decimal(10,2),
	total_gbp decimal(10,2),
	CONSTRAINT placed_orders_PK PRIMARY KEY (order_id),
	CONSTRAINT FK_placed_orders_clients FOREIGN KEY (client_id) REFERENCES clients(client_id)  -- note change in FK constraint to avoid overlap
);


DROP TABLE IF EXISTS salespersons;
CREATE TABLE salespersons (
	salesperson_id int NOT NULL AUTO_INCREMENT,
	name varchar(75),
	region_id int,
	CONSTRAINT salespersons_PK PRIMARY KEY (salesperson_id),
	CONSTRAINT FK_regions FOREIGN KEY (region_id) REFERENCES regions(region_id)  -- PK and FK must be of the same data type and of the same size!
);

