class Medic extends Person implements Schedulable {
    private String specialty;

    public Medic(String name, String specialty) {
        super(name);
        this.specialty = specialty;
    }

    public String getSpecialty() {
        return specialty;
    }

    public String getSchedule() {
        return "9:00 AM to 5:00 PM";
    }
}
