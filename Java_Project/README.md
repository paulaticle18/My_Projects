The Person class is an abstract class that represents a person with a name. It serves as a base class for the Client and Medic classes, allowing them to inherit the name field and access it through the getName() method.

The Client class represents a client of the medical office. It extends the Person class and adds an additional field for the client's address. The Client class provides a constructor to initialize the name and address, as well as a getter method to retrieve the address.

The Medic class also extends the Person class and represents a medical professional or medic. It implements the Schedulable interface, indicating that it can be scheduled for appointments. The Medic class has a specialty field and provides a getter method to retrieve the specialty. It also implements the getSchedule() method from the Schedulable interface, which returns the fixed schedule of "9:00 AM to 5:00 PM".

The Schedulable interface defines a contract for classes that can be scheduled. It declares the getSchedule() method, which must be implemented by classes that implement the interface. It also provides a default implementation of the notifyAppointment() method, which prints a notification message.

The Appointment class represents an appointment between a client and a medic. It has fields for the client, medic, and appointment status. The constructor of the Appointment class throws a custom ScheduleConflictException if the medic's schedule is not compatible. It provides getter and setter methods for the fields.

The MedicalOfficeService class is the core of the medical office management system. It manages the clients, medics, and appointments. It maintains a list of clients, a map of medics, and a map of appointments. It provides methods to add clients and medics, schedule appointments, retrieve client appointments, and retrieve a medic by name.

Overall, this project aims to provide a system for managing clients, medics, and appointments in a medical office. It allows adding clients and medics, scheduling appointments, and retrieving appointment information. The classes and interfaces are designed to work together to provide a cohesive and structured solution for medical office management
