public class AccountHandler {
    
    // Method to update the AnnualRevenue field for accounts
    public static void updateAccountRevenue(List<Account> accounts) {
        // Check if the accounts list is not empty
        if(accounts != null && !accounts.isEmpty()) {
            for(Account acc : accounts) {
                // Update the AnnualRevenue field if the account's industry is 'Technology'
                if(acc.Industry == 'Technology') {
                    acc.AnnualRevenue = 1000000;  // Set revenue to 1 million if Industry is Technology
                }
            }
            // Update accounts in the database
            update accounts;
        }
    }
}