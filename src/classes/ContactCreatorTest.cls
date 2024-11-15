@isTest
private class ContactCreatorTest {

    @isTest
    static void testCreateContact() {
        // Arrange: Set up test data (Contact details)
        String firstName = 'John';
        String lastName = 'Doe';
        String email = 'johndoe@example.com';
        
        // Act: Call the method to test
        Test.startTest();  // Start tracking governor limits
        ContactCreator.createContact(firstName, lastName, email);
        Test.stopTest();   // Stop tracking governor limits
        
        // Assert: Verify the results
        Contact createdContact = [SELECT FirstName, LastName, Email FROM Contact WHERE Email = :email LIMIT 1];
        
        // Validate that the contact was created correctly
        System.assertEquals('John', createdContact.FirstName, 'First name should be John');
        System.assertEquals('Doe', createdContact.LastName, 'Last name should be Doe');
        System.assertEquals('johndoe@example.com', createdContact.Email, 'Email should be johndoe@example.com');
    }
}