import java.util.*;

class MedicalOfficeService {
    private List<Client> clients = new ArrayList<>();
    private Map<String, Medic> medics = new HashMap<>();
    private Map<String, List<Appointment>> appointments = new LinkedHashMap<>();

    public void addClient(Client client) {
        clients.add(client);
    }

    public void addMedic(Medic medic) {
        medics.put(medic.getName(), medic);
    }

    public void scheduleAppointment(Client client, Medic medic) throws ScheduleConflictException {
        Appointment appointment = new Appointment(client, medic);
        if (!appointments.containsKey(client.getName())) {
            appointments.put(client.getName(), new ArrayList<>());
        }
        appointments.get(client.getName()).add(appointment);
        medic.notifyAppointment();
    }

    public List<Appointment> getClientAppointments(Client client) {
        return appointments.get(client.getName());
    }

    public Medic getMedicByName(String name) {
        return medics.get(name);
    }
}
