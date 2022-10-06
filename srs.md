# FixMe by Skitle – Software Requirements Specification

## 1. Introduction

### 1.1 Purpose

Main purpose of the following document is to build an online system that manages requests for 
public in-house services. Objective of this management is to ease communication between clients
and specialists.

### 1.2 Document Conventions

None so far

### 1.3 Inteded Audience and Reading Suggestions

This project is a prototype for the final product and it is restricted within the HSE University
premises. This has been implemented under the guidance of University professors. This document is
useful to abovementioned professors, system developers and product managers.

### 1.4 Project Scope

The purpose of the system is to ease the communication between clients (users that request some 
kind of service) and specialists (users that provide some kind of service). Clients will be able
to post requests for services (by specifying service type, location, time boundaries etc.) and 
Specialists will be able to 'post' their services (with provided tags, ratings etc.) into the 
system. System then automatically matches requested services to the specialists and provides
nearly fully-automatic matchmaking system for it's users. 

Over time, accumulated ratings will allow system to be more accurate in achieving fair matchmaking 
(by correctly matching high rating specialists with high rated customers). Supposedly, this will 
increase the overall quality of provided services.

## 2. Overall Description

### 2.1 Product Perspective

Service stores the following information over time:

- Personal User data
  - Customer – Data includes Name, Surname, Address, History of orders (and their ratings), Payment Credentials
  - Specialist – Data includes Name, Surname, Payment Credentials, Specialization Info, History of orders (and their ratings)
- Global service requests and offers which are constantly being matched with each other
- Analytics information about the ecosystem – Statistics of provided services, prices, etc

### 2.2 Product Features

Major Features of the system are:

1. Client-side (product-wise) Service Request – Clients should be able to request service with following properties.
   1. Name/Type of the Service
   2. Price Range (if market-available)
   3. Time Range
2. Specialist-side (product-wise) Service Offer – Specialists should be able to offer services to the users indirectly, through the system.
   Offers have following properties:
   1. Name/Type of the Service
   2. Price Range (if market-available)
   3. Available Time Range
3. Client- and Specialist- sides Rating – Both sides should be able to rate overall Quality of Service through following properties:
   1. Quality of the provided service from both sides.
   2. Overall communication quality from both sides
   3. Time estimation accuracy from both sides.
4. Ecosystem Analytics and Statistics – Both sides should be able to see the State of the Ecosystem in terms
   of prices, time-estimations, ratings etc. This leads to better service quality (by accurately managing expectations).

### 2.3 User Class and Characteristics

Client-side flow:

1. Request a service of provided type, price range, location and time boundary
2. Get automatically matched with the Specialist that provides services with provided boundaries
3. Await Specialist at specified time and location
4. Receive a service from the Specialist
5. Pay for the provided service
6. Rate the Specialist and the service

Client should also be able to:
- Cancel a service request both before and after being matched with the Specialist

Specialist-side flow:

1. Offer a service of provided type, price range, location and time boundary
2. Get automatically matched with the Client that requested the offered service
3. Navigate to the specified location at the specified time
4. Provide a service
5. Get paid for the provided service (without the inclusion of a FixMe fee)
6. Rate the Client and the service

Specialist shoud also be able to:
- Cancel a service provision both before and after being matched with the Client

NOTE: Service request/offer cancellation is not required to be free for the client or the specialist
as this may lead to systematic abuses from the users. Some kind of deposit should be provided from 
both sides and may be withheld in case of cancellation.

### 2.4 Operating Environments

Both sides use mobile applications to interact with the system. Mobile applications communicate
with the server-side backend that provides most of the business processes such as matchmaking, ratings,
etc. 

### 2.5 Design and Implementation Constraints

1. Sensitive User data should be stored securely and according to the local laws
2. System should provide guarantess in terms of reliability of the services provided. In general,
   no data should be lost in case of malfunctions. Specific SLAs should be calculated later in the 
   development process and agreed upon with the stakeholders.

