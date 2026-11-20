@isTest
public class AccountHandlerTest {

    // Test method for updateAccountRevenue
    @isTest
    public static void testUpdateAccountRevenue() {
        
        // Create test data: a list of Account records - checking
        List<Account> testAccounts = new List<Account>{
            new Account(Name = 'Test Account 1', Industry = 'Technology'),
            new Account(Name = 'Test Account 2', Industry = 'Healthcare'),
            new Account(Name = 'Test Account 3', Industry = 'Technology')
        };
        
        // Insert test data
        insert testAccounts;
        
        // Run the method we want to test
        Test.startTest();
        AccountHandler.updateAccountRevenue(testAccounts);
        Test.stopTest();
        
        // Verify the results: check if the AnnualRevenue was updated for Technology accounts
        Account acc1 = [SELECT AnnualRevenue FROM Account WHERE Name = 'Test Account 1' LIMIT 1];
        Account acc2 = [SELECT AnnualRevenue FROM Account WHERE Name = 'Test Account 2' LIMIT 1];
        Account acc3 = [SELECT AnnualRevenue FROM Account WHERE Name = 'Test Account 3' LIMIT 1];
        
        // Assert that the revenue for 'Technology' accounts was updated to 1 million
        System.assertEquals(1000000, acc1.AnnualRevenue, 'AnnualRevenue should be 1 million for Technology account');
        System.assertEquals(null, acc2.AnnualRevenue, 'AnnualRevenue should remain null for non-Technology account');
        System.assertEquals(1000000, acc3.AnnualRevenue, 'AnnualRevenue should be 1 million for Technology account');
    }
}