/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hw6;

import java.util.*;
import java.sql.*;
import java.io.*;
import java.util.Scanner;
/**
 * File to open PostgreSQL database 
 * and get a functioning mimic of a reservation system
 * Created by Kyra Phillips with help from Cooper Stevens
 */
public class HW6 {
    
    static String username, password, Email, firstName, lastName, payerCountry, payerCity, payerState, 
            payerStreetAddress, payerEmail, passFirstName, passLastName, 
            passEmail, passCountry, passCity, passState,
            passStreetAddress, airlineName, airlineCode, airlineCountry, 
            departureDate, arrivalDate, airportName, cityName, stateName, 
            payerFirstName, payerLastName, bookingDate;
    static int countryCode, localCode, localNumber, payerPostalCode, 
            bookingNumber, uniqueFlightNumber, passID, passPostalCode, 
            originCode, destinationCode, length, departureHour, departureMinute,
            arrivalHour, arrivalMin, airportCode, bookingCityCode, 
            numberOfPassengers;
    static Scanner input = new Scanner(System.in);
    static Connection conn = null;
    static ResultSet rs = null;
    static Statement statement = null;
    

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws IOException {
        // TODO code application logic here
        getData();
        insertPayerData();
        insertPassengerData();
        makeReservation();
        getConfirmation();
    }
    
     private static void openConnection() {
        try {
            conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres",
                    username, password);
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println(e.getClass().getName()+": "+e.getMessage());
            System.exit(0);
        }
    }
     
    private static void getData() throws IOException{
     FileWriter fileWriter = new FileWriter("HW6.error", true);
        PrintWriter printWriter = new PrintWriter(fileWriter);
        System.out.println("Before we start, we need your PostgreSQL login information.");
        System.out.print("Username: ");
        username = input.nextLine();
        System.out.print("Password: ");
        password = input.nextLine();
        System.out.println("Welcome to the Flight Reservation System! Let's get your information");
        System.out.print("First name: ");
        payerFirstName = input.nextLine();
        System.out.print("Last name: ");
        payerLastName = input.nextLine();
        System.out.print("Street address (do not include city, state, or zip): ");
        payerStreetAddress = input.nextLine();
        System.out.print("City: ");
        payerCity = input.nextLine();
        System.out.print("State Abbreviation: ");
        payerState = input.nextLine();
        System.out.print("5 digit zip code: ");
        payerPostalCode = Integer.parseInt(input.nextLine());
        int zipLength = Integer.valueOf(payerPostalCode).toString().length();
        if (zipLength != 5) {
            System.out.println("Sorry, that's an invalid zip code. Please restart the program.");
            printWriter.println("Customer " + lastName + ", " + firstName + " had invalid zip code " + payerPostalCode);
            printWriter.close();
            System.exit(0);
        }
        System.out.print("Country: ");
        payerCountry = input.nextLine();
        System.out.print("Phone number information: ");
        System.out.println("Country code:");
        countryCode = Integer.parseInt(input.nextLine());
        System.out.println("Area code:");
        localCode = Integer.parseInt(input.nextLine());
        System.out.println("Local number:");
        localNumber = Integer.parseInt(input.nextLine());
        System.out.print("Email address:");
        Email = input.nextLine();
        if (!(Email.contains("@"))) {
            System.out.println("Sorry, that's not a valid email address. Please restart the program.");
            printWriter.println("Customer " + lastName + ", " + firstName + " had invalid email " + Email);
            printWriter.close();
            System.exit(0);
        }
        System.out.println("Next, please put in passenger information:");
        System.out.print("How many passengers?");
        numberOfPassengers = Integer.parseInt(input.nextLine());
        for (int i = 0; i < numberOfPassengers; i++){
            System.out.print("Passenger First name: ");
            passFirstName = input.nextLine();
            System.out.print("Passenger Last name: ");
            passLastName = input.nextLine();
            System.out.print("Passenger Street address (do not include city, state, or zip): ");
            passStreetAddress = input.nextLine();
            System.out.print("Passenger City: ");
            passCity = input.nextLine();
            System.out.print("Passeneger State Abbreviation: ");
            passState = input.nextLine();
            System.out.print("Passenger 5 digit zip code: ");
            passPostalCode = Integer.parseInt(input.nextLine());
            int passZipLength = Integer.valueOf(passPostalCode).toString().length();
            if (passZipLength != 5) {
                System.out.println("Sorry, that's an invalid zip code. Please restart the program.");
                printWriter.println("Customer " + lastName + ", " + firstName + " had invalid zip code " + passPostalCode);
                printWriter.close();
                System.exit(0);
            }
            System.out.print("Passenger Country: ");
            passCountry = input.nextLine();
            System.out.print("Passenger Phone number information: ");
            System.out.println("Country code:");
            countryCode = Integer.parseInt(input.nextLine());
            System.out.println("Area code:");
            localCode = Integer.parseInt(input.nextLine());
            System.out.println("Local number:");
            localNumber = Integer.parseInt(input.nextLine());
            System.out.print("Passenger Email address:");
            passEmail = input.nextLine();
            if (!(passEmail.contains("@"))) {
                System.out.println("Sorry, that's not a valid email address. Please restart the program.");
                printWriter.println("Customer " + lastName + ", " + firstName + " had invalid email " + Email);
                printWriter.close();
                System.exit(0);
            }
        }
    }
     
    private static void insertPayerData(){
        try {
            openConnection();
            conn.setAutoCommit(false);
            statement = conn.createStatement();
            String insertPayer = "INSERT INTO Payers (Email, firstName, LastName) +"
                    + "VALUES ('"+Email+"', '"+firstName+"', '"+lastName+",)";
            statement.executeUpdate(insertPayer);
            String insertPayerPhone = "INSERT INTO PayerPhoneNumbers "
                    + "(countryCode, localCode, localNumber) +"
                    + "VALUES ('"+countryCode+"', '"+localCode+"', '"+localNumber+",)";
            statement.executeUpdate(insertPayerPhone);
            String insertPayerAddress = "INSERT INTO PayerAddress (payerCountry," +
                    " payerCity, payerState, payerPostalCode, payerStreesAddress) +"
                    + "VALUES ('"+payerCountry+"', '"+payerCity+"', '"+payerState+","
                    + payerPostalCode+"', '"+payerStreetAddress+"',)";
            statement.executeUpdate(insertPayerAddress);
            statement.close();
            conn.commit();
            conn.close();
        }
        catch (SQLException exception){
            System.err.println( exception.getClass().getName()+": "+ exception.getMessage() );
            System.exit(0);
        }
    }
    
    private static void insertPassengerData(){
         try {
            openConnection();
            conn.setAutoCommit(false);
            statement = conn.createStatement();
            String insertPassenger = "INSERT INTO Passenger (passFirstName, "
                    + "passLastName, passEmail) +"
                    + "VALUES ('"+passFirstName+"', '"+passLastName+"', '"+passEmail+",)";
            statement.executeUpdate(insertPassenger);
            String insertPassengerPhone = "INSERT INTO PassengerPhoneNumbers "
                    + "(countryCode, localCode, localNumber) +"
                    + "VALUES ('"+countryCode+"', '"+localCode+"', '"+localNumber+",)";
            statement.executeUpdate(insertPassengerPhone);
            String insertPassengerAddress = "INSERT INTO PassengerAddress (passCountry," +
                    " passCity, passState, passPostalCode, passStreesAddress) +"
                    + "VALUES ('"+passCountry+"', '"+passCity+"', '"+passState+","
                    + passPostalCode+"', '"+passStreetAddress+"',)";
            statement.executeUpdate(insertPassengerAddress);
            statement.close();
            conn.commit();
            conn.close();
        }
        catch (SQLException exception){
            System.err.println( exception.getClass().getName()+": "+ exception.getMessage() );
            System.exit(0);
        }       
    }

    private static void makeReservation(){
     System.out.print("From what city would your flight originate?: ");
        String origin = input.nextLine();
        try {
            openConnection();
            conn.setAutoCommit(false);
            statement = conn.createStatement();
            rs = statement.executeQuery("SELECT * FROM Flights WHERE (originCode = '"+originCode+"')");
            if (!rs.isBeforeFirst()) {
                System.out.println("Sorry, that's not a valid origin city, please restart program.");
                System.exit(0);
            } else {
                System.out.println("Here is a list of flights that originate in " + originCode);
                System.out.println("-------------------------------------------------------------");
            }
            while (rs.next()) {
                String airline = rs.getString("airlineName");
                int flightNumber = rs.getInt("uniqueFlightNumber");
                String originCity = rs.getString("originCode");
                String destinationCity = rs.getString("destinationCode");
                System.out.println(airline + " flight " + flightNumber + " flies from " + originCity + " to " +
                        destinationCity);
            }
            rs.close();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            System.err.println( e.getClass().getName()+": "+ e.getMessage() );
            System.exit(0);
        }
        int counter = 0;
        do {
            System.out.print("Choose a destination city from the above list: ");
            String destCode = input.nextLine();
            try {
                openConnection();
                conn.setAutoCommit(false);
                statement = conn.createStatement();
                rs = statement.executeQuery("SELECT * FROM Flights WHERE (originCode = '" + originCode + "' AND destinationCode = '"
                        + destCode + "')");
                if (!rs.isBeforeFirst()) {
                    System.out.print("Sorry, that's not a valid destination. ");
                    counter++;
                    if (counter == 3) {
                        System.out.println("Maximum attempts reached, goodbye!");
                        rs.close();
                        statement.close();
                        conn.close();
                        System.exit(0);
                    }
                } else {
                    rs.next();
                    int flightNumber = rs.getInt("Flight_number");
                    break;
                }
            } catch (SQLException e) {
                System.err.println(e.getClass().getName() + ": " + e.getMessage());
                System.exit(0);
            }
        } while (counter < 3);
        try {
            rs.close();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
            System.exit(0);
        }
    }
    
    
    private static void getConfirmation() throws IOException{
        FileWriter fileWriter = new FileWriter("HW6.flight", true);
        PrintWriter printWriter = new PrintWriter(fileWriter);

        try {
            openConnection();
            conn.setAutoCommit(false);
            statement = conn.createStatement();
            rs = statement.executeQuery("SELECT * FROM Flights WHERE uniqueFlightNumber = "+uniqueFlightNumber+"");
            rs.next();
            String airline = rs.getString("airlineName");
            String origin = rs.getString("originCode");
            String destination = rs.getString("destinationCode");
            String departDate = rs.getString("departureDate");
            String departHour = rs.getString("departureHour");
            String departMin = rs.getString("departureMin");
            String arrivalHour = rs.getString("arrivalHour");
            String arrivalMin = rs.getString("arrivalMin");
            String flightLength = rs.getString("length");
            String confirmation = "";
            confirmation += "Customer Information \n";
            confirmation += "--------------------------\n";
            confirmation += "Name: "+ firstName + " " + lastName + "\n";
            confirmation += "Address: " + payerStreetAddress + ", " + payerCity + ", " + payerState + ", " +
                    payerPostalCode + "\n";
            confirmation += "Phone: " + countryCode + localCode + localNumber + "\n";
            confirmation += "Email: " + Email + "\n\n";
            confirmation += "Flight Information \n";
            confirmation += "--------------------------\n";
            confirmation += "Airline: " + airlineName + "\n";
            confirmation += "Flight number: " + uniqueFlightNumber + "\n";
            confirmation += "Departing from: " + originCode + "\n";
            confirmation += "Destination: " + destinationCode + "\n";
            confirmation += "Date of Departure: " + departDate + "\n";
            confirmation += "Time of Departure: " + departHour + departMin + "\n";
            confirmation += "Arrival Time: " + arrivalHour + arrivalMin + "\n";
            confirmation += "Length of Flight: " + length;
            printWriter.println(confirmation);
            String insertBooking = "INSERT INTO Booking (bookingNumber, payerEmail,"
                    + " payerFirstName, payerLastName, bookingCityCode, bookingDate, numberOfPassengers) VALUES('"+bookingNumber+ " " +payerFirstName+"', "
                    +payerLastName+", '"+bookingCityCode+"', '"+bookingDate+"', '"+numberOfPassengers+"')";
            statement.executeUpdate(insertBooking);
            rs.close();
            statement.close();
            printWriter.close();
            conn.commit();
            conn.close();
            System.out.println("Congratulations! Below is your confirmation.");
            System.out.println();
            System.out.println(confirmation);
            System.out.println();
            System.out.println("Your confirmation has also been saved to the HW6.flight file");
        } catch (SQLException e) {
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
            System.exit(0);
        }
    }
}
