public class Main {
    public static void main(String[] args) {
        Client client1 = new Client("John Doe", "123 St, City");
        Medic medic1 = new Medic("Dr. Smith", "Cardiology");

        MedicalOfficeService service = new MedicalOfficeService();
        service.addClient(client1);
        service.addMedic(medic1);

        try {
            service.scheduleAppointment(client1, medic1);
        } catch (ScheduleConflictException e) {
            e.printStackTrace();
        }

        for (Appointment a : service.getClientAppointments(client1)) {
            System.out.println(a.getClient().getName() + " has an appointment with " + a.getMedic().getName());
        }
    }
}