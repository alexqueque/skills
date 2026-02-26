#### **Vision and Scope Document**

#### **1. Business Requirements**

#### **1.1 Background**

Employees at the company Process Impact presently spend an average of 65 minutes per day going to the cafeteria to select, purchase, and eat lunch. About 20 minutes of this time is spent walking to and from the cafeteria, selecting their meals, and paying by cash or credit card. When employees go out for lunch, they spend an average of 90 minutes off-site. Some employees phone the cafeteria in advance to order a meal to be ready for them to pick up. Employees don't always get the selections they want because the cafeteria runs out of certain items. The cafeteria wastes a significant quantity of food that is not purchased and must be thrown away. These same issues apply to breakfast and supper, although far fewer employees use the cafeteria for those meals than for lunch.

#### **1.2 Business Opportunity**

Many employees have requested a system that would permit a cafeteria user to order meals (defined as a set of one or more food items selected from the cafeteria menu) online, to be picked up at the cafeteria or delivered to a company location at a specified time and date. Such a system would save employees time, and it would increase their chance of getting the items they prefer. Knowing what food items customers want in advance would reduce waste in the cafeteria and would improve the efficiency of cafeteria staff. The future ability for employees to order meals for delivery from local restaurants would make a wide range of choices available to employees and provide the possibility of cost savings through volume discount agreements with the restaurants.

#### **1.3 Business Objectives**

BO-1: Reduce the cost of cafeteria food wastage by 40% within 6 months following initial release. *[This example shows the use of Planguage to precisely state a business objective.]*

Scale: Cost of food thrown away each week by cafeteria staff

Meter: Examination of Cafeteria Inventory System logs

Past: 33% (2013, initial study)

Goal: Less than 20% Stretch: Less than 15%

BO-2: Reduce cafeteria operating costs by 15% within 12 months following initial release.

BO-3: Increase average effective work time by 15 minutes per cafeteria-using employee per day within 6 months following initial release.

#### **1.4 Success Metrics**

SM-1: 75% of employees who used the cafeteria at least 3 times per week during Q3 2013 use the COS at least once a week within 6 months following initial release.

SM-2: The average rating on the quarterly cafeteria satisfaction survey increases by 0.5 on a scale of 1 to 6 from the Q3 2013 rating within 3 months following initial release and by 1.0 within 12 months.

#### **1.5 Vision Statement**

For employees who want to order meals from the company cafeteria or from local restaurants online, the Cafeteria Ordering System is an Internet-based and smartphone-enabled application that will accept individual or group meal orders, process payments, and trigger delivery of the prepared meals to a designated location on the Process Impact campus. Unlike the current telephone and manual ordering processes, employees who use the Cafeteria Ordering System will not have to go to the cafeteria to get their meals, which will save them time and will increase the food choices available to them.

#### **1.6 Business Risks**

- RI-1: The Cafeteria Employees Union might require that their contract be renegotiated to reflect the new employee roles and cafeteria hours of operation. (Probability = 0.6; Impact = 3)
- RI-2: Too few employees might use the system, reducing the return on investment from the system development and the changes in cafeteria operating procedures. (Probability = 0.3; Impact = 9)
- RI-3: Local restaurants might not agree to offer delivery, which would reduce employee satisfaction with the system and possibly their usage of it. (Probability = 0.3; Impact = 3)
- RI-4: Sufficient delivery capacity might not be available, which means that employees might not always receive their meals on time and could not always request delivery for the desired times. (Probability = 0.5; Impact = 6)

#### **1.7 Business Assumptions and Dependencies**

- AS-1: Systems with appropriate user interfaces will be available for cafeteria employees to process the expected volume of meals ordered.
- AS-2: Cafeteria staff and vehicles will be available to deliver all meals for specified delivery time slots within 15 minutes of the requested delivery time.
- DE-1: If a restaurant has its own online ordering system, the Cafeteria Ordering System must be able to communicate with it bidirectionally.

#### **2. Scope and Limitations**

#### **2.1 Major Features**

- FE-1: Order and pay for meals from the cafeteria menu to be picked up or delivered.
- FE-2: Order and pay for meals from local restaurants to be delivered.
- FE-3: Create, view, modify, and cancel meal subscriptions for standing or recurring meal orders, or for daily special meals.
- FE-4: Create, view, modify, delete, and archive cafeteria menus.
- FE-5: View ingredient lists and nutritional information for cafeteria menu items.
- FE-6: Provide system access through corporate intranet, smartphone, tablet, and outside Internet access by authorized employees.

#### **2.2 Scope of Initial and Subsequent Releases**

| Feature                         | Release 1                                                                                                        | Release 2                                | Release 3                                        |
|---------------------------------|------------------------------------------------------------------------------------------------------------------|------------------------------------------|--------------------------------------------------|
| FE-1, Order from cafeteria      | Standard meals from lunch<br>menu only; meal orders for<br>delivery can be paid for by<br>payroll deduction only | Accept credit and debit<br>card payments | Accept meal orders for<br>breakfasts and suppers |
| FE-2, Order from<br>restaurants | Not implemented                                                                                                  | Delivery to campus<br>locations only     | Fully implemented                                |
| FE-3, Meal subscriptions        | Not implemented                                                                                                  | Implemented if time<br>permits           | Fully implemented                                |
| FE-4, Menus                     | Create and view menus                                                                                            | Modify, delete, and archive<br>menus     |                                                  |
| FE-5, Ingredient lists          | Not implemented                                                                                                  | Fully implemented                        |                                                  |
| FE-6, System access             | Intranet and outside<br>Internet access                                                                          | iOS and Android phone<br>and tablet apps | Windows Phone and tablet<br>apps                 |

#### **2.3 Limitations and Exclusions**

LI-1: Some food items that are available from the cafeteria will not be suitable for delivery, so the delivery menus available to patrons of the COS must be a subset of the full cafeteria menus.

LI-2: The COS shall be used only for the cafeteria at the Process Impact campus in Clackamas, Oregon.

#### **3. Business Context**

#### **3.1 Stakeholder Profiles**

| Stakeholder             | Major value                                                                                | Attitudes                                                                                                                                            | Major interests                                                                   | Constraints                                                                              |
|-------------------------|--------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------|------------------------------------------------------------------------------------------|
| Corporate<br>Management | Improved employee<br>productivity; cost<br>savings for cafeteria                           | Strong commitment<br>through release 2;<br>support for release 3<br>contingent on earlier<br>results                                                 | Cost and employee<br>time savings must<br>exceed development<br>and usage costs   | None identified                                                                          |
| Cafeteria Staff         | More efficient use of<br>staff time throughout<br>the day; higher<br>customer satisfaction | Concern about union<br>relationships and<br>possible downsizing;<br>otherwise receptive                                                              | Job preservation                                                                  | Training for staff<br>in Internet usage<br>needed; delivery staff<br>and vehicles needed |
| Patrons                 | Better food selection;<br>time savings;<br>convenience                                     | Strong enthusiasm,<br>but might not use it<br>as much as expected<br>because of social<br>value of eating<br>lunches in cafeteria<br>and restaurants | Simplicity of use;<br>reliability of delivery;<br>availability of food<br>choices | Corporate intranet<br>access, Internet<br>access, or a mobile<br>device is needed        |
| Payroll Department      | No benefit;<br>needs to set up<br>payroll deduction<br>registration scheme                 | Not happy about<br>the software<br>work needed, but<br>recognizes the value<br>to the company and<br>employees                                       | Minimal changes<br>in current payroll<br>applications                             | No resources yet<br>committed to make<br>software changes                                |

| Stakeholder         | Major value                                                            | Attitudes                 | Major interests                                                                                  | Constraints                                                                                 |
|---------------------|------------------------------------------------------------------------|---------------------------|--------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------|
| Restaurant Managers | Increased sales;<br>marketing exposure<br>to generate new<br>customers | Receptive but<br>cautious | Minimal new<br>technology needed;<br>concern about<br>resources and costs<br>of delivering meals | Might not have<br>capacity to handle<br>order levels; might<br>not all have menus<br>online |

#### **3.2 Project Priorities**

| Dimension | Constraint                                                                 | Driver                                                                                                                                                            | Degree of freedom                                                                                                                                              |
|-----------|----------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Features  | All features scheduled for<br>release 1.0 must be fully<br>operational     |                                                                                                                                                                   |                                                                                                                                                                |
| Quality   | 95% of user acceptance tests<br>must pass; all security tests<br>must pass |                                                                                                                                                                   |                                                                                                                                                                |
| Schedule  |                                                                            |                                                                                                                                                                   | Release 1 planned to be<br>available by end of Q1 of<br>next year, release 2 by end of<br>Q2; overrun of up to 2 weeks<br>acceptable without sponsor<br>review |
| Cost      |                                                                            |                                                                                                                                                                   | Budget overrun up to 15%<br>acceptable without sponsor<br>review                                                                                               |
| Staff     |                                                                            | Team size is half-time project<br>manager, half-time BA, 3<br>developers, and 1 tester;<br>additional developer and<br>half-time tester available if<br>necessary |                                                                                                                                                                |

#### **3.3 Deployment Considerations**

The web server software will need to be upgraded to the latest version. Apps will have to be developed for iOS and Android smartphones and tablets as part of the second release, with corresponding apps for Windows Phone and tablets to follow for the third release. Any corresponding infrastructure changes must be in place at the time of the second release. Videos no more than five minutes in length shall be developed to train users in both the Internet-based and app-based versions of COS.
