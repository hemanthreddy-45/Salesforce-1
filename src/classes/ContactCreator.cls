public class ContactCreator {

    // Method to create a new contact
    public static void createContact(String firstName, String lastName, String email) {
        // Create a new Contact object
        Contact newContact = new Contact(
            FirstName = firstName,
            LastName = lastName,
            Email = email
        );
        
        // Insert the new contact into the database
        try {
            insert newContact;
        } catch (DmlException e) {
            // Log the error if insertion fails
            System.debug('Error inserting contact: ' + e.getMessage());
        }
    }
}