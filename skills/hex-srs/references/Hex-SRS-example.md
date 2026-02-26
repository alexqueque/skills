#### **Software Requirements Specification**

#### **1. Introduction**

#### **1.1 Purpose**
This SRS describes the functional and nonfunctional requirements for software release 1.0 of the Cafeteria Ordering System (COS). This document is intended to be used by the members of the project team who will implement and verify the correct functioning of the system. Unless otherwise noted, all requirements specified here are committed for release 1.0.

#### **1.2 Document Conventions**
No special typographical conventions are used in this SRS.

#### **1.3 Project Scope**
The COS will permit Process Impact employees to order meals from the company cafeteria online to be delivered to specified campus locations. A detailed description is available in the *Cafeteria Ordering System Vision and Scope Document*.

#### **1.4 References**
- 1. Wiegers, Karl. *Cafeteria Ordering System Vision and Scope Document*.
- 2. Beatty, Joy. *Process Impact Intranet Development Standard, Version 1.3*.

#### **2. Overall Description**

#### **2.1 Product Perspective**
The Cafeteria Ordering System is a new software system that replaces the current manual and telephone processes for ordering and picking up meals in the Process Impact cafeteria.

#### **2.2 User Classes and Characteristics**
- **Patron (favored)**: Process Impact employee who wants to order meals.
- **Cafeteria Staff**: Prepare meals and request delivery.
- **Menu Manager**: Establishes and maintains daily menus.
- **Meal Deliverer**: Confirms meal delivery.

#### **2.3 Operating Environment**
- OE-1: Support IE 7-9, Firefox 12-26, Chrome, Safari 4-8.
- OE-2: Red Hat Linux + Apache HTTP Server.
- OE-3: Access via Intranet, VPN, or Mobile apps (Android/iOS).

#### **2.4 Design and Implementation Constraints**
- CO-1: Conform to PI Intranet Development Standard v1.3.
- CO-2: Use Oracle database engine.
- CO-3: HTML 5.0 standard.

#### **2.5 Assumptions and Dependencies**
- AS-1: Cafeteria is open every business day.
- DE-1: Depends on changes in the Payroll System.

#### **3. System Features**

#### **3.1 Order Meals from Cafeteria**
#### **3.1.1 Description**
A Patron can order meals to be delivered or picked up. Priority = High.

#### **3.1.2 Functional Requirements**
- **Order.Place.Register**: COS shall confirm Patron is registered for payroll deduction.
- **Order.Place.Date**: COS shall prompt for meal date.
- **Order.Deliver.Select**: Patron shall specify pickup or delivery.
- **Order.Menu.Available**: Display only items in stock and deliverable.

#### **4. Data Requirements**
#### **4.1 Logical Data Model**
(ERD Diagram reference)

#### **4.2 Data Dictionary**
| Data element | Description | Type | Length |
|--------------|-------------|------|--------|
| meal order number | Unique ID | integer | 7 |
| meal order status | Status string | alphabetic | 16 |

#### **5. External Interface Requirements**
- **5.1 User Interfaces**: Conform to PI Internet UI Standard v2.0.
- **5.2 Software Interfaces**: Interface with Payroll System and Inventory System.

#### **6. Quality Attributes**
- **6.1 Usability**: 95% of new users can order without errors on first try.
- **6.2 Performance**: Support 100 concurrent users; 4s download time.
- **6.3 Security**: Encrypt financial/PII data.
- **6.5 Availability**: 98% uptime between 5:00 AM and midnight.
