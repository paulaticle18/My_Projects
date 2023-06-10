interface Schedulable {
    String getSchedule();
    default void notifyAppointment() {
        System.out.println("You have an appointment.");
    }
}