class Client extends Person {
    private String address;

    public Client(String name, String address) {
        super(name);
        this.address = address;
    }

    public String getAddress() {
        return address;
    }
}
