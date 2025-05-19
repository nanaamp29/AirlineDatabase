create database Airport;

use airport;
create table FLIGHT(
	FlightNumber		Int					NOT NULL auto_increment,
    AirplaneID			Int					NOT NULL,
    DepartureLocation	VarChar(100)		NOT NULL,
    DepartureTime		Time				NOT NULL,
    Destination			VarChar(100)		NOT NULL,
    CONSTRAINT			FLIGHT_PK	PRIMARY KEY (FlightNumber)
    );
create table AIRPLANE(
	AirplaneID			Int					NOT NULL auto_increment,
    AirlineID			Int					NOT NULL,
    AircraftType		VarChar(100)		NOT NULL,
    AircraftSize		Int					NOT NULL,
    OperatingStatus		VarChar(100)		NOT NULL,
    CONSTRAINT			AIRPLANE_PK	PRIMARY KEY (AirplaneID)
    );
    
create table TICKET(
	TicketID			Int					NOT NULL auto_increment,
    FlightNumber		Int					NOT NULL,
    CustomerID			Int					NOT NULL,
    Class				VarChar(100)		NOT NULL,
    TripType			VarChar(100)		NOT NULL,
    SeatNumber			int					NOT NULL,
    Paid				VarChar(100)		NOT NULL,
    CONSTRAINT			TICKET_PK	PRIMARY KEY (TicketID)
    );
    
create table AIRLINE(
	AirlineID			Int					NOT NULL auto_increment,
    AirlineName			VarChar(100)		NOT NULL,
    CONSTRAINT			AIRLINE_PK	PRIMARY KEY (AirlineID)
    );
    
create table AIRLINE_AIRPORT(
	AirportID			Int					NOT NULL,
	AirlineID			Int					NOT NULL,
    CONSTRAINT			AIRLINE_AIRPORT_PK	PRIMARY KEY (AirportID, AirlineID)
    );
    
create table CUSTOMER(
	CustomerID			Int					NOT NULL auto_increment,
    FirstName			VarChar(100)		NOT NULL,
    LastName			VarChar(100)		NOT NULL,
    Phone				VarChar(100)		NOT NULL,
    Email				VarChar(100)		NOT NULL,
    CONSTRAINT			CUSTOMER_PK	PRIMARY KEY (CustomerID)
    );
    
create table AIRPORT(
	AirportID			Int					NOT NULL auto_increment,
    AirportName			VarChar(100)		NOT NULL,
    Address				VarChar(100)		NOT NULL,
    Phone				VarChar(100)		NOT NULL,
    CONSTRAINT			AIRPORT_PK	PRIMARY KEY (AirportID)
    );
    
alter table TICKET
add constraint		TICK_CUST_FK	foreign key(CustomerID) references CUSTOMER(CustomerID) 
	on update cascade,
add	constraint		TICK_FLIGHT_FK	foreign key (FlightNumber) references FLIGHT(FlightNumber)
	on update cascade;

alter table FLIGHT
add constraint		FLIGHT_AIRPLANE_FK	foreign key(AirplaneID) references AIRPLANE(AirplaneID) 
	on update cascade;
    
alter table AIRPLANE
add constraint		AIRPLANE_AIRLINE_FK	foreign key(AirlineID) references AIRLINE(AirlineID) 
	on update cascade;

alter table AIRLINE_AIRPORT
add constraint		AIRL_AIRP_AIRLINE_FK	foreign key(AirlineID) references AIRLINE(AirlineID) 
	on update cascade,
add	constraint		AIRL_AIRP_AIRPORT_FK	foreign key (AirportID) references AIRPORT(AirportID)
	on update cascade;
    
    
USE airport;
INSERT INTO AIRLINE (AirlineName) Values('Southwest');
INSERT INTO AIRLINE (AirlineName) Values('United');
INSERT INTO AIRLINE (AirlineName) Values('Delta');
INSERT INTO AIRLINE (AirlineName) Values('Spirit');
INSERT INTO AIRLINE (AirlineName) Values('American');
INSERT INTO AIRLINE (AirlineName) Values('Qatar');
USE airport;
INSERT INTO AIRPLANE (AirlineID, AircraftType, AircraftSize, OperatingStatus) 
Values(6, 'Boeing 737',220, 'Active'),
(5, 'Boeing 777',368, 'Active'),
(2, 'Airbus A320',180, 'Active'),
(1, 'Boeing 707',189, 'Inactive'),
(3, 'Airbus A321',200, 'Active'),
(4, 'Boeing 767',261, 'Active'),
(2, 'Airbus A321',200, 'Inactive');
USE airport;
INSERT INTO CUSTOMER(FirstName,LastName,Phone,Email) 
values('John','Smith','414-509-3433','jsmith446@gmail.com'),
('Owen','Williams','380-359-8833','Owill786@gmail.com'),
('Megan','Johnson','614-789-4533','Mjohnson566@gmail.com'),
('Lisa','Johns','385-669-8673','LJohns786@gmail.com'),
('Joe','Brown','614-369-9373','Jbro126@gmail.com'),
('Thomas','Mcjunior','714-669-9673','TMcj766@gmail.com'),
('Nash','Boaman','813-679-9063','Nboah716@gmail.com'),
('Tyler','Cainner','914-469-3603','TMcj316@gmail.com');
USE airport;
INSERT INTO FLIGHT(AirplaneID,DepartureLocation,DepartureTime,Destination) 
values(7,'Miami','03:15:00','Chicago'),
(3,'Washington','04:05:00','Miami'),
(2,'Seattle','12:30:00','San Francisco'),
(6,'New York','16:00:00','Los Angelos'),
(4,'Toronto','01:45:00','Las Vegas'),
(1,'Chicago','20:15:00','New York');
USE airport;

INSERT INTO AIRPORT(AirportName,Address,Phone)
values('Skyview International Airport','123 Aviation Blvd, New York','212-555-0101'),
('Pacific Gate Airport','456 Ocean Ave, Los Angeles','310-555-0202'),
('Riverfront Regional Airport','789 River Rd, Chicago','312-555-0303'),
('Northland Air Terminal','101 Northern Pkwy, Seattle','206-555-0404'),
('Sunrise Bay Airport','202 Sunrise Blvd, Miami','305-555-0505'),
('Capital View Airport','404 Capitol St, Washington','202-555-0707'),
('Lakeshore International Airport','505 Lakeshore Rd, Toronto,','416-555-0808');
USE airport;

INSERT INTO TICKET(FlightNumber,CustomerID,Class,TripType,SeatNumber,Paid)
values(2,6, 'First','Round Trip',14,'Yes'),
(4,1, 'Business','One Way',67,'Yes'),
(6,7, 'Economy','One Way',101,'No'),
(3,5, 'Economy','Round Trip',99,'Yes'),
(2,2, 'Business','Round Trip',43,'No'),
(5,4, 'First','One Way',21,'No'),
(3,3, 'First','Round Trip',7,'Yes');
USE airport;
INSERT INTO AIRLINE_AIRPORT(AirportID,AirlineID)
values(1,1), (1,2), (1,3), (1,4), (1,5), (1,6),
(2,1), (2,2), (2,3), (2,4), (2,5), (2,6),
(3,1), (3,2), (3,3), (3,4), (3,5), (3,6),
(4,1), (4,2), (4,3), (4,4), (4,5), (4,6),
(5,1), (5,2), (5,3), (5,4), (5,5), (5,6),
(6,1), (6,2), (6,3), (6,4), (6,5), (6,6),
(7,1), (7,2), (7,3), (7,4), (7,5), (7,6);