import java.util.*;

class Appointment {
    private Client client;
    private Medic medic;
    private AppointmentStatus status;

    public Appointment(Client client, Medic medic) throws ScheduleConflictException {
        if (!medic.getSchedule().equals("9:00 AM to 5:00 PM")) {
            throw new ScheduleConflictException("Medic is not available at this time.");
        }
        this.client = client;
        this.medic = medic;
        this.status = AppointmentStatus.SCHEDULED;
    }

    public Client getClient() {
        return client;
    }

    public Medic getMedic() {
        return medic;
    }

    public AppointmentStatus getStatus() {
        return status;
    }

    public void setStatus(AppointmentStatus status) {
        this.status = status;
    }
}

// Custom Exception
class ScheduleConflictException extends Exception {
    public ScheduleConflictException(String message) {
        super(message);
    }
}






